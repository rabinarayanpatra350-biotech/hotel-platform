import { verifyAccessToken } from '../lib/tokens.js';
import { ApiError } from '../lib/errors.js';
import { query } from '../db/pool.js';

function bearer(req) {
  const h = req.headers.authorization || '';
  if (h.startsWith('Bearer ')) return h.slice(7).trim();
  return null;
}

/** Requires a valid access token; loads the user so a deactivated account stops working at once. */
export async function requireAuth(req, _res, next) {
  try {
    const token = bearer(req) || req.cookies?.accessToken;
    if (!token) throw ApiError.unauthorized('Authentication required');
    let payload;
    try {
      payload = verifyAccessToken(token);
    } catch {
      throw ApiError.unauthorized('Access token is invalid or has expired');
    }
    const { rows } = await query('SELECT * FROM users WHERE id = $1', [payload.sub]);
    const user = rows[0];
    if (!user || !user.is_active) throw ApiError.unauthorized('Account is not active');
    req.user = { id: user.id, email: user.email, role: user.role, fullName: user.full_name };
    next();
  } catch (e) { next(e); }
}

/** Attaches req.user when a token is present, but never rejects. For public pages that personalise. */
export async function optionalAuth(req, _res, next) {
  const token = bearer(req);
  if (!token) return next();
  try {
    const payload = verifyAccessToken(token);
    const { rows } = await query('SELECT * FROM users WHERE id = $1', [payload.sub]);
    if (rows[0]?.is_active) {
      req.user = { id: rows[0].id, email: rows[0].email, role: rows[0].role, fullName: rows[0].full_name };
    }
  } catch { /* ignore: treated as anonymous */ }
  next();
}

/** Role gate. Used after requireAuth. */
export function requireRole(...roles) {
  return (req, _res, next) => {
    if (!req.user) return next(ApiError.unauthorized());
    if (!roles.includes(req.user.role)) {
      return next(ApiError.forbidden(`This action requires the role: ${roles.join(' or ')}`));
    }
    next();
  };
}
