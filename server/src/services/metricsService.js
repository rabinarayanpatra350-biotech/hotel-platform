import { query } from '../db/pool.js';

/**
 * Occupancy, ADR and RevPAR.
 *
 * The three metrics are defined once, here, and every consumer — dashboard,
 * tests, report — reads the same definitions:
 *
 *   room-nights sold       sum of rooms_booked for each night of each stay
 *   room-nights available  active rooms x nights in the window
 *   occupancy              sold / available
 *   ADR                    room revenue / sold      (average daily rate)
 *   RevPAR                 room revenue / available (revenue per available room)
 *
 * Two decisions are worth stating because they change the numbers:
 *   1. Cancelled bookings are excluded everywhere. A cancelled booking is not
 *      revenue and it does not occupy a room.
 *   2. A stay that straddles the window contributes only the nights inside it,
 *      and its total rate is apportioned per night, so a 5-night booking that
 *      overlaps the window by 2 nights adds 2/5 of its rate — not all of it.
 */
export async function computeMetrics({ propertyId, from, to, groupBy = 'property' }) {
  const params = [from, to];
  let propFilter = '';
  if (propertyId) { params.push(propertyId); propFilter = ` AND p.id = $${params.length}`; }

  // Nights in the window. check_out is exclusive, so [from, to) is the window.
  const nights = Math.max(0, Math.round((Date.parse(to) - Date.parse(from)) / 86_400_000));

  const sql = `
    WITH window_nights AS (
      SELECT d::date AS stay_date
      FROM generate_series($1::date, $2::date - INTERVAL '1 day', INTERVAL '1 day') AS d
    ),
    sold AS (
      SELECT b.property_id,
             n.stay_date,
             SUM(b.rooms_booked)::int AS rooms_sold,
             SUM(b.rate_inr / GREATEST((b.check_out - b.check_in), 1)) AS revenue
      FROM bookings b
      JOIN window_nights n ON n.stay_date >= b.check_in AND n.stay_date < b.check_out
      WHERE b.status <> 'cancelled'
      GROUP BY b.property_id, n.stay_date
    ),
    inventory AS (
      SELECT p.id AS property_id, p.code, p.name, p.total_rooms,
             COUNT(r.id) FILTER (WHERE r.is_active)::int AS active_rooms
      FROM properties p
      LEFT JOIN rooms r ON r.property_id = p.id
      WHERE p.is_active ${propFilter}
      GROUP BY p.id, p.code, p.name, p.total_rooms
    )
    SELECT i.property_id,
           i.code,
           i.name,
           i.total_rooms,
           GREATEST(i.active_rooms, i.total_rooms) AS rooms_available,
           COALESCE(SUM(s.rooms_sold), 0)::int     AS room_nights_sold,
           COALESCE(SUM(s.revenue), 0)             AS revenue_inr
    FROM inventory i
    LEFT JOIN sold s ON s.property_id = i.property_id
    GROUP BY i.property_id, i.code, i.name, i.total_rooms, i.active_rooms
    ORDER BY i.name
  `;

  const { rows } = await query(sql, params);

  const rowsOut = rows.map((r) => {
    const available = r.rooms_available * nights;
    const sold = r.room_nights_sold;
    const revenue = Number(r.revenue_inr);
    const occupancy = available > 0 ? sold / available : 0;
    const adr = sold > 0 ? revenue / sold : 0;
    const revpar = available > 0 ? revenue / available : 0;
    return {
      propertyId: r.property_id,
      propertyCode: r.code,
      propertyName: r.name,
      roomsAvailable: r.rooms_available,
      roomNightsAvailable: available,
      roomNightsSold: sold,
      revenueInr: round2(revenue),
      occupancyRate: round4(occupancy),
      adrInr: round2(adr),
      revparInr: round2(revpar),
    };
  });

  const totalAvailable = rowsOut.reduce((s, r) => s + r.roomNightsAvailable, 0);
  const totalSold = rowsOut.reduce((s, r) => s + r.roomNightsSold, 0);
  const totalRevenue = rowsOut.reduce((s, r) => s + r.revenueInr, 0);

  const portfolio = {
    roomNightsAvailable: totalAvailable,
    roomNightsSold: totalSold,
    revenueInr: round2(totalRevenue),
    occupancyRate: totalAvailable > 0 ? round4(totalSold / totalAvailable) : 0,
    adrInr: totalSold > 0 ? round2(totalRevenue / totalSold) : 0,
    revparInr: totalAvailable > 0 ? round2(totalRevenue / totalAvailable) : 0,
  };

  const out = {
    window: { from, to, nights },
    portfolio,
    properties: groupBy === 'none' ? [] : rowsOut,
  };

  if (groupBy === 'month') {
    out.months = await monthlySeries({ propertyId, from, to });
  }
  return out;
}

async function monthlySeries({ propertyId, from, to }) {
  const params = [from, to];
  let propFilter = '';
  if (propertyId) { params.push(propertyId); propFilter = ` AND b.property_id = $${params.length}`; }
  const { rows } = await query(
    `SELECT to_char(date_trunc('month', n.stay_date), 'YYYY-MM') AS month,
            SUM(b.rooms_booked)::int AS room_nights_sold,
            SUM(b.rate_inr / GREATEST((b.check_out - b.check_in), 1)) AS revenue
     FROM bookings b
     JOIN generate_series($1::date, $2::date - INTERVAL '1 day', INTERVAL '1 day') AS n(stay_date)
       ON n.stay_date >= b.check_in AND n.stay_date < b.check_out
     WHERE b.status <> 'cancelled' ${propFilter}
     GROUP BY 1 ORDER BY 1`,
    params,
  );
  return rows.map((r) => ({
    month: r.month,
    roomNightsSold: r.room_nights_sold,
    revenueInr: round2(Number(r.revenue)),
  }));
}

/** Per-night occupancy series for one property — used by the dashboard chart. */
export async function occupancySeries({ propertyId, from, to }) {
  const { rows } = await query(
    `WITH nights AS (
       SELECT d::date AS stay_date
       FROM generate_series($2::date, $3::date - INTERVAL '1 day', INTERVAL '1 day') AS d
     ),
     inv AS (
       SELECT COALESCE(SUM(CASE WHEN r.is_active THEN 1 ELSE 0 END), 0)::int AS rooms
       FROM rooms r WHERE r.property_id = $1
     )
     SELECT n.stay_date,
            COALESCE(SUM(b.rooms_booked), 0)::int AS rooms_sold,
            (SELECT rooms FROM inv) AS rooms_available
     FROM nights n
     LEFT JOIN bookings b
       ON b.property_id = $1 AND b.status <> 'cancelled'
      AND n.stay_date >= b.check_in AND n.stay_date < b.check_out
     GROUP BY n.stay_date ORDER BY n.stay_date`,
    [propertyId, from, to],
  );
  return rows.map((r) => ({
    date: r.stay_date.toISOString().slice(0, 10),
    roomsSold: r.rooms_sold,
    roomsAvailable: r.rooms_available,
    occupancyRate: r.rooms_available > 0 ? round4(r.rooms_sold / r.rooms_available) : 0,
  }));
}

const round2 = (n) => Math.round((Number(n) + Number.EPSILON) * 100) / 100;
const round4 = (n) => Math.round((Number(n) + Number.EPSILON) * 10000) / 10000;
