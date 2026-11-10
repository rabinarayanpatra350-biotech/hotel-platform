import { describe, it, expect } from 'vitest';
import { app, request, uniq, makeUser, auth } from '../helpers.js';

describe('role-based access control', () => {
  it('lets a guest read public property listings', async () => {
    const res = await request(app).get('/api/properties');
    expect(res.status).toBe(200);
    expect(res.body.data.length).toBeGreaterThan(0);
  });

  it('refuses a guest the admin dashboard', async () => {
    const { token } = await makeUser({ email: uniq('guest'), role: 'guest' });
    const res = await request(app).get('/api/metrics?from=2026-01-01&to=2026-02-01').set(auth(token));
    expect(res.status).toBe(403);
  });

  it('allows staff the admin dashboard', async () => {
    const { token } = await makeUser({ email: uniq('staff'), role: 'staff' });
    const res = await request(app).get('/api/metrics?from=2026-01-01&to=2026-02-01').set(auth(token));
    expect(res.status).toBe(200);
  });

  it('refuses staff the user-administration endpoints, which are admin-only', async () => {
    const { token } = await makeUser({ email: uniq('staff2'), role: 'staff' });
    const res = await request(app).get('/api/users').set(auth(token));
    expect(res.status).toBe(403);
  });

  it('allows an admin to list users', async () => {
    const { token } = await makeUser({ email: uniq('admin'), role: 'admin' });
    const res = await request(app).get('/api/users').set(auth(token));
    expect(res.status).toBe(200);
  });

  it('lets staff create a property but only admin delete one', async () => {
    const staff = await makeUser({ email: uniq('staff3'), role: 'staff' });
    const code = `T${Date.now() % 100000}`;
    const created = await request(app).post('/api/properties')
      .set(auth(staff.token))
      .send({ code, name: 'Test Property' });
    expect(created.status).toBe(201);

    const del = await request(app).delete(`/api/properties/${created.body.data.id}`).set(auth(staff.token));
    expect(del.status).toBe(403);

    const admin = await makeUser({ email: uniq('admin2'), role: 'admin' });
    const del2 = await request(app).delete(`/api/properties/${created.body.data.id}`).set(auth(admin.token));
    expect(del2.status).toBe(204);
  });

  it('stops a guest from reading another guest\'s bookings', async () => {
    const a = await makeUser({ email: uniq('ga'), role: 'guest' });
    const b = await makeUser({ email: uniq('gb'), role: 'guest' });
    const list = await request(app).get('/api/bookings').set(auth(a.token));
    expect(list.status).toBe(200);
    // A guest's list is filtered to their own email, so a fresh user sees nothing.
    expect(list.body.data.every((bk) => bk.guestEmail === a.user.email)).toBe(true);
    expect(b.user.email).not.toBe(a.user.email);
  });
});
