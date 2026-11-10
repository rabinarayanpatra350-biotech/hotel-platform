import { claim, complete, fail, reclaimStale, newWorkerId } from './queue.js';
import { getHandler } from './handlers.js';
import logger from '../lib/logger.js';
import config from '../config/index.js';

/**
 * The worker loop.
 *
 * One job at a time per worker, deliberately: a single process handling one job
 * at a time is trivially correct, and throughput is scaled by running more
 * workers — which the queue supports because claim() uses SKIP LOCKED. Scaling
 * out is a deployment decision, not a rewrite.
 */
export function createWorker({ workerId = newWorkerId(), pollIntervalMs = config.jobs.pollIntervalMs } = {}) {
  let running = false;
  let timer = null;
  let stopped = false;
  const counters = { processed: 0, succeeded: 0, failed: 0, retried: 0 };

  async function tick() {
    if (running || stopped) return;
    running = true;
    try {
      const job = await claim(workerId);
      if (!job) return;

      try {
        const handler = getHandler(job.type);
        const result = await handler(job.payload, job);
        await complete(job.id, result);
        counters.processed += 1;
        counters.succeeded += 1;
        logger.debug({ jobId: job.id, type: job.type }, 'job done');
      } catch (err) {
        const outcome = await fail(job.id, err);
        counters.processed += 1;
        if (outcome.status === 'retry') counters.retried += 1;
        else counters.failed += 1;
        logger.warn({ jobId: job.id, type: job.type, outcome, err: err.message }, 'job failed');
      }
    } catch (err) {
      // A database blip must not kill the loop.
      logger.error({ err: err.message }, 'worker tick failed');
    } finally {
      running = false;
    }
  }

  return {
    workerId,
    counters,
    /** Processes exactly one job — used by tests so they need no timers. */
    tick,
    start() {
      stopped = false;
      reclaimStale({ visibilityTimeoutMs: config.jobs.visibilityTimeoutMs })
        .then((n) => { if (n) logger.info({ reclaimed: n }, 'reclaimed stale jobs'); })
        .catch(() => {});
      timer = setInterval(tick, pollIntervalMs);
      if (timer.unref) timer.unref();
      logger.info({ workerId, pollIntervalMs }, 'worker started');
      return this;
    },
    async stop() {
      stopped = true;
      if (timer) clearInterval(timer);
      // Let an in-flight job finish rather than abandoning it mid-send.
      while (running) await new Promise((r) => setTimeout(r, 25));
      logger.info({ workerId, counters }, 'worker stopped');
    },
  };
}

// `npm run worker`
if (import.meta.url === `file://${process.argv[1]}`) {
  const worker = createWorker().start();
  const shutdown = async () => { await worker.stop(); process.exit(0); };
  process.on('SIGTERM', shutdown);
  process.on('SIGINT', shutdown);
}
