import { describe, it, expect, beforeAll } from 'vitest';
import { app, request, uniq, makeUser, auth, query } from '../helpers.js';

/**
 * These tests build a small property with a known inventory and a known set of
 * bookings, then assert occupancy, ADR and RevPAR against numbers worked out by
 * hand. If the definitions in metricsService.js ever drift, these fail.
 *
 * Scenario
 *   property: 10 rooms, window 2027-01-01 .. 2027-01-11 (10 nights)
 *   room-nights available = 10 rooms x 10 nights = 100
 *   B1  2 rooms, 01-01 -> 01-06  (5 nights)  rate 50,000   -> 10 room-nights, 50,000 INR
 *   B2  1 room,  01-05 -> 01-08  (3 nights)  rate  9,000   ->  3 room-nights,  9,000 INR
 *   B3  cancelled                            -> ignored entirely
 *   sold = 13, revenue = 59,000
 *   occupancy = 13/100 = 0.13
 *   ADR       = 59,000/13  = 4,538.46
 *   RevPAR    = 59,000/100 = 590.00
 */
let propertyId; let token;

beforeAll(async () => {
  const admin = await makeUser({ email: uniq('madmin'), role: 'admin' });
  token = admin.token;

  const p = await query(
    `INSERT INTO properties (code, name, star_rating, total_rooms)
     VALUES ($1,'Metrics Test Hotel',4,10) RETURNING id`,
    [`MT${Date.now() % 100000}`],
  );
  propertyId = p.rows[0].id;

  const rt = await query('SELECT id FROM room_types WHERE code = $1', ['deluxe']);
  for (let i = 1; i <= 10; i += 1) {
    await query(
      `INSERT INTO rooms (property_id, room_type_id, room_number, floor)
       VALUES ($1,$2,$3,1)`, [propertyId, rt.rows[0].id, `M${String(i).padStart(2, '0')}`],
    );
  }

  const guest = await query(
    `INSERT INTO guests (full_name, email) VALUES ('Metrics Guest',$1) RETURNING id`, [uniq('mg')],
  );
  const gid = guest.rows[0].id;
  const mk = (ref, ci, co, rooms, rate, status) => query(
    `INSERT INTO bookings (reference, property_id, guest_id, check_in, check_out, rooms_booked,
                           rate_inr, amount_original, currency_original, fx_rate, status)
     VALUES ($1,$2,$3,$4,$5,$6,$7,$7,'INR',1,$8)`,
    [ref, propertyId, gid, ci, co, rooms, rate, status],
  );
  await mk(`MT-${Date.now()}-A`, '2027-01-01', '2027-01-06', 2, 50000, 'confirmed');
  await mk(`MT-${Date.now()}-B`, '2027-01-05', '2027-01-08', 1, 9000, 'confirmed');
  await mk(`MT-${Date.now()}-C`, '2027-01-02', '2027-01-05', 5, 99999, 'cancelled');
});

const get = (qs) => request(app).get(`/api/metrics?${qs}`).set(auth(token));

describe('occupancy, ADR and RevPAR', () => {
  it('computes the three metrics exactly for a known scenario', async () => {
    const res = await get('from=2027-01-01&to=2027-01-11&groupBy=property');
    expect(res.status).toBe(200);

    const p = res.body.data.properties.find((x) => x.propertyId === propertyId);
    expect(p.roomNightsAvailable).toBe(100);
    expect(p.roomNightsSold).toBe(13);
    expect(p.revenueInr).toBe(59000);
    expect(p.occupancyRate).toBeCloseTo(0.13, 4);
    expect(p.adrInr).toBeCloseTo(4538.46, 2);
    expect(p.revparInr).toBeCloseTo(590, 2);
  });

  it('excludes cancelled bookings from revenue and from occupancy', async () => {
    const res = await get('from=2027-01-01&to=2027-01-11');
    const p = res.body.data.properties.find((x) => x.propertyId === propertyId);
    // The cancelled 5-room booking would have added 15 room-nights and 99,999 INR.
    expect(p.roomNightsSold).toBe(13);
    expect(p.revenueInr).toBe(59000);
  });

  it('holds RevPAR = ADR x occupancy', async () => {
    const res = await get('from=2027-01-01&to=2027-01-11');
    const p = res.body.data.properties.find((x) => x.propertyId === propertyId);
    expect(p.revparInr).toBeCloseTo(p.adrInr * p.occupancyRate, 1);
  });

  it('counts only the nights that fall inside the window', async () => {
    // 01-03..01-05 is 2 nights inside a 3-night stay, so a 3,000 INR booking
    // contributes 2/3 of its rate, not all of it.
    const ci = '2027-02-01'; const co = '2027-02-04';
    const guest = await query(`INSERT INTO guests (full_name,email) VALUES ('Clip Guest',$1) RETURNING id`, [uniq('clip')]);
    await query(
      `INSERT INTO bookings (reference, property_id, guest_id, check_in, check_out, rooms_booked,
                             rate_inr, amount_original, currency_original, fx_rate, status)
       VALUES ($1,$2,$3,$4,$5,1,3000,3000,'INR',1,'confirmed')`,
      [`MT-CLIP-${Date.now()}`, propertyId, guest.rows[0].id, ci, co],
    );
    // window covers only the first two nights of the three
    const res = await get('from=2027-02-01&to=2027-02-03');
    const p = res.body.data.properties.find((x) => x.propertyId === propertyId);
    expect(p.roomNightsSold).toBe(2);
    expect(p.revenueInr).toBeCloseTo(2000, 2); // 2/3 of 3000
  });

  it('returns zeroes rather than NaN for a window with no bookings', async () => {
    const res = await get('from=2030-01-01&to=2030-01-05');
    const p = res.body.data.properties.find((x) => x.propertyId === propertyId);
    expect(p.roomNightsSold).toBe(0);
    expect(p.adrInr).toBe(0);
    expect(p.revparInr).toBe(0);
    expect(Number.isNaN(p.occupancyRate)).toBe(false);
  });

  it('reports a portfolio total across properties', async () => {
    const res = await get('from=2027-01-01&to=2027-01-11');
    expect(res.body.data.portfolio).toHaveProperty('occupancyRate');
    expect(res.body.data.portfolio).toHaveProperty('adrInr');
    expect(res.body.data.portfolio).toHaveProperty('revparInr');
    expect(res.body.data.portfolio.revparInr).toBeGreaterThan(0);
    expect(res.body.data.window.nights).toBe(10);
  });

  it('scopes to a single property when asked', async () => {
    const res = await get(`from=2027-01-01&to=2027-01-11&propertyId=${propertyId}`);
    expect(res.body.data.properties.length).toBe(1);
    expect(res.body.data.properties[0].propertyId).toBe(propertyId);
  });

  it('produces a monthly series when grouping by month', async () => {
    const res = await get('from=2027-01-01&to=2027-03-01&groupBy=month');
    expect(Array.isArray(res.body.data.months)).toBe(true);
    expect(res.body.data.months.length).toBeGreaterThan(0);
    expect(res.body.data.months[0]).toHaveProperty('month');
  });

  it('rejects a request with no date window', async () => {
    const res = await get('groupBy=property');
    expect(res.status).toBe(422);
  });
});

describe('GET /api/metrics/occupancy-series', () => {
  it('returns one point per night', async () => {
    const res = await request(app)
      .get(`/api/metrics/occupancy-series?propertyId=${propertyId}&from=2027-01-01&to=2027-01-11`)
      .set(auth(token));
    expect(res.status).toBe(200);
    expect(res.body.data.length).toBe(10);
    expect(res.body.data[0]).toHaveProperty('date');
    expect(res.body.data[0]).toHaveProperty('occupancyRate');
  });
});
