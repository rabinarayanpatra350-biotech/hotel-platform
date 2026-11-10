import { createApp } from './app.js';
import config from './config/index.js';
import logger from './lib/logger.js';
import { closePool } from './db/pool.js';

const app = createApp();

const server = app.listen(config.port, () => {
  logger.info({ port: config.port, env: config.env }, 'API listening');
});

// Graceful shutdown: stop accepting, let in-flight requests finish, then close
// the pool. Without this a deploy can cut a request mid-transaction.
async function shutdown(signal) {
  logger.info({ signal }, 'shutting down');
  server.close(async () => {
    try { await closePool(); } catch { /* already closed */ }
    process.exit(0);
  });
  setTimeout(() => process.exit(1), 10_000).unref();
}

process.on('SIGTERM', () => shutdown('SIGTERM'));
process.on('SIGINT', () => shutdown('SIGINT'));

export default server;
