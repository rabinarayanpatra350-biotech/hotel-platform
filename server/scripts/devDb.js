/**
 * devDb.js — a throwaway PostgreSQL server for local development and tests.
 *
 * The application only ever needs DATABASE_URL. This helper exists so that
 * `npm run db:local` (and the test suite) gets a real PostgreSQL instance with no
 * Docker daemon and no system install. It drives the official PostgreSQL
 * binaries that ship with the `embedded-postgres` package directly — initdb,
 * pg_ctl and createdb — because that is the whole job, and wrapping them in a
 * few execFileSync calls is easier to debug than a library that swallows the
 * underlying error.
 *
 * CI uses a Postgres service container instead, and production uses a managed
 * instance. All three speak the same protocol through the same driver, so the
 * code path under test is the code path that ships.
 */
import { execFileSync } from 'node:child_process';
import { existsSync, mkdirSync, rmSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
const here = dirname(fileURLToPath(import.meta.url));

function binDir() {
  // The platform-specific package does not export ./package.json, so the
  // directory is resolved from the project root with a short candidate list.
  const arch = `${process.platform}-${process.arch === 'x64' ? 'x64' : process.arch}`;
  const candidates = [
    join(here, '..', 'node_modules', '@embedded-postgres', arch, 'native', 'bin'),
    join(here, '..', '..', 'node_modules', '@embedded-postgres', arch, 'native', 'bin'),
    join(process.cwd(), 'node_modules', '@embedded-postgres', arch, 'native', 'bin'),
  ];
  for (const c of candidates) {
    if (existsSync(join(c, 'initdb'))) return c;
  }
  throw new Error(
    `Could not find PostgreSQL binaries. Run \`npm install\` first, or set PG_BIN_DIR. ` +
    `Looked in: ${candidates.join(', ')}`,
  );
}

const BIN = process.env.PG_BIN_DIR || binDir();
const exe = (name) => join(BIN, name);

export async function startDevDb({
  database = 'hotel',
  port = Number(process.env.PG_PORT || 55432),
  dataDir = process.env.PG_DATA_DIR || join(here, '..', '.pgdata'),
} = {}) {
  const fresh = !existsSync(join(dataDir, 'PG_VERSION'));
  if (fresh) {
    rmSync(dataDir, { recursive: true, force: true });
    mkdirSync(dataDir, { recursive: true });
    execFileSync(exe('initdb'), [
      '-D', dataDir, '-U', 'postgres', '--encoding=UTF8', '--locale=C', '-A', 'trust',
    ], { stdio: 'pipe' });
  }

  // -k puts the unix socket in the data dir so two test runs never collide.
  const logFile = join(dataDir, 'server.log');
  execFileSync(exe('pg_ctl'), [
    '-D', dataDir, '-l', logFile, '-o', `-p ${port} -k ${dataDir} -c listen_addresses=127.0.0.1 -c shared_buffers=16MB -c max_connections=20 -c work_mem=4MB`,
    '-w', '-t', '60', 'start',
  ], { stdio: 'pipe' });

  // The package ships only initdb/pg_ctl/postgres, not createdb, so the database
  // is created over the wire. CREATE DATABASE cannot run inside a transaction,
  // which is why this uses a plain client rather than the pool.
  const adminUrl = `postgres://postgres@127.0.0.1:${port}/postgres`;
  const pgMod = await import('pg');
  const client = new pgMod.default.Client({ connectionString: adminUrl });
  await client.connect();
  try {
    const { rows } = await client.query('SELECT 1 FROM pg_database WHERE datname = $1', [database]);
    if (!rows.length) await client.query(`CREATE DATABASE "${database}"`);
  } finally {
    await client.end();
  }

  const url = `postgres://postgres@127.0.0.1:${port}/${database}`;
  return {
    url,
    adminUrl,
    dataDir,
    port,
    stop: () => {
      try {
        execFileSync(exe('pg_ctl'), ['-D', dataDir, '-m', 'fast', '-w', '-t', '60', 'stop'], { stdio: 'pipe' });
      } catch { /* already stopped */ }
    },
  };
}

export { BIN as postgresBinDir };

if (import.meta.url === `file://${process.argv[1]}`) {
  const db = await startDevDb();
  console.log(`DATABASE_URL=${db.url}`);
  console.log('Press Ctrl+C to stop.');
  const stop = () => { db.stop(); process.exit(0); };
  process.on('SIGINT', stop);
  process.on('SIGTERM', stop);
}
