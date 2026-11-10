import serverless from 'serverless-http';
import { createApp } from '../../server/src/app.js';
import { createWorker, } from '../../server/src/jobs/worker.js';

/**
 * The Express API, as a Netlify function.
 *
 * The app module is imported unchanged — it never calls listen(), which is what
 * makes it runnable both as a long-lived server (`npm start`) and as a request
 * handler here. serverless-http adapts the (event, context) pair to Node's
 * req/res.
 *
 * The background worker does not run as a separate process on a serverless host,
 * so one job is drained after each request. That is a deliberate adaptation
 * rather than a pretend one: the queue still provides its real benefits — the
 * job is enqueued transactionally with the booking, retries on failure, and is
 * observable at /api/jobs — it is only the *scheduling* that moves.
 */
const app = createApp();
const handler = serverless(app, { basePath: '/api' });
const worker = createWorker({ workerId: 'netlify-inline' });

export async function handler(event, context) {
  // Don't let the platform wait on an idle keep-alive connection.
  context.callbackWaitsForEmptyEventLoop = false;

  const response = await handler(event, context);

  // Drain at most one queued job per invocation, after the response is built.
  // Failure here must never affect the response the client already earned.
  try {
    await worker.tick();
  } catch { /* logged by the worker */ }

  return response;
}

export default handler;
