import crypto from 'node:crypto';
import bcrypt from 'bcryptjs';
import { query, withTransaction } from '../db/pool.js';
import { ApiError } from '../lib/errors.js';
import { signAccessToken, newRefreshToken, hashToken, refreshExpiry } from '../lib/tokens.js';
import config from '../config/index.js';

const ROUNDS = 10;

export const hashPassword = (pw) => bcrypt.hash(pw, ROUNDS);
export const verifyPassword = (pw, hash) => bcrypt.compare(pw, hash);

const publicUser = (u) => ({
  id: u.id, email: u.email, fullName: u.full_name, role: u.role, isActive: u.is_active,
});

async function issueRefresh(userId, familyId, meta) {
  const { token, hash } = newRefreshToken();
  const row = await query(
    `INSERT INTO refresh_tokens (user_id, token_hash, family_id, expires_at, user_agent, ip)
     VALUES ($1, $2, $3, $4, $5, $6) RETURNING id`,
    [userId, hash, familyId, refreshExpiry(), meta.userAgent || null, meta.ip || null],
  );
  return { token, id: row.rows[0].id };
}

export async function signup({ email, password, fullName }) {
  const exists = await query('SELECT 1 FROM users WHERE lower(email) = lower($1)', [email]);
  if (exists.rowCount) throw ApiError.conflict('An account with that email already exists');

  // Public sign-up always creates a guest. Staff and admin accounts are created
  // by an admin, because otherwise the first person to register gets the keys.
  const hash = await hashPassword(password);
  const { rows } = await query(
    `INSERT INTO users (email, password_hash, full_name, role)
     VALUES ($1, $2, $3, 'guest') RETURNING *`,
    [email, hash, fullName],
  );
  return publicUser(rows[0]);
}

export async function login({ email, password, userAgent, ip }) {
  const { rows } = await query('SELECT * FROM users WHERE lower(email) = lower($1)', [email]);
  const user = rows[0];

  // Constant-ish work whether or not the user exists, so response time does not
  // reveal which emails are registered.
  const ok = user ? await verifyPassword(password, user.password_hash) : await bcrypt.compare(password, '$2a$10$invalidinvalidinvalidinvalidinvalidinvalidinvalidinva');
  if (!user || !ok) throw ApiError.unauthorized('Email or password is incorrect');
  if (!user.is_active) throw ApiError.forbidden('This account has been deactivated');

  const familyId = crypto.randomUUID();
  const { token: refreshToken } = await issueRefresh(user.id, familyId, { userAgent, ip });
  return { user: publicUser(user), accessToken: signAccessToken(user), refreshToken };
}

/**
 * Rotating refresh. Every use burns the presented token and issues a new one in
 * the same family. If a token that was already burned is presented again, that
 * means two parties hold the same token — so the entire family is revoked and
 * both parties are forced to log in again. This is the standard defence against
 * a stolen refresh token being used alongside the legitimate one.
 */
export async function refresh({ token, userAgent, ip }) {
  if (!token) throw ApiError.unauthorized('Refresh token missing');
  const hash = hashToken(token);

  // Reuse detection has to happen OUTSIDE the rotation transaction. Revoking the
  // family inside it and then throwing would roll the revocation back, leaving
  // the stolen token's sibling alive — which is precisely the attack this is
  // meant to stop. The check therefore commits before the error is raised.
  const pre = await query('SELECT * FROM refresh_tokens WHERE token_hash = $1', [hash]);
  const preRow = pre.rows[0];
  if (!preRow) throw ApiError.unauthorized('Refresh token is not valid');

  if (preRow.revoked_at) {
    await query(
      'UPDATE refresh_tokens SET revoked_at = now() WHERE family_id = $1 AND revoked_at IS NULL',
      [preRow.family_id],
    );
    throw ApiError.unauthorized('Refresh token has already been used; please sign in again');
  }
  if (new Date(preRow.expires_at) < new Date()) {
    throw ApiError.unauthorized('Refresh token has expired; please sign in again');
  }

  return withTransaction(async (client) => {
    // Re-read under a row lock: two concurrent refreshes with the same token must
    // not both succeed and produce two live tokens.
    const found = await client.query(
      'SELECT * FROM refresh_tokens WHERE token_hash = $1 FOR UPDATE', [hash],
    );
    const row = found.rows[0];
    if (!row || row.revoked_at) {
      throw ApiError.unauthorized('Refresh token has already been used; please sign in again');
    }

    const userRes = await client.query('SELECT * FROM users WHERE id = $1', [row.user_id]);
    const user = userRes.rows[0];
    if (!user || !user.is_active) throw ApiError.forbidden('This account is no longer active');

    const { token: newToken, hash: newHash } = newRefreshToken();
    const inserted = await client.query(
      `INSERT INTO refresh_tokens (user_id, token_hash, family_id, expires_at, user_agent, ip)
       VALUES ($1, $2, $3, $4, $5, $6) RETURNING id`,
      [user.id, newHash, row.family_id, refreshExpiry(), userAgent || null, ip || null],
    );
    await client.query(
      'UPDATE refresh_tokens SET revoked_at = now(), replaced_by = $1 WHERE id = $2',
      [inserted.rows[0].id, row.id],
    );

    return { user: publicUser(user), accessToken: signAccessToken(user), refreshToken: newToken };
  });
}

export async function logout({ token }) {
  if (!token) return { revoked: 0 };
  const { rowCount } = await query(
    'UPDATE refresh_tokens SET revoked_at = now() WHERE token_hash = $1 AND revoked_at IS NULL',
    [hashToken(token)],
  );
  return { revoked: rowCount };
}

export async function getById(id) {
  const { rows } = await query('SELECT * FROM users WHERE id = $1', [id]);
  if (!rows[0]) throw ApiError.notFound('User not found');
  return publicUser(rows[0]);
}

export async function listUsers({ page, pageSize, role }) {
  const offset = (page - 1) * pageSize;
  const params = [];
  let where = 'WHERE 1=1';
  if (role) { params.push(role); where += ` AND role = $${params.length}`; }
  const total = await query(`SELECT count(*)::int AS c FROM users ${where}`, params);
  params.push(pageSize, offset);
  const { rows } = await query(
    `SELECT * FROM users ${where} ORDER BY created_at DESC LIMIT $${params.length - 1} OFFSET $${params.length}`,
    params,
  );
  return { items: rows.map(publicUser), total: total.rows[0].c, page, pageSize };
}

export async function setRole(userId, role) {
  const { rows } = await query(
    'UPDATE users SET role = $1, updated_at = now() WHERE id = $2 RETURNING *', [role, userId],
  );
  if (!rows[0]) throw ApiError.notFound('User not found');
  return publicUser(rows[0]);
}

export { publicUser, config };
