import { describe, it, expect } from 'vitest';
import { app, request, uniq, makeUser, auth } from '../helpers.js';

describe('GET /api/properties', () => {
  it('returns the 14 seeded properties with pagination metadata', async () => {
    // Asserting the exact row count would make this test fail the moment another
    // suite creates a property, which says nothing about this endpoint. What
    // matters is that every seeded property is present and the metadata agrees
    // with the payload.
    const res = await request(app).get('/api/properties?pageSize=100');
    expect(res.status).toBe(200);
    expect(res.body.meta.total).toBeGreaterThanOrEqual(14);
    expect(res.body.meta.total).toBe(res.body.data.length);

    const seeded = ['MUM-CSB', 'MUM-BAY', 'MUM-JUH', 'MUM-POW', 'MUM-WOR', 'MUM-AND', 'MUM-BOR',
      'MUM-DAD', 'MUM-MAL', 'MUM-LOW', 'MUM-GOR', 'MUM-CHE', 'MUM-VER', 'MUM-MUL'];
    const codes = new Set(res.body.data.map((p) => p.code));
    for (const c of seeded) expect(codes.has(c)).toBe(true);
  });

  it('filters by search term', async () => {
    const res = await request(app).get('/api/properties?q=Juhu');
    expect(res.status).toBe(200);
    expect(res.body.data.length).toBe(1);
    expect(res.body.data[0].name).toContain('Juhu');
  });

  it('filters by minimum star rating', async () => {
    const res = await request(app).get('/api/properties?minStar=5&pageSize=50');
    expect(res.body.data.every((p) => p.starRating >= 5)).toBe(true);
  });

  it('sorts by a whitelisted column and ignores an injected one', async () => {
    const ok = await request(app).get('/api/properties?sort=star_rating&order=desc&pageSize=50');
    expect(ok.status).toBe(200);
    const stars = ok.body.data.map((p) => p.starRating);
    expect([...stars].sort((a, b) => b - a)).toEqual(stars);

    // A non-whitelisted sort value must be rejected, never interpolated.
    const bad = await request(app).get('/api/properties?sort=name;DROP TABLE users');
    expect(bad.status).toBe(422);
  });

  it('rejects an out-of-range page size', async () => {
    const res = await request(app).get('/api/properties?pageSize=9999');
    expect(res.status).toBe(422);
  });
});

describe('GET /api/properties/:id', () => {
  it('returns one property with its room types', async () => {
    const list = await request(app).get('/api/properties?pageSize=1');
    const id = list.body.data[0].id;
    const res = await request(app).get(`/api/properties/${id}`);
    expect(res.status).toBe(200);
    expect(res.body.data.roomTypes.length).toBeGreaterThan(0);
    expect(res.body.data.roomTypes[0]).toHaveProperty('baseRateInr');
  });

  it('404s on an unknown id', async () => {
    const res = await request(app).get('/api/properties/00000000-0000-0000-0000-000000000000');
    expect(res.status).toBe(404);
  });
});

describe('property CRUD', () => {
  it('creates, updates and reads back a property', async () => {
    const { token } = await makeUser({ email: uniq('crud'), role: 'admin' });
    const code = `CR${Date.now() % 100000}`;
    const created = await request(app).post('/api/properties').set(auth(token))
      .send({ code, name: 'Marine Drive Suites', starRating: 4, description: 'Sea-facing boutique property.' });
    expect(created.status).toBe(201);

    const patched = await request(app).patch(`/api/properties/${created.body.data.id}`).set(auth(token))
      .send({ starRating: 5 });
    expect(patched.status).toBe(200);
    expect(patched.body.data.starRating).toBe(5);

    const read = await request(app).get(`/api/properties/${created.body.data.id}`);
    expect(read.body.data.name).toBe('Marine Drive Suites');
  });

  it('rejects a duplicate property code with 409', async () => {
    const { token } = await makeUser({ email: uniq('dup'), role: 'admin' });
    const code = `DP${Date.now() % 100000}`;
    await request(app).post('/api/properties').set(auth(token)).send({ code, name: 'A Property' });
    const res = await request(app).post('/api/properties').set(auth(token)).send({ code, name: 'A Property' });
    expect(res.status).toBe(409);
  });

  it('rejects a lowercase code', async () => {
    const { token } = await makeUser({ email: uniq('lc'), role: 'admin' });
    const res = await request(app).post('/api/properties').set(auth(token)).send({ code: 'lower', name: 'A Property' });
    expect(res.status).toBe(422);
  });
});

describe('GET /api/room-types', () => {
  it('returns the five canonical room types, not the raw aliases', async () => {
    const res = await request(app).get('/api/room-types');
    expect(res.status).toBe(200);
    expect(res.body.data.map((t) => t.code).sort())
      .toEqual(['deluxe', 'family', 'premier', 'standard', 'suite']);
  });
});

describe('GET /api/health', () => {
  it('reports the database as up', async () => {
    const res = await request(app).get('/api/health');
    expect(res.status).toBe(200);
    expect(res.body.data.status).toBe('ok');
    expect(res.body.data.database).toBe('up');
  });
});
