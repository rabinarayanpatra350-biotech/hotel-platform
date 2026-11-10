import { describe, it, expect, beforeAll } from 'vitest';
import { app, request, uniq, makeUser, auth, sampleProperty, sampleRoom, query } from '../helpers.js';
import { enqueue, claim, complete, fail, reclaimStale, stats, newWorkerId } from '../../src/jobs/queue.js';
import { createWorker } from '../../src/jobs/worker.js';
import { getHandler } from '../../src/jobs/handlers.js';

const cleanJobs = () => query("DELETE FROM jobs WHERE type LIKE 'test_%'");

/**
 * Cancels every pending job so the next claim() is guaranteed to pick up the one
 * the test just enqueued. claim() takes the oldest due job by design, so without
 * this a test would be racing whatever the previous test left behind.
 */
const drainQueue = () => query("UPDATE jobs SET status = 'cancelled' WHERE status = 'pending'");

describe('the job queue', () => {
  beforeAll(cleanJobs);

  it('enqueues a job in the pending state', async () => {
    const job = await enqueue('test_noop', { a: 1 });
    expect(job.status).toBe('pending');
    expect(job.attempts).toBe(0);
    expect(job.payload).toEqual({ a: 1 });
  });

  it('does not claim a job scheduled for the future', async () => {
    await enqueue('test_future', {}, { delayMs: 60_000 });
    const claimed = await claim(newWorkerId('t'));
    expect(claimed?.type).not.toBe('test_future');
  });

  it('claims a due job and marks it running with an incremented attempt count', async () => {
    const created = await enqueue('test_claim', {});
    const claimed = await claim(newWorkerId('t'));
    expect(claimed.id).toBe(created.id);
    expect(claimed.status).toBe('running');
    expect(claimed.attempts).toBe(1);
  });

  it('marks a claimed job done', async () => {
    const created = await enqueue('test_done', {});
    await claim(newWorkerId('t'));
    await complete(created.id, { ok: true });
    const { rows } = await query('SELECT status, finished_at FROM jobs WHERE id = $1', [created.id]);
    expect(rows[0].status).toBe('done');
    expect(rows[0].finished_at).not.toBeNull();
  });

  it('reschedules a failed job with backoff rather than failing it outright', async () => {
    const created = await enqueue('test_retry', {});
    await claim(newWorkerId('t'));
    const outcome = await fail(created.id, new Error('smtp timeout'));
    expect(outcome.status).toBe('retry');
    expect(outcome.retryInMs).toBeGreaterThan(0);

    const { rows } = await query(
      'SELECT status, last_error, run_at > now() AS in_future FROM jobs WHERE id = $1', [created.id],
    );
    expect(rows[0].status).toBe('pending');
    expect(rows[0].last_error).toContain('smtp timeout');
    expect(rows[0].in_future).toBe(true);
  });

  it('gives up after max_attempts and records the final error', async () => {
    const created = await enqueue('test_exhaust', {}, { maxAttempts: 1 });
    await claim(newWorkerId('t'));
    const outcome = await fail(created.id, new Error('permanent failure'));
    expect(outcome.status).toBe('failed');
    const { rows } = await query('SELECT status, last_error FROM jobs WHERE id = $1', [created.id]);
    expect(rows[0].status).toBe('failed');
    expect(rows[0].last_error).toContain('permanent failure');
  });

  it('enqueues at most once for a repeated dedupe key', async () => {
    const key = `test-dedupe-${Date.now()}`;
    const first = await enqueue('test_dedupe', {}, { dedupeKey: key });
    const second = await enqueue('test_dedupe', {}, { dedupeKey: key });
    expect(first).not.toBeNull();
    expect(second).toBeNull();
  });

  it('reclaims a job whose worker died mid-flight', async () => {
    const created = await enqueue('test_stale', {});
    // Simulate a worker that claimed the job and then vanished.
    await query(
      `UPDATE jobs SET status = 'running', locked_at = now() - interval '10 minutes',
              locked_by = 'dead-worker' WHERE id = $1`, [created.id],
    );
    const reclaimed = await reclaimStale({ visibilityTimeoutMs: 60_000 });
    expect(reclaimed).toBeGreaterThanOrEqual(1);
    const { rows } = await query('SELECT status FROM jobs WHERE id = $1', [created.id]);
    expect(rows[0].status).toBe('pending');
  });

  it('never lets two workers claim the same job', async () => {
    // FOR UPDATE SKIP LOCKED is the guarantee under test. Ten concurrent claims
    // must produce ten distinct jobs, not ten copies of one.
    const ids = [];
    for (let i = 0; i < 10; i += 1) ids.push((await enqueue('test_concurrent', { i })).id);

    const claims = await Promise.all(
      Array.from({ length: 10 }, (_, i) => claim(newWorkerId(`w${i}`))),
    );
    const claimedIds = claims.filter(Boolean).map((c) => c.id);
    expect(new Set(claimedIds).size).toBe(claimedIds.length);
    expect(claimedIds.length).toBe(10);
  });

  it('reports counts by status', async () => {
    const s = await stats();
    expect(s).toHaveProperty('pending');
    expect(typeof s.pending).toBe('number');
  });

  it('refuses to dispatch an unknown job type', () => {
    expect(() => getHandler('test_not_a_real_type')).toThrow(/No handler registered/);
  });
});

describe('the worker', () => {
  it('processes one due job per tick and counts it', async () => {
    await drainQueue();
    // A type that has a real handler, so this exercises the success path. Using a
    // made-up test_* type here would exercise the failure path instead, which is
    // what the next test is for.
    await enqueue('nightly_occupancy_rollup', { from: '2027-01-01', to: '2027-02-01' });
    const worker = createWorker({ workerId: newWorkerId('tw') });
    await worker.tick();
    expect(worker.counters.processed).toBe(1);
    expect(worker.counters.succeeded).toBe(1);
  });

  it('retries a job whose handler throws instead of losing it', async () => {
    // 'test_always_fails' has no handler, so dispatch throws — which is exactly
    // the failure path a broken handler takes.
    await drainQueue();
    const created = await enqueue('test_always_fails', {}, { maxAttempts: 2 });
    const worker = createWorker({ workerId: newWorkerId('tw') });
    await worker.tick();
    const { rows } = await query('SELECT status, attempts, last_error FROM jobs WHERE id = $1', [created.id]);
    expect(rows[0].attempts).toBe(1);
    expect(['pending', 'failed']).toContain(rows[0].status);
    expect(String(rows[0].last_error)).toMatch(/No handler registered/);
  });
});

describe('email notifications, end to end', () => {
  let property; let room; let admin;

  beforeAll(async () => {
    property = await sampleProperty();
    room = await sampleRoom(property.id);
    admin = await makeUser({ email: uniq('jobsadmin'), role: 'admin' });
  });

  it('queues a guest confirmation and a staff alert when a booking is made', async () => {
    const guestEmail = uniq('jobguest');
    const before = await query('SELECT count(*)::int c FROM jobs');
    const res = await request(app).post('/api/bookings').send({
      propertyId: property.id,
      roomId: room.id,
      checkIn: '2027-09-01',
      checkOut: '2027-09-04',
      roomsBooked: 1,
      adults: 2,
      guest: { fullName: 'Job Guest', email: guestEmail },
    });
    expect(res.status).toBe(201);

    const after = await query('SELECT count(*)::int c FROM jobs');
    expect(after.rows[0].c).toBe(before.rows[0].c + 2);

    const { rows } = await query(
      `SELECT type FROM jobs WHERE payload::text LIKE $1 ORDER BY type`,
      [`%${res.body.data.reference}%`],
    );
    expect(rows.map((r) => r.type)).toEqual(['booking_confirmation', 'staff_booking_alert']);
  });

  it('actually delivers those emails when the worker runs', async () => {
    const guestEmail = uniq('deliver');
    const res = await request(app).post('/api/bookings').send({
      propertyId: property.id,
      checkIn: '2027-10-01',
      checkOut: '2027-10-03',
      guest: { fullName: 'Deliver Guest', email: guestEmail },
    });
    expect(res.status).toBe(201);

    const worker = createWorker({ workerId: newWorkerId('tw') });
    // Drain the queue: enough ticks to cover both jobs for this booking.
    for (let i = 0; i < 12; i += 1) await worker.tick();

    const { rows } = await query(
      `SELECT template, status FROM email_log WHERE to_address = $1 ORDER BY id`, [guestEmail],
    );
    expect(rows.length).toBeGreaterThanOrEqual(1);
    expect(rows[0].template).toBe('booking_confirmation');
    expect(rows[0].status).toBe('sent');
  });

  it('queues and sends an acknowledgement for an enquiry', async () => {
    const email = uniq('enquirer');
    const res = await request(app).post('/api/enquiries').send({
      propertyId: property.id, name: 'Enquiry Person', email, message: 'Is there parking for a van?',
    });
    expect(res.status).toBe(201);

    const worker = createWorker({ workerId: newWorkerId('tw') });
    for (let i = 0; i < 12; i += 1) await worker.tick();

    const { rows } = await query(
      'SELECT template, status FROM email_log WHERE to_address = $1', [email],
    );
    expect(rows[0]).toMatchObject({ template: 'enquiry_acknowledgement', status: 'sent' });
  });

  it('does not queue a confirmation for a cancelled booking', async () => {
    const before = await query('SELECT count(*)::int c FROM jobs');
    await request(app).post('/api/bookings').send({
      propertyId: property.id,
      checkIn: '2027-11-01',
      checkOut: '2027-11-03',
      status: 'cancelled',
      guest: { fullName: 'Cancelled Guest', email: uniq('cancelled') },
    });
    const after = await query('SELECT count(*)::int c FROM jobs');
    // staff alert is still useful for a cancellation; the guest confirmation is not
    expect(after.rows[0].c - before.rows[0].c).toBeLessThanOrEqual(1);
  });

  it('exposes the queue and the email log to staff', async () => {
    const q = await request(app).get('/api/jobs').set(auth(admin.token));
    expect(q.status).toBe(200);
    expect(q.body.data.counts).toBeTruthy();
    expect(q.body.data.emailTransport).toBe('record');

    const e = await request(app).get('/api/jobs/emails').set(auth(admin.token));
    expect(e.status).toBe(200);
    expect(Array.isArray(e.body.data)).toBe(true);
  });

  it('keeps the queue away from guests', async () => {
    const guest = await makeUser({ email: uniq('jobguest2'), role: 'guest' });
    const res = await request(app).get('/api/jobs').set(auth(guest.token));
    expect(res.status).toBe(403);
  });
});
