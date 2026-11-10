// Runs before each test file, before any src module is imported, so that
// config/index.js sees the test database rather than the default.
import { readFileSync } from 'node:fs';
import { join, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';

const here = dirname(fileURLToPath(import.meta.url));
try {
  process.env.DATABASE_URL = readFileSync(join(here, '.test-db-url'), 'utf8').trim();
} catch {
  // globalSetup writes this; if it is missing the tests will fail loudly on connect.
}
process.env.NODE_ENV = 'test';
process.env.LOG_LEVEL = 'silent';
