/**
 * Starts one PostgreSQL instance for the whole run, applies the schema, loads the
 * raw exports through the real ETL, and hands the connection string to the test
 * processes. The tests therefore run against the same schema and the same data
 * that `npm run seed` produces — not a hand-built fixture that could drift.
 */
import { writeFileSync, rmSync } from 'node:fs';
import { join, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';
import { startDevDb } from '../scripts/devDb.js';

const here = dirname(fileURLToPath(import.meta.url));
export const URL_FILE = join(here, '.test-db-url');

export default async function setup() {
  const db = await startDevDb({
    database: 'hotel_test',
    port: Number(process.env.TEST_PG_PORT || 55433),
    dataDir: join(here, '..', '.pgdata-test'),
  });

  process.env.DATABASE_URL = db.url;
  process.env.NODE_ENV = 'test';

  const { migrate } = await import('../src/db/migrate.js');
  await migrate();

  const { runEtl } = await import('../src/etl/run.js');
  await runEtl();

  writeFileSync(URL_FILE, db.url, 'utf8');

  return async () => {
    try { rmSync(URL_FILE, { force: true }); } catch { /* ignore */ }
    try {
      const { closePool } = await import('../src/db/pool.js');
      await closePool();
    } catch { /* pool may already be closed */ }
    db.stop();
  };
}
