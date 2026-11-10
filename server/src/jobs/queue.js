import crypto from 'node:crypto';
import { query } from '../db/pool.js';

/**
 * A transactional job queue on PostgreSQL.
 *
 * Why a queue at all: sending an email is a network call to somebody else's
 * server. Done inline in a request, a slow SMTP host becomes a slow booking and
 * an SMTP outage becomes a failed booking — for a booking that was already
 * written to the database successfully. The job is enqueued in the *same
 * transaction* as the booking, so either both exist or neither does.
 *
 * Why Postgres rather than Redis: `FOR UPDATE SKIP LOCKED` gives exactly the
 * semantics a worker pool needs — two workers cannot claim the same row, and a
 * worker that dies mid-job leaves its lock to be reclaimed. Adding Redis to a
 * deployment that already has Postgres would add a moving part and a failure
 * mode for no capability we do not already have at this scale.
 */

/**
 * @param {object} opts
 * @param {import('pg').PoolClient} [opts.client] run inside the caller's transaction
 * @param {Date|number} [opts.delayMs] do not run before now + delayMs
 * @param {string} [opts.dedupeKey] enqueue at most once for this key
 * @param {number} [opts.maxAttempts]
 */
export async function enqueue(type, payload = {}, opts = {}) {
  const {
    client, delayMs = 0, dedupeKey = null, maxAttempts = 5,
  } = opts;
  const run = client ? client.query.bind(client) : query;
  const { rows } = await run(
    `INSERT INTO jobs (type, payload, run_at, dedupe_key, max_attempts)
     VALUES ($1, $2, now() + ($3 || ' milliseconds')::interval, $4, $5)
     ON CONFLICT (dedupe_key) WHERE dedupe_key IS NOT NULL DO NOTHING
     RETURNING *`,
    [type, JSON.stringify(payload), String(delayMs), dedupeKey, maxAttempts],
  );
  return rows[0] || null; // null means the dedupe key already existed
}

/**
 * Claims one due job for this worker.
 *
 * The UPDATE ... WHERE id = (SELECT ... FOR UPDATE SKIP LOCKED) form is the
 * important part: SKIP LOCKED makes concurrent workers step over rows another
 * worker is holding instead of blocking behind them, so throughput scales with
 * workers rather than serialising behind one.
 */
export async function claim(workerId) {
  const { rows } = await query(
    `UPDATE jobs SET status = 'running', locked_at = now(), locked_by = $1, attempts = attempts + 1
     WHERE id = (
       SELECT id FROM jobs
       WHERE status = 'pending' AND run_at <= now()
       ORDER BY run_at, created_at
       FOR UPDATE SKIP LOCKED
       LIMIT 1
     )
     RETURNING *`,
    [workerId],
  );
  return rows[0] || null;
}

export async function complete(jobId, result = {}) {
  await query(
    `UPDATE jobs SET status = 'done', finished_at = now(), locked_at = NULL, locked_by = NULL,
            payload = payload || $2::jsonb
     WHERE id = $1`,
    [jobId, JSON.stringify({ result })],
  );
}

/**
 * Marks a job failed. If attempts remain, it is rescheduled with exponential
 * backoff and jitter — jitter matters because a hundred jobs that failed at the
 * same instant would otherwise all retry at the same instant and re-create the
 * outage that caused them to fail.
 */
export async function fail(jobId, error, { baseDelayMs = 2000, maxDelayMs = 5 * 60_000 } = {}) {
  const { rows } = await query('SELECT attempts, max_attempts FROM jobs WHERE id = $1', [jobId]);
  const job = rows[0];
  if (!job) return { status: 'unknown' };

  const message = String(error?.message || error).slice(0, 1000);

  if (job.attempts >= job.max_attempts) {
    await query(
      `UPDATE jobs SET status = 'failed', last_error = $2, finished_at = now(),
              locked_at = NULL, locked_by = NULL
       WHERE id = $1`,
      [jobId, message],
    );
    return { status: 'failed', attempts: job.attempts };
  }

  const backoff = Math.min(baseDelayMs * 2 ** (job.attempts - 1), maxDelayMs);
  const jitter = Math.floor(Math.random() * backoff * 0.25);
  const delay = backoff + jitter;

  await query(
    `UPDATE jobs SET status = 'pending', last_error = $2, locked_at = NULL, locked_by = NULL,
            run_at = now() + ($3 || ' milliseconds')::interval
     WHERE id = $1`,
    [jobId, message, String(delay)],
  );
  return { status: 'retry', attempts: job.attempts, retryInMs: delay };
}

/**
 * Reclaims jobs whose worker died. A job held by a worker that vanished would
 * otherwise sit in 'running' forever; anything locked for longer than the
 * visibility timeout is treated as abandoned.
 */
export async function reclaimStale({ visibilityTimeoutMs = 5 * 60_000 } = {}) {
  const { rows } = await query(
    `UPDATE jobs SET status = 'pending', locked_at = NULL, locked_by = NULL
     WHERE status = 'running'
       AND locked_at < now() - ($1 || ' milliseconds')::interval
     RETURNING id`,
    [String(visibilityTimeoutMs)],
  );
  return rows.length;
}

export async function stats() {
  const { rows } = await query(
    `SELECT status, count(*)::int AS n FROM jobs GROUP BY status ORDER BY status`,
  );
  return Object.fromEntries(rows.map((r) => [r.status, r.n]));
}

export async function listJobs({ status, limit = 50 } = {}) {
  const params = [];
  let where = 'WHERE 1=1';
  if (status) { params.push(status); where += ` AND status = $${params.length}`; }
  params.push(limit);
  const { rows } = await query(
    `SELECT id, type, status, attempts, max_attempts, run_at, last_error, created_at, finished_at
     FROM jobs ${where} ORDER BY created_at DESC LIMIT $${params.length}`,
    params,
  );
  return rows;
}

export function newWorkerId(prefix = 'worker') {
  return `${prefix}-${process.pid}-${crypto.randomBytes(3).toString('hex')}`;
}
