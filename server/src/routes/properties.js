import { Router } from 'express';
import { query } from '../db/pool.js';
import { asyncHandler, ApiError } from '../lib/errors.js';
import { validateBody, validateQuery } from '../lib/validate.js';
import { requireAuth, requireRole, optionalAuth } from '../middleware/auth.js';
import { propertyCreateSchema, propertyUpdateSchema, propertyQuerySchema } from '../schemas.js';

const router = Router();

const map = (r) => ({
  id: r.id, code: r.code, name: r.name, city: r.city, address: r.address,
  description: r.description, starRating: r.star_rating, totalRooms: r.total_rooms,
  isActive: r.is_active, roomTypeCount: r.room_type_count !== undefined ? r.room_type_count : undefined,
  avgRating: r.avg_rating !== undefined ? (r.avg_rating === null ? null : Number(r.avg_rating)) : undefined,
  reviewCount: r.review_count !== undefined ? r.review_count : undefined,
  createdAt: r.created_at, updatedAt: r.updated_at,
});

router.get('/', optionalAuth, validateQuery(propertyQuerySchema), asyncHandler(async (req, res) => {
  const { page, pageSize, q, city, minStar, isActive, sort, order } = req.query;
  const where = ['1=1'];
  const params = [];
  if (q) { params.push(`%${q}%`); where.push(`(p.name ILIKE $${params.length} OR p.code ILIKE $${params.length} OR p.description ILIKE $${params.length})`); }
  if (city) { params.push(city); where.push(`p.city ILIKE $${params.length}`); }
  if (minStar) { params.push(minStar); where.push(`p.star_rating >= $${params.length}`); }
  if (isActive !== undefined) { params.push(isActive === 'true'); where.push(`p.is_active = $${params.length}`); }
  // Whitelisted sort column: never interpolate a client string into SQL.
  const sortCol = { name: 'p.name', created_at: 'p.created_at', star_rating: 'p.star_rating', total_rooms: 'p.total_rooms' }[sort];
  const dir = order === 'desc' ? 'DESC' : 'ASC';
  const whereSql = where.join(' AND ');

  const total = await query(`SELECT count(*)::int AS c FROM properties p WHERE ${whereSql}`, params);
  params.push(pageSize, (page - 1) * pageSize);
  const { rows } = await query(
    `SELECT p.*,
            (SELECT count(DISTINCT r.room_type_id)::int FROM rooms r WHERE r.property_id = p.id) AS room_type_count,
            (SELECT round(avg(rv.rating)::numeric, 2) FROM reviews rv WHERE rv.property_id = p.id) AS avg_rating,
            (SELECT count(*)::int FROM reviews rv WHERE rv.property_id = p.id) AS review_count
     FROM properties p WHERE ${whereSql}
     ORDER BY ${sortCol} ${dir}
     LIMIT $${params.length - 1} OFFSET $${params.length}`,
    params,
  );
  res.json({ data: rows.map(map), meta: { page, pageSize, total: total.rows[0].c, pages: Math.ceil(total.rows[0].c / pageSize) } });
}));

router.get('/:id', optionalAuth, asyncHandler(async (req, res) => {
  const { rows } = await query(
    `SELECT p.*,
            (SELECT count(DISTINCT r.room_type_id)::int FROM rooms r WHERE r.property_id = p.id) AS room_type_count,
            (SELECT round(avg(rv.rating)::numeric, 2) FROM reviews rv WHERE rv.property_id = p.id) AS avg_rating,
            (SELECT count(*)::int FROM reviews rv WHERE rv.property_id = p.id) AS review_count
     FROM properties p WHERE p.id = $1`, [req.params.id],
  );
  if (!rows[0]) throw ApiError.notFound('Property not found');
  const types = await query(
    `SELECT rt.*, count(r.id)::int AS rooms
     FROM rooms r JOIN room_types rt ON rt.id = r.room_type_id
     WHERE r.property_id = $1 GROUP BY rt.id ORDER BY rt.base_rate_inr`, [req.params.id],
  );
  res.json({
    data: {
      ...map(rows[0]),
      roomTypes: types.rows.map((t) => ({
        id: t.id, code: t.code, name: t.name, maxOccupancy: t.max_occupancy,
        bedType: t.bed_type, baseRateInr: Number(t.base_rate_inr), rooms: t.rooms,
      })),
    },
  });
}));

router.post('/', requireAuth, requireRole('admin', 'staff'), validateBody(propertyCreateSchema), asyncHandler(async (req, res) => {
  const b = req.body;
  const { rows } = await query(
    `INSERT INTO properties (code, name, city, address, description, star_rating, is_active)
     VALUES ($1,$2,$3,$4,$5,$6,COALESCE($7,TRUE)) RETURNING *`,
    [b.code, b.name, b.city, b.address || null, b.description || null, b.starRating || null, b.isActive],
  );
  req.log?.info({ propertyId: rows[0].id }, 'property created');
  res.status(201).json({ data: map(rows[0]) });
}));

router.patch('/:id', requireAuth, requireRole('admin', 'staff'), validateBody(propertyUpdateSchema), asyncHandler(async (req, res) => {
  const allowed = { name: 'name', city: 'city', address: 'address', description: 'description', starRating: 'star_rating', isActive: 'is_active' };
  const sets = []; const params = [];
  for (const [k, col] of Object.entries(allowed)) {
    if (req.body[k] !== undefined) { params.push(req.body[k]); sets.push(`${col} = $${params.length}`); }
  }
  if (!sets.length) throw ApiError.badRequest('Nothing to update');
  params.push(req.params.id);
  const { rows } = await query(
    `UPDATE properties SET ${sets.join(', ')}, updated_at = now() WHERE id = $${params.length} RETURNING *`, params,
  );
  if (!rows[0]) throw ApiError.notFound('Property not found');
  res.json({ data: map(rows[0]) });
}));

router.delete('/:id', requireAuth, requireRole('admin'), asyncHandler(async (req, res) => {
  const { rows } = await query('DELETE FROM properties WHERE id = $1 RETURNING id', [req.params.id]);
  if (!rows[0]) throw ApiError.notFound('Property not found');
  res.status(204).end();
}));

export default router;
