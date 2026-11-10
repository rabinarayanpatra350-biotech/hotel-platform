import { describe, it, expect } from 'vitest';
import { app, request, uniq, makeUser, auth } from '../helpers.js';
import { query } from '../../src/db/pool.js';

describe('POST /api/auth/signup', () => {
  it('creates a guest account and never returns the password hash', async () => {
    const email = uniq('signup');
    const res = await request(app).post('/api/auth/signup')
      .send({ email, password: 'Password12345', fullName: 'Asha Rao' });
    expect(res.status).toBe(201);
    expect(res.body.data.user).toMatchObject({ email, role: 'guest', fullName: 'Asha Rao' });
    expect(res.body.data.user.passwordHash).toBeUndefined();
    expect(res.body.data.user.password_hash).toBeUndefined();
  });

  it('always creates a guest, so nobody can self-register as an admin', async () => {
    const res = await request(app).post('/api/auth/signup')
      .send({ email: uniq('esc'), password: 'Password12345', fullName: 'Eve', role: 'admin' });
    expect(res.status).toBe(201);
    expect(res.body.data.user.role).toBe('guest');
  });

  it('rejects a duplicate email', async () => {
    const email = uniq('dupe');
    await request(app).post('/api/auth/signup').send({ email, password: 'Password12345', fullName: 'A B' });
    const res = await request(app).post('/api/auth/signup').send({ email, password: 'Password12345', fullName: 'A B' });
    expect(res.status).toBe(409);
    expect(res.body.error.code).toBe('CONFLICT');
  });

  it('rejects a weak password with a field-level message', async () => {
    const res = await request(app).post('/api/auth/signup')
      .send({ email: uniq('weak'), password: 'short', fullName: 'A B' });
    expect(res.status).toBe(422);
    expect(res.body.error.details[0].field).toBe('password');
  });

  it('rejects a malformed email', async () => {
    const res = await request(app).post('/api/auth/signup')
      .send({ email: 'nope', password: 'Password12345', fullName: 'A B' });
    expect(res.status).toBe(422);
  });
});

describe('POST /api/auth/login', () => {
  it('returns an access token and a refresh token', async () => {
    const { token, refreshToken } = await makeUser({ email: uniq('login') });
    expect(token).toBeTruthy();
    expect(refreshToken).toBeTruthy();
  });

  it('gives the same error for a wrong password and an unknown email', async () => {
    const { user } = await makeUser({ email: uniq('enum') });
    const wrongPw = await request(app).post('/api/auth/login').send({ email: user.email, password: 'WrongPassword1' });
    const noUser = await request(app).post('/api/auth/login').send({ email: 'ghost@example.com', password: 'WrongPassword1' });
    expect(wrongPw.status).toBe(401);
    expect(noUser.status).toBe(401);
    expect(wrongPw.body.error.message).toBe(noUser.body.error.message);
  });

  it('refuses a deactivated account', async () => {
    const { user } = await makeUser({ email: uniq('deact') });
    await query('UPDATE users SET is_active = FALSE WHERE id = $1', [user.id]);
    const res = await request(app).post('/api/auth/login').send({ email: user.email, password: 'Password12345' });
    expect(res.status).toBe(403);
  });
});

describe('GET /api/auth/me', () => {
  it('returns the caller when authenticated', async () => {
    const { user, token } = await makeUser({ email: uniq('me') });
    const res = await request(app).get('/api/auth/me').set(auth(token));
    expect(res.status).toBe(200);
    expect(res.body.data.user.id).toBe(user.id);
  });

  it('rejects a missing token', async () => {
    const res = await request(app).get('/api/auth/me');
    expect(res.status).toBe(401);
  });

  it('rejects a tampered token', async () => {
    const { token } = await makeUser({ email: uniq('tamper') });
    const res = await request(app).get('/api/auth/me').set(auth(`${token}x`));
    expect(res.status).toBe(401);
  });
});

describe('POST /api/auth/refresh', () => {
  it('rotates the refresh token and issues a new access token', async () => {
    const { refreshToken } = await makeUser({ email: uniq('rot') });
    const res = await request(app).post('/api/auth/refresh').send({ refreshToken });
    expect(res.status).toBe(200);
    expect(res.body.data.accessToken).toBeTruthy();
    expect(res.body.data.refreshToken).toBeTruthy();
    expect(res.body.data.refreshToken).not.toBe(refreshToken);
  });

  it('detects reuse of a burned token and revokes the whole family', async () => {
    const { refreshToken } = await makeUser({ email: uniq('reuse') });
    const first = await request(app).post('/api/auth/refresh').send({ refreshToken });
    expect(first.status).toBe(200);

    // Replaying the original token is the signature of a stolen token.
    const replay = await request(app).post('/api/auth/refresh').send({ refreshToken });
    expect(replay.status).toBe(401);
    expect(replay.body.error.message).toMatch(/already been used/i);

    // And the token issued a moment ago must now be dead too.
    const after = await request(app).post('/api/auth/refresh').send({ refreshToken: first.body.data.refreshToken });
    expect(after.status).toBe(401);
  });

  it('rejects an unknown refresh token', async () => {
    const res = await request(app).post('/api/auth/refresh').send({ refreshToken: 'not-a-real-token-value' });
    expect(res.status).toBe(401);
  });
});

describe('POST /api/auth/logout', () => {
  it('revokes the presented refresh token', async () => {
    const { refreshToken } = await makeUser({ email: uniq('logout') });
    const out = await request(app).post('/api/auth/logout').send({ refreshToken });
    expect(out.status).toBe(200);
    const res = await request(app).post('/api/auth/refresh').send({ refreshToken });
    expect(res.status).toBe(401);
  });
});
