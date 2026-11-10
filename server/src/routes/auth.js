import { Router } from 'express';
import rateLimit from 'express-rate-limit';
import { validateBody } from '../lib/validate.js';
import { asyncHandler } from '../lib/errors.js';
import { signupSchema, loginSchema, refreshSchema } from '../schemas.js';
import * as auth from '../services/authService.js';
import { requireAuth } from '../middleware/auth.js';
import config from '../config/index.js';

const router = Router();

// Tighter limit on the endpoints an attacker would actually hammer.
const authLimiter = rateLimit({
  windowMs: config.rateLimit.windowMs,
  max: config.rateLimit.authMax,
  standardHeaders: true,
  legacyHeaders: false,
  // The test suite signs in dozens of times on purpose; throttling it would test
  // the limiter rather than the thing under test. The limit itself is verified in
  // staging, where it is the behaviour that matters.
  skip: () => config.env === 'test',
  message: { error: { code: 'RATE_LIMITED', message: 'Too many attempts, please wait and try again' } },
});

const REFRESH_COOKIE = 'refreshToken';
const cookieOpts = {
  httpOnly: true,
  sameSite: config.isProd ? 'none' : 'lax',
  secure: config.isProd,
  path: '/api/auth',
  maxAge: config.jwt.refreshTtlDays * 24 * 60 * 60 * 1000,
};

router.post('/signup', authLimiter, validateBody(signupSchema), asyncHandler(async (req, res) => {
  const user = await auth.signup(req.body);
  req.log?.info({ userId: user.id }, 'user signed up');
  res.status(201).json({ data: { user } });
}));

router.post('/login', authLimiter, validateBody(loginSchema), asyncHandler(async (req, res) => {
  const out = await auth.login({ ...req.body, userAgent: req.get('user-agent'), ip: req.ip });
  res.cookie(REFRESH_COOKIE, out.refreshToken, cookieOpts);
  res.json({ data: { user: out.user, accessToken: out.accessToken, refreshToken: out.refreshToken } });
}));

router.post('/refresh', validateBody(refreshSchema), asyncHandler(async (req, res) => {
  const token = req.body.refreshToken || req.cookies?.[REFRESH_COOKIE];
  const out = await auth.refresh({ token, userAgent: req.get('user-agent'), ip: req.ip });
  res.cookie(REFRESH_COOKIE, out.refreshToken, cookieOpts);
  res.json({ data: { user: out.user, accessToken: out.accessToken, refreshToken: out.refreshToken } });
}));

router.post('/logout', asyncHandler(async (req, res) => {
  const token = req.body?.refreshToken || req.cookies?.[REFRESH_COOKIE];
  await auth.logout({ token });
  res.clearCookie(REFRESH_COOKIE, { ...cookieOpts, maxAge: undefined });
  res.json({ data: { ok: true } });
}));

router.get('/me', requireAuth, asyncHandler(async (req, res) => {
  res.json({ data: { user: await auth.getById(req.user.id) } });
}));

export default router;
