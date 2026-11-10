import crypto from 'node:crypto';
import jwt from 'jsonwebtoken';
import config from '../config/index.js';

export function signAccessToken(user) {
  return jwt.sign(
    { sub: user.id, role: user.role, email: user.email },
    config.jwt.accessSecret,
    { expiresIn: config.jwt.accessTtl, issuer: config.jwt.issuer, audience: 'hotel-api' },
  );
}

export function verifyAccessToken(token) {
  return jwt.verify(token, config.jwt.accessSecret, {
    issuer: config.jwt.issuer,
    audience: 'hotel-api',
  });
}

/**
 * Refresh tokens are opaque random strings, not JWTs. That matters: an opaque
 * token can be revoked the instant it is used, whereas a self-contained JWT
 * stays valid until it expires no matter what the server thinks.
 */
export function newRefreshToken() {
  const token = crypto.randomBytes(48).toString('base64url');
  return { token, hash: hashToken(token) };
}

export function hashToken(token) {
  return crypto.createHash('sha256').update(token).digest('hex');
}

export function refreshExpiry() {
  const d = new Date();
  d.setDate(d.getDate() + config.jwt.refreshTtlDays);
  return d;
}
