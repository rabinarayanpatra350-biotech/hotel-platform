import 'dotenv/config';

/**
 * Configuration is read once, validated once, and then frozen. Anything that is
 * missing or obviously wrong fails at boot rather than at 2am in a request
 * handler — a missing JWT secret must never degrade silently into "no auth".
 */
const bool = (v, d = false) => (v === undefined ? d : /^(1|true|yes)$/i.test(String(v)));
const int = (v, d) => (v === undefined || v === '' ? d : Number.parseInt(v, 10));

const env = process.env.NODE_ENV || 'development';
const isProd = env === 'production';

const config = {
  env,
  isProd,
  port: int(process.env.PORT, 4000),
  databaseUrl: process.env.DATABASE_URL || 'postgres://postgres:postgres@localhost:5432/hotel',
  jwt: {
    accessSecret: process.env.JWT_ACCESS_SECRET || (isProd ? '' : 'dev-access-secret-change-me'),
    refreshSecret: process.env.JWT_REFRESH_SECRET || (isProd ? '' : 'dev-refresh-secret-change-me'),
    accessTtl: process.env.JWT_ACCESS_TTL || '15m',
    refreshTtlDays: int(process.env.JWT_REFRESH_TTL_DAYS, 30),
    issuer: 'hotel-platform',
  },
  cors: {
    origins: (process.env.CORS_ORIGINS || 'http://localhost:5173')
      .split(',').map((s) => s.trim()).filter(Boolean),
  },
  uploads: {
    dir: process.env.UPLOAD_DIR || 'uploads',
    maxBytes: int(process.env.UPLOAD_MAX_BYTES, 5 * 1024 * 1024),
    publicBaseUrl: process.env.UPLOAD_PUBLIC_BASE_URL || '',
  },
  rateLimit: {
    windowMs: int(process.env.RATE_LIMIT_WINDOW_MS, 15 * 60 * 1000),
    max: int(process.env.RATE_LIMIT_MAX, 300),
    authMax: int(process.env.RATE_LIMIT_AUTH_MAX, 20),
  },
  logLevel: process.env.LOG_LEVEL || (isProd ? 'info' : 'debug'),
  fx: {
    // Fallback USD->INR rate used only when a row carries no explicit rate.
    usdInr: Number(process.env.FX_USD_INR || 84.5),
  },
};

const problems = [];
if (isProd) {
  if (!config.jwt.accessSecret || config.jwt.accessSecret.length < 32) {
    problems.push('JWT_ACCESS_SECRET must be set to at least 32 characters in production');
  }
  if (!config.jwt.refreshSecret || config.jwt.refreshSecret.length < 32) {
    problems.push('JWT_REFRESH_SECRET must be set to at least 32 characters in production');
  }
  if (!process.env.DATABASE_URL) problems.push('DATABASE_URL is required in production');
  if (config.cors.origins.includes('*')) problems.push('CORS_ORIGINS must not be "*" in production');
}
if (problems.length) {
  throw new Error(`Invalid configuration:\n  - ${problems.join('\n  - ')}`);
}

export default Object.freeze(config);
export { isProd };
