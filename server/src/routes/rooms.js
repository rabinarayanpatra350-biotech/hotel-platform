import { Router } from 'express';
import { query } from '../db/pool.js';
import { asyncHandler, ApiError } from '../lib/errors.js';
import { validateBody, validateQuery } from '../lib/validate.js';
import { requireAuth, requireRole } from '../middleware/auth.js';
import { roomCreateSchema, roomUpdateSchema, availabilityQuerySchema } from '../schemas.js';
import { availability } from '../services/bookingService.js';

const router = Router();
const map = (r) => ({
  id: r.id, propertyId: r.property_id, roomTypeId: r.room_type_id, roomNumber: r.room_number,
  floor: r.floor, isActive: r.is_active, roomTypeName: r.room_type_name, propertyName: r.property_name,
});

router.get('/', requireAuth, requireRole('admin', 'staff'), asyncHandler(async (req, res) => {
  const params = []; const where = ['1=1'];
  if (req.query.propertyId) { params.push(req.query.propertyId); where.push(`r.property_id = $${params.length}`); }
  if (req.query.roomTypeId) { params.push(req.query.roomTypeId); where.push(`r.room_type_id = $${params.length}`); }
  const { rows } = await query(
    `SELECT r.*, rt.name AS room_type_name, p.name AS property_name
     FROM rooms r JOIN room_types rt ON rt.id = r.room_type_id
     JOIN properties p ON p.id = r.property_id
     WHERE ${where.join(' AND ')} ORDER BY p.name, r.room_number LIMIT 500`, params,
  );
  res.json({ data: rows.map(map) });
}));

// Public: what is actually free for a given stay.
router.get('/availability', validateQuery(availabilityQuerySchema), asyncHandler(async (req, res) => {
  res.json({ data: await availability(req.query) });
}));

router.post('/', requireAuth, requireRole('admin', 'staff'), validateBody(roomCreateSchema), asyncHandler(async (req, res) => {
  const b = req.body;
  const { rows } = await query(
    `INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     VALUES ($1,$2,$3,$4,COALESCE($5,TRUE)) RETURNING *`,
    [b.propertyId, b.roomTypeId, b.roomNumber, b.floor ?? null, b.isActive],
  );
  // Keep the denormalised count on the property honest.
  await query(
    `UPDATE properties SET total_rooms = (SELECT count(*) FROM rooms WHERE property_id = $1 AND is_active)
     WHERE id = $1`, [b.propertyId],
  );
  res.status(201).json({ data: map(rows[0]) });
}));

router.patch('/:id', requireAuth, requireRole('admin', 'staff'), validateBody(roomUpdateSchema), asyncHandler(async (req, res) => {
  const allowed = { roomTypeId: 'room_type_id', roomNumber: 'room_number', floor: 'floor', isActive: 'is_active' };
  const sets = []; const params = [];
  for (const [k, col] of Object.entries(allowed)) {
    if (req.body[k] !== undefined) { params.push(req.body[k]); sets.push(`${col} = $${params.length}`); }
  }
  if (!sets.length) throw ApiError.badRequest('Nothing to update');
  params.push(req.params.id);
  const { rows } = await query(`UPDATE rooms SET ${sets.join(', ')} WHERE id = $${params.length} RETURNING *`, params);
  if (!rows[0]) throw ApiError.notFound('Room not found');
  res.json({ data: map(rows[0]) });
}));

router.delete('/:id', requireAuth, requireRole('admin'), asyncHandler(async (req, res) => {
  const { rows } = await query('DELETE FROM rooms WHERE id = $1 RETURNING property_id', [req.params.id]);
  if (!rows[0]) throw ApiError.notFound('Room not found');
  await query(
    `UPDATE properties SET total_rooms = (SELECT count(*) FROM rooms WHERE property_id = $1 AND is_active) WHERE id = $1`,
    [rows[0].property_id],
  );
  res.status(204).end();
}));

export default router;
