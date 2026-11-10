import { describe, it, expect, beforeAll } from 'vitest';
import { app, request, uniq, makeUser, auth, sampleProperty, sampleRoom, query } from '../helpers.js';

let property; let room; let admin; let staff;

beforeAll(async () => {
  property = await sampleProperty();
  room = await sampleRoom(property.id);
  admin = await makeUser({ email: uniq('bkadmin'), role: 'admin' });
  staff = await makeUser({ email: uniq('bkstaff'), role: 'staff' });
});

const farFuture = (n = 400) => {
  const d = new Date(); d.setDate(d.getDate() + n);
  return d.toISOString().slice(0, 10);
};

describe('POST /api/bookings', () => {
  it('takes a public booking without an account and prices it from the room type', async () => {
    const res = await request(app).post('/api/bookings').send({
      propertyId: property.id,
      roomId: room.id,
      checkIn: farFuture(400),
      checkOut: farFuture(403),
      roomsBooked: 1,
      adults: 2,
      guest: { fullName: 'Nikhil Desai', email: uniq('nikhil') },
    });
    expect(res.status).toBe(201);
    expect(res.body.data.reference).toMatch(/^MUM-/);
    expect(res.body.data.rateInr).toBeGreaterThan(0);
    expect(res.body.data.nights).toBe(3);
  });

  it('rejects check-out before check-in with a field-level error', async () => {
    const res = await request(app).post('/api/bookings').send({
      propertyId: property.id,
      checkIn: farFuture(410), checkOut: farFuture(405),
      guest: { fullName: 'A B', email: uniq('rev') },
    });
    expect(res.status).toBe(422);
    expect(res.body.error.details.some((d) => d.field === 'checkOut')).toBe(true);
  });

  it('rejects a same-day stay', async () => {
    const d = farFuture(420);
    const res = await request(app).post('/api/bookings').send({
      propertyId: property.id, checkIn: d, checkOut: d,
      guest: { fullName: 'A B', email: uniq('same') },
    });
    expect(res.status).toBe(422);
  });

  it('rejects a booking with neither a guestId nor guest details', async () => {
    const res = await request(app).post('/api/bookings').send({
      propertyId: property.id, checkIn: farFuture(430), checkOut: farFuture(432),
    });
    expect(res.status).toBe(422);
  });

  it('rejects an impossible date', async () => {
    const res = await request(app).post('/api/bookings').send({
      propertyId: property.id, checkIn: '2026-02-31', checkOut: '2026-03-02',
      guest: { fullName: 'A B', email: uniq('imp') },
    });
    expect(res.status).toBe(422);
  });

  it('refuses to overbook a room type beyond its inventory', async () => {
    // Sell every room of this type for the same nights, then ask for one more.
    const { rows } = await query(
      'SELECT count(*)::int AS c FROM rooms WHERE property_id = $1 AND room_type_id = $2',
      [property.id, room.room_type_id],
    );
    const total = rows[0].c;
    const checkIn = farFuture(500); const checkOut = farFuture(502);
    const first = await request(app).post('/api/bookings').send({
      propertyId: property.id, roomId: room.id, checkIn, checkOut, roomsBooked: total,
      guest: { fullName: 'Block Booking', email: uniq('block') },
    });
    expect(first.status).toBe(201);

    const second = await request(app).post('/api/bookings').send({
      propertyId: property.id, roomId: room.id, checkIn, checkOut, roomsBooked: 1,
      guest: { fullName: 'Too Late', email: uniq('late') },
    });
    expect(second.status).toBe(409);
    expect(second.body.error.code).toBe('CONFLICT');
  });

  it('allows a back-to-back booking on the check-out day', async () => {
    // check_out is exclusive, so a guest leaving on the 10th frees the room that day.
    const ci = farFuture(600); const co = farFuture(602);
    const a = await request(app).post('/api/bookings').send({
      propertyId: property.id, roomId: room.id, checkIn: ci, checkOut: co, roomsBooked: 1,
      guest: { fullName: 'First Guest', email: uniq('first') },
    });
    expect(a.status).toBe(201);
    const b = await request(app).post('/api/bookings').send({
      propertyId: property.id, roomId: room.id, checkIn: co, checkOut: farFuture(604), roomsBooked: 1,
      guest: { fullName: 'Second Guest', email: uniq('second') },
    });
    expect(b.status).toBe(201);
  });
});

describe('GET /api/rooms/availability', () => {
  it('reports free rooms per room type for a stay', async () => {
    const res = await request(app)
      .get(`/api/rooms/availability?propertyId=${property.id}&checkIn=${farFuture(700)}&checkOut=${farFuture(702)}`);
    expect(res.status).toBe(200);
    expect(res.body.data.length).toBeGreaterThan(0);
    expect(res.body.data[0]).toHaveProperty('roomsFree');
    expect(res.body.data.every((r) => r.isAvailable === true)).toBe(true);
  });

  it('rejects a malformed date range', async () => {
    const res = await request(app)
      .get(`/api/rooms/availability?propertyId=${property.id}&checkIn=bad&checkOut=worse`);
    expect(res.status).toBe(422);
  });
});

describe('booking management', () => {
  it('lets staff change a booking status', async () => {
    const created = await request(app).post('/api/bookings').send({
      propertyId: property.id, roomId: room.id, checkIn: farFuture(800), checkOut: farFuture(802),
      guest: { fullName: 'Status Test', email: uniq('status') },
    });
    const res = await request(app).patch(`/api/bookings/${created.body.data.id}`)
      .set(auth(staff.token)).send({ status: 'checked_in' });
    expect(res.status).toBe(200);
    expect(res.body.data.status).toBe('checked_in');
  });

  it('rejects an unknown status', async () => {
    const created = await request(app).post('/api/bookings').send({
      propertyId: property.id, checkIn: farFuture(810), checkOut: farFuture(812),
      guest: { fullName: 'Bad Status', email: uniq('badstatus') },
    });
    const res = await request(app).patch(`/api/bookings/${created.body.data.id}`)
      .set(auth(staff.token)).send({ status: 'teleported' });
    expect(res.status).toBe(422);
  });

  it('filters bookings by property and status', async () => {
    const res = await request(app)
      .get(`/api/bookings?propertyId=${property.id}&status=confirmed&pageSize=10`)
      .set(auth(admin.token));
    expect(res.status).toBe(200);
    expect(res.body.data.every((b) => b.propertyId === property.id && b.status === 'confirmed')).toBe(true);
  });

  it('records the original currency and the FX rate on converted rows', async () => {
    const res = await request(app).get('/api/bookings?pageSize=100').set(auth(admin.token));
    const usd = res.body.data.find((b) => b.currencyOriginal === 'USD');
    if (usd) {
      expect(usd.fxRate).toBeCloseTo(84.5, 2);
      expect(usd.amountOriginal).toBeGreaterThan(0);
    }
    // Every loaded row must carry a currency and a rate, converted or not.
    expect(res.body.data.every((b) => b.currencyOriginal && b.fxRate)).toBe(true);
  });
});
