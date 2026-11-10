import { query, withTransaction } from '../db/pool.js';
import { enqueue } from '../jobs/queue.js';
import config from '../config/index.js';
import { ApiError } from '../lib/errors.js';

/**
 * Availability is a counting problem, not a lookup: a room type is available if
 * for every night of the requested stay, the number of rooms already sold is
 * fewer than the number of active rooms of that type. Overlap is expressed with
 * the half-open interval [check_in, check_out) so a guest leaving on the 10th
 * does not block a guest arriving on the 10th.
 */
export async function availability({ propertyId, checkIn, checkOut, roomTypeId, adults = 1 }) {
  const params = [propertyId, checkIn, checkOut, adults];
  let typeFilter = '';
  if (roomTypeId) { params.push(roomTypeId); typeFilter = ` AND rt.id = $${params.length}`; }

  const { rows } = await query(
    `WITH nights AS (
       SELECT d::date AS stay_date
       FROM generate_series($2::date, $3::date - INTERVAL '1 day', INTERVAL '1 day') AS d
     ),
     stock AS (
       SELECT rt.id AS room_type_id, rt.code, rt.name, rt.max_occupancy, rt.base_rate_inr,
              COUNT(r.id) FILTER (WHERE r.is_active)::int AS total_rooms
       FROM room_types rt
       JOIN rooms r ON r.room_type_id = rt.id AND r.property_id = $1
       WHERE rt.max_occupancy >= $4 ${typeFilter}
       GROUP BY rt.id, rt.code, rt.name, rt.max_occupancy, rt.base_rate_inr
     ),
     booked AS (
       SELECT r.room_type_id, n.stay_date, SUM(b.rooms_booked)::int AS sold
       FROM bookings b
       JOIN rooms r ON r.id = b.room_id
       JOIN nights n ON n.stay_date >= b.check_in AND n.stay_date < b.check_out
       WHERE b.property_id = $1 AND b.status <> 'cancelled'
       GROUP BY r.room_type_id, n.stay_date
     ),
     tightest AS (
       SELECT s.room_type_id,
              MIN(s.total_rooms - COALESCE(bk.sold, 0))::int AS min_free
       FROM stock s
       CROSS JOIN nights n
       LEFT JOIN booked bk ON bk.room_type_id = s.room_type_id AND bk.stay_date = n.stay_date
       GROUP BY s.room_type_id
     )
     SELECT s.*, COALESCE(t.min_free, 0) AS rooms_free,
            (COALESCE(t.min_free, 0) > 0) AS is_available
     FROM stock s LEFT JOIN tightest t ON t.room_type_id = s.room_type_id
     ORDER BY s.base_rate_inr`,
    params,
  );

  return rows.map((r) => ({
    roomTypeId: r.room_type_id,
    code: r.code,
    name: r.name,
    maxOccupancy: r.max_occupancy,
    baseRateInr: Number(r.base_rate_inr),
    totalRooms: r.total_rooms,
    roomsFree: Math.max(0, r.rooms_free),
    isAvailable: r.is_available,
  }));
}

/** Throws 409 if any night of the stay is already sold out for that room type. */
export async function assertAvailable({ propertyId, roomId, checkIn, checkOut, roomsBooked }) {
  const { rows } = await query(
    `WITH nights AS (
       SELECT d::date AS stay_date
       FROM generate_series($2::date, $3::date - INTERVAL '1 day', INTERVAL '1 day') AS d
     ),
     target AS (
       SELECT r.room_type_id FROM rooms r WHERE r.id = $1
     ),
     stock AS (
       SELECT COUNT(*) FILTER (WHERE r.is_active)::int AS total
       FROM rooms r WHERE r.property_id = $4
         AND r.room_type_id = (SELECT room_type_id FROM target)
     ),
     booked AS (
       SELECT n.stay_date, COALESCE(SUM(b.rooms_booked), 0)::int AS sold
       FROM nights n
       LEFT JOIN bookings b
         ON b.property_id = $4 AND b.status <> 'cancelled'
        AND b.room_id IN (SELECT id FROM rooms WHERE property_id = $4
                          AND room_type_id = (SELECT room_type_id FROM target))
        AND n.stay_date >= b.check_in AND n.stay_date < b.check_out
       GROUP BY n.stay_date
     )
     SELECT MAX(b.sold)::int AS peak_sold, (SELECT total FROM stock) AS total
     FROM booked b`,
    [roomId, checkIn, checkOut, propertyId],
  );
  const { peak_sold: peak = 0, total = 0 } = rows[0] || {};
  if (peak + roomsBooked > total) {
    throw ApiError.conflict(
      'Those dates are no longer available for this room type',
      { requested: roomsBooked, free: Math.max(0, total - peak) },
    );
  }
}

export async function createBooking(payload, actorId) {
  return withTransaction(async (client) => {
    let guestId = payload.guestId;
    if (!guestId) {
      const g = payload.guest;
      const existing = g.email
        ? await client.query('SELECT id FROM guests WHERE lower(email) = lower($1)', [g.email])
        : { rows: [] };
      if (existing.rows[0]) {
        guestId = existing.rows[0].id;
      } else {
        const ins = await client.query(
          `INSERT INTO guests (full_name, email, phone, country) VALUES ($1,$2,$3,$4) RETURNING id`,
          [g.fullName, g.email || null, g.phone || null, g.country || null],
        );
        guestId = ins.rows[0].id;
      }
    }

    let rateInr = payload.rateInr;
    if (rateInr == null) {
      // Fall back to the property's base rate for the room type, so a booking is
      // never silently priced at zero.
      const rt = await client.query(
        `SELECT rt.base_rate_inr FROM rooms r JOIN room_types rt ON rt.id = r.room_type_id
         WHERE r.id = $1`, [payload.roomId || null],
      );
      rateInr = rt.rows[0] ? Number(rt.rows[0].base_rate_inr) * payload.roomsBooked : 0;
    }

    const ref = `MUM-${Date.now().toString(36).toUpperCase()}-${Math.random().toString(36).slice(2, 6).toUpperCase()}`;
    const { rows } = await client.query(
      `INSERT INTO bookings
        (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked,
         adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status, created_by)
       VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$10,'INR',1,$11,$12,$13)
       RETURNING *`,
      [ref, payload.propertyId, payload.roomId || null, guestId, payload.checkIn, payload.checkOut,
       payload.roomsBooked, payload.adults, payload.children, rateInr, payload.source,
       payload.status, actorId || null],
    );
    const booking = rows[0];

    // Enqueue the notification emails inside the SAME transaction as the booking.
    // That is the whole point of doing it here rather than after the commit: if
    // the booking rolls back, no email job survives to tell a guest about a stay
    // that does not exist. If it commits, the jobs are guaranteed to be waiting.
    if (booking.status !== 'cancelled') {
      const detail = await client.query(
        `SELECT g.full_name AS guest_name, g.email AS guest_email, p.name AS property_name
         FROM guests g, properties p WHERE g.id = $1 AND p.id = $2`,
        [guestId, payload.propertyId],
      );
      const d = detail.rows[0] || {};
      const nights = Math.round(
        (Date.parse(payload.checkOut) - Date.parse(payload.checkIn)) / 86_400_000,
      );
      const emailData = {
        reference: booking.reference,
        propertyName: d.property_name,
        guestName: d.guest_name,
        guestEmail: d.guest_email,
        checkIn: payload.checkIn,
        checkOut: payload.checkOut,
        nights,
        roomsBooked: payload.roomsBooked,
        rateInr: Number(booking.rate_inr),
        source: booking.source,
      };
      if (d.guest_email) {
        await enqueue('booking_confirmation', { booking: emailData },
          { client, dedupeKey: `booking-confirm:${booking.id}` });
      }
      await enqueue('staff_booking_alert',
        { booking: emailData, to: config.mail.staffInbox },
        { client, dedupeKey: `booking-staff:${booking.id}` });
    }

    return booking;
  });
}
