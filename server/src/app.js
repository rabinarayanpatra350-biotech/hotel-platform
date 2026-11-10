import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import compression from 'compression';
import cookieParser from 'cookie-parser';
import rateLimit from 'express-rate-limit';
import pinoHttp from 'pino-http';
import crypto from 'node:crypto';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';

import config from './config/index.js';
import logger from './lib/logger.js';
import { errorHandler, notFoundHandler } from './lib/errors.js';
import routes from './routes/index.js';

const here = dirname(fileURLToPath(import.meta.url));

export function createApp() {
  const app = express();

  // Behind Render/Vercel the client IP arrives in X-Forwarded-For; without this
  // the rate limiter would see every request coming from the proxy.
  app.set('trust proxy', 1);
  app.disable('x-powered-by');

  app.use(helmet({
    crossOriginResourcePolicy: { policy: 'cross-origin' },
    contentSecurityPolicy: config.isProd ? undefined : false,
  }));
  app.use(cors({
    origin: config.cors.origins.includes('*') ? true : config.cors.origins,
    credentials: true,
  }));
  app.use(compression());
  app.use(express.json({ limit: '1mb' }));
  app.use(express.urlencoded({ extended: true, limit: '1mb' }));
  app.use(cookieParser());

  app.use((req, res, next) => {
    req.id = req.get('x-request-id') || crypto.randomUUID();
    res.setHeader('x-request-id', req.id);
    next();
  });

  if (config.env !== 'test') {
    app.use(pinoHttp({ logger, genReqId: (req) => req.id }));
  }

  app.use(rateLimit({
    windowMs: config.rateLimit.windowMs,
    max: config.rateLimit.max,
    standardHeaders: true,
    legacyHeaders: false,
    skip: () => config.env === 'test',
  }));

  // Uploaded images are served read-only; they are never executed.
  app.use('/uploads', express.static(join(process.cwd(), config.uploads.dir), {
    maxAge: '7d', index: false, dotfiles: 'deny',
  }));

  app.get('/', (_req, res) => res.json({
    data: { name: 'Mumbai Boutique Hotels API', version: '1.0.0', docs: '/api/docs', health: '/api/health' },
  }));

  app.use('/api', routes);
  app.use('/api/docs', express.static(join(here, '..', '..', 'docs', 'openapi'), { index: 'index.html' }));

  app.use(notFoundHandler);
  app.use(errorHandler);

  return app;
}

export default createApp;
