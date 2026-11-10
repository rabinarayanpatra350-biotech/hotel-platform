import pino from 'pino';
import config from '../config/index.js';

export const logger = pino({
  level: config.logLevel,
  redact: {
    // Secrets must never reach a log line, even at debug level.
    paths: [
      'req.headers.authorization',
      'req.headers.cookie',
      'res.headers["set-cookie"]',
      'password',
      '*.password',
      'passwordHash',
      '*.passwordHash',
      'refreshToken',
      '*.refreshToken',
    ],
    censor: '[redacted]',
  },
  transport: config.isProd ? undefined : { target: 'pino/file', options: { destination: 1 } },
});

export default logger;
