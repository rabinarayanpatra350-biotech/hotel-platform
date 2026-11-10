import { Router } from 'express';
import { query } from '../db/pool.js';
import { asyncHandler, ApiError } from '../lib/errors.js';
import { validateBody, validateQuery } from '../lib/validate.js';
import { optionalAuth, requireAuth, requireRole } from '../middleware/auth.js';
import { reviewCreateSchema, reviewQuerySchema } from '../schemas.js';

const router = Router();
const map = (r) => ({
  id: r.id, propertyId: r.property_id, propertyName: r.property_name, rating: r.rating,
  title: r.title, body: r.body, guestName: r.guest_name, createdAt: r.created_at,
});

router.get('/', validateQuery(reviewQuerySchema), asyncHandler(async (req, res) => {
  const { page, pageSize, propertyId, minRating, order } = req.query;
  const where = ['1=1']; const params = [];
  if (propertyId) { params.push(propertyId); where.push(`rv.property_id = $${params.length}`); }
  if (minRating) { params.push(minRating); where.push(`rv.rating >= $${params.length}`); }
  const whereSql = where.join(' AND ');
  const total = await query(`SELECT count(*)::int AS c FROM reviews rv WHERE ${whereSql}`, params);
  params.push(pageSize, (page - 1) * pageSize);
  const { rows } = await query(
    `SELECT rv.*, p.name AS property_name, g.full_name AS guest_name
     FROM reviews rv JOIN properties p ON p.id = rv.property_id
     LEFT JOIN guests g ON g.id = rv.guest_id
     WHERE ${whereSql} ORDER BY rv.created_at ${order === 'asc' ? 'ASC' : 'DESC'}
     LIMIT $${params.length - 1} OFFSET $${params.length}`, params,
  );
  res.json({ data: rows.map(map), meta: { page, pageSize, total: total.rows[0].c } });
}));

router.post('/', optionalAuth, validateBody(reviewCreateSchema), asyncHandler(async (req, res) => {
  const b = req.body;
  const { rows } = await query(
    `INSERT INTO reviews (property_id, booking_id, guest_id, rating, title, body)
     VALUES ($1,$2,$3,$4,$5,$6) RETURNING *`,
    [b.propertyId, b.bookingId || null, b.guestId || null, b.rating, b.title || null, b.body],
  );
  res.status(201).json({ data: map(rows[0]) });
}));

router.delete('/:id', requireAuth, requireRole('admin'), asyncHandler(async (req, res) => {
  const { rows } = await query('DELETE FROM reviews WHERE id = $1 RETURNING id', [req.params.id]);
  if (!rows[0]) throw ApiError.notFound('Review not found');
  res.status(204).end();
}));

export default router;
