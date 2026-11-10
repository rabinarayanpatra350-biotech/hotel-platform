import { Router } from 'express';
import { query } from '../db/pool.js';
import { asyncHandler, ApiError } from '../lib/errors.js';
import { validateBody, validateQuery } from '../lib/validate.js';
import { requireAuth, requireRole, optionalAuth } from '../middleware/auth.js';
import { bookingCreateSchema, bookingUpdateSchema, bookingQuerySchema } from '../schemas.js';
import { createBooking, assertAvailable } from '../services/bookingService.js';

const router = Router();

const map = (r) => ({
  id: r.id, reference: r.reference, propertyId: r.property_id, propertyName: r.property_name,
  roomId: r.room_id, roomNumber: r.room_number, guestId: r.guest_id, guestName: r.guest_name,
  guestEmail: r.guest_email, checkIn: r.check_in?.toISOString?.().slice(0, 10) ?? r.check_in,
  checkOut: r.check_out?.toISOString?.().slice(0, 10) ?? r.check_out,
  nights: r.nights, roomsBooked: r.rooms_booked, adults: r.adults, children: r.children,
  rateInr: Number(r.rate_inr), amountOriginal: r.amount_original ? Number(r.amount_original) : null,
  currencyOriginal: r.currency_original, fxRate: r.fx_rate ? Number(r.fx_rate) : null,
  source: r.source, status: r.status, createdAt: r.created_at, updatedAt: r.updated_at,
});

const SELECT = `
  SELECT b.*, p.name AS property_name, r.room_number, g.full_name AS guest_name, g.email AS guest_email,
         (b.check_out - b.check_in) AS nights
  FROM bookings b
  JOIN properties p ON p.id = b.property_id
  LEFT JOIN rooms r ON r.id = b.room_id
  JOIN guests g ON g.id = b.guest_id`;

router.get('/', requireAuth, validateQuery(bookingQuerySchema), asyncHandler(async (req, res) => {
  const { page, pageSize, propertyId, guestId, status, from, to, q, sort, order } = req.query;
  const where = ['1=1']; const params = [];

  // A guest may only ever see their own bookings; staff and admin see all.
  if (req.user.role === 'guest') {
    params.push(req.user.email);
    where.push(`lower(g.email) = lower($${params.length})`);
  } else if (guestId) { params.push(guestId); where.push(`b.guest_id = $${params.length}`); }

  if (propertyId) { params.push(propertyId); where.push(`b.property_id = $${params.length}`); }
  if (status) { params.push(status); where.push(`b.status = $${params.length}`); }
  if (from) { params.push(from); where.push(`b.check_out > $${params.length}`); }
  if (to) { params.push(to); where.push(`b.check_in < $${params.length}`); }
  if (q) { params.push(`%${q}%`); where.push(`(b.reference ILIKE $${params.length} OR g.full_name ILIKE $${params.length})`); }

  const sortCol = { check_in: 'b.check_in', created_at: 'b.created_at', rate_inr: 'b.rate_inr' }[sort];
  const dir = order === 'desc' ? 'DESC' : 'ASC';
  const whereSql = where.join(' AND ');
  const total = await query(`SELECT count(*)::int AS c FROM bookings b JOIN guests g ON g.id = b.guest_id WHERE ${whereSql}`, params);
  params.push(pageSize, (page - 1) * pageSize);
  const { rows } = await query(
    `${SELECT} WHERE ${whereSql} ORDER BY ${sortCol} ${dir} LIMIT $${params.length - 1} OFFSET $${params.length}`, params,
  );
  res.json({ data: rows.map(map), meta: { page, pageSize, total: total.rows[0].c, pages: Math.ceil(total.rows[0].c / pageSize) } });
}));

router.get('/:id', requireAuth, asyncHandler(async (req, res) => {
  const { rows } = await query(`${SELECT} WHERE b.id = $1`, [req.params.id]);
  if (!rows[0]) throw ApiError.notFound('Booking not found');
  if (req.user.role === 'guest' && rows[0].guest_email?.toLowerCase() !== req.user.email.toLowerCase()) {
    throw ApiError.forbidden();
  }
  res.json({ data: map(rows[0]) });
}));

// Public: the website takes bookings from guests who are not signed in.
router.post('/', optionalAuth, validateBody(bookingCreateSchema), asyncHandler(async (req, res) => {
  const b = req.body;
  if (b.roomId) {
    await assertAvailable({
      propertyId: b.propertyId, roomId: b.roomId,
      checkIn: b.checkIn, checkOut: b.checkOut, roomsBooked: b.roomsBooked,
    });
  }
  const row = await createBooking(b, req.user?.id);
  req.log?.info({ bookingId: row.id, reference: row.reference }, 'booking created');
  const full = await query(`${SELECT} WHERE b.id = $1`, [row.id]);
  res.status(201).json({ data: map(full.rows[0]) });
}));

router.patch('/:id', requireAuth, requireRole('admin', 'staff'), validateBody(bookingUpdateSchema), asyncHandler(async (req, res) => {
  const allowed = { checkIn: 'check_in', checkOut: 'check_out', roomsBooked: 'rooms_booked', adults: 'adults', children: 'children', rateInr: 'rate_inr', status: 'status' };
  const sets = []; const params = [];
  for (const [k, col] of Object.entries(allowed)) {
    if (req.body[k] !== undefined) { params.push(req.body[k]); sets.push(`${col} = $${params.length}`); }
  }
  if (!sets.length) throw ApiError.badRequest('Nothing to update');
  params.push(req.params.id);
  const { rows } = await query(
    `UPDATE bookings SET ${sets.join(', ')}, updated_at = now() WHERE id = $${params.length} RETURNING *`, params,
  );
  if (!rows[0]) throw ApiError.notFound('Booking not found');
  const full = await query(`${SELECT} WHERE b.id = $1`, [rows[0].id]);
  res.json({ data: map(full.rows[0]) });
}));

router.delete('/:id', requireAuth, requireRole('admin'), asyncHandler(async (req, res) => {
  const { rows } = await query('DELETE FROM bookings WHERE id = $1 RETURNING id', [req.params.id]);
  if (!rows[0]) throw ApiError.notFound('Booking not found');
  res.status(204).end();
}));

export default router;
