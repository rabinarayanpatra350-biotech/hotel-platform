import { defineConfig } from 'vitest/config';

export default defineConfig({
  test: {
    globalSetup: ['./tests/globalSetup.js'],
    setupFiles: ['./tests/setupEnv.js'],
    environment: 'node',
    // The API tests share one PostgreSQL instance, so they run in a single fork
    // and clean up after themselves rather than racing each other.
    // One fork, one isolate: the sandbox has 2 GB and V8 will refuse to reserve
    // a CodeRange per worker if several spawn at once. Isolated:false also keeps
    // the module graph warm across files, which is most of the speed anyway.
    pool: 'forks',
    poolOptions: { forks: { singleFork: true, isolate: false, minForks: 1, maxForks: 1 } },
    fileParallelism: false,
    sequence: { concurrent: false },
    testTimeout: 30_000,
    hookTimeout: 120_000,
    include: ['tests/**/*.test.js'],
    coverage: { provider: 'v8', include: ['src/**/*.js'], reporter: ['text', 'lcov'] },
  },
});
