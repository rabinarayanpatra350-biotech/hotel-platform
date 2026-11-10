import pg from 'pg';
import config from '../config/index.js';

// Postgres returns NUMERIC as a string to avoid precision loss. For this
// application rates are money with two decimals and are safe as numbers once
// they are read; keeping the driver default would push string maths into every
// handler, which is exactly how "10" + "5" = "105" bugs happen.
pg.types.setTypeParser(1700, (v) => (v === null ? null : Number.parseFloat(v)));
// COUNT(*) comes back as a string for the same reason; the dashboard wants numbers.
pg.types.setTypeParser(20, (v) => (v === null ? null : Number.parseInt(v, 10)));

export const pool = new pg.Pool({
  connectionString: config.databaseUrl,
  max: config.isProd ? 20 : 5,
  idleTimeoutMillis: 30_000,
  connectionTimeoutMillis: 10_000,
  ssl: process.env.DATABASE_SSL === 'true' ? { rejectUnauthorized: false } : undefined,
});

pool.on('error', (err) => {
  // A dead idle client must not take the process down.
  // eslint-disable-next-line no-console
  console.error('Unexpected idle client error', err.message);
});

export async function query(text, params) {
  const started = Date.now();
  const res = await pool.query(text, params);
  const ms = Date.now() - started;
  if (ms > 200 && process.env.NODE_ENV !== 'test') {
    // eslint-disable-next-line no-console
    console.warn(`slow query ${ms}ms: ${text.slice(0, 120)}`);
  }
  return res;
}

/** Runs a callback inside a transaction, rolling back on any throw. */
export async function withTransaction(fn) {
  const client = await pool.connect();
  try {
    await client.query('BEGIN');
    const out = await fn(client);
    await client.query('COMMIT');
    return out;
  } catch (err) {
    await client.query('ROLLBACK').catch(() => {});
    throw err;
  } finally {
    client.release();
  }
}

export async function closePool() {
  await pool.end();
}
