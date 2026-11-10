import request from 'supertest';
import { createApp } from '../src/app.js';
import { query } from '../src/db/pool.js';
import { hashPassword } from '../src/services/authService.js';

export const app = createApp();

/** Creates a user directly (the API deliberately will not grant non-guest roles) and logs in. */
export async function makeUser({ email, password = 'Password12345', role = 'guest', fullName = 'Test User' }) {
  const hash = await hashPassword(password);
  const { rows } = await query(
    `INSERT INTO users (email, password_hash, full_name, role)
     VALUES ($1,$2,$3,$4)
     ON CONFLICT (lower(email)) DO UPDATE SET password_hash = EXCLUDED.password_hash,
       role = EXCLUDED.role, is_active = TRUE
     RETURNING *`,
    [email, hash, fullName, role],
  );
  const res = await request(app).post('/api/auth/login').send({ email, password });
  if (res.status !== 200) throw new Error(`login failed: ${res.status} ${JSON.stringify(res.body)}`);
  return { user: rows[0], token: res.body.data.accessToken, refreshToken: res.body.data.refreshToken, password };
}

export const auth = (token) => ({ Authorization: `Bearer ${token}` });

let seq = 0;
export const uniq = (p = 'u') => `${p}${Date.now()}_${seq++}@example.com`;

/** A property that exists in the seeded data, with a room type and a room. */
export async function sampleProperty() {
  const { rows } = await query(
    `SELECT p.id, p.code, p.name,
            (SELECT count(*)::int FROM rooms r WHERE r.property_id = p.id) AS rooms
     FROM properties p ORDER BY p.name LIMIT 1`,
  );
  return rows[0];
}

export async function sampleRoom(propertyId) {
  const { rows } = await query(
    `SELECT r.id, r.room_number, rt.id AS room_type_id, rt.base_rate_inr
     FROM rooms r JOIN room_types rt ON rt.id = r.room_type_id
     WHERE r.property_id = $1 ORDER BY r.room_number LIMIT 1`, [propertyId],
  );
  return rows[0];
}

export { query, request };
