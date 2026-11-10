import { Router } from 'express';
import { query } from '../db/pool.js';
import { asyncHandler, ApiError } from '../lib/errors.js';
import { validateBody } from '../lib/validate.js';
import { requireAuth, requireRole } from '../middleware/auth.js';
import { roomTypeCreateSchema, roomTypeUpdateSchema } from '../schemas.js';

const router = Router();
const map = (r) => ({
  id: r.id, code: r.code, name: r.name, description: r.description,
  maxOccupancy: r.max_occupancy, bedType: r.bed_type,
  baseRateInr: Number(r.base_rate_inr), rooms: r.rooms, createdAt: r.created_at,
});

router.get('/', asyncHandler(async (_req, res) => {
  const { rows } = await query(
    `SELECT rt.*, count(r.id)::int AS rooms FROM room_types rt
     LEFT JOIN rooms r ON r.room_type_id = rt.id
     GROUP BY rt.id ORDER BY rt.base_rate_inr`,
  );
  res.json({ data: rows.map(map) });
}));

router.post('/', requireAuth, requireRole('admin', 'staff'), validateBody(roomTypeCreateSchema), asyncHandler(async (req, res) => {
  const b = req.body;
  const { rows } = await query(
    `INSERT INTO room_types (code, name, description, max_occupancy, bed_type, base_rate_inr)
     VALUES ($1,$2,$3,$4,$5,$6) RETURNING *`,
    [b.code, b.name, b.description || null, b.maxOccupancy, b.bedType || null, b.baseRateInr],
  );
  res.status(201).json({ data: map(rows[0]) });
}));

router.patch('/:id', requireAuth, requireRole('admin', 'staff'), validateBody(roomTypeUpdateSchema), asyncHandler(async (req, res) => {
  const allowed = { name: 'name', description: 'description', maxOccupancy: 'max_occupancy', bedType: 'bed_type', baseRateInr: 'base_rate_inr' };
  const sets = []; const params = [];
  for (const [k, col] of Object.entries(allowed)) {
    if (req.body[k] !== undefined) { params.push(req.body[k]); sets.push(`${col} = $${params.length}`); }
  }
  if (!sets.length) throw ApiError.badRequest('Nothing to update');
  params.push(req.params.id);
  const { rows } = await query(`UPDATE room_types SET ${sets.join(', ')} WHERE id = $${params.length} RETURNING *`, params);
  if (!rows[0]) throw ApiError.notFound('Room type not found');
  res.json({ data: map(rows[0]) });
}));

router.delete('/:id', requireAuth, requireRole('admin'), asyncHandler(async (req, res) => {
  const { rows } = await query('DELETE FROM room_types WHERE id = $1 RETURNING id', [req.params.id]);
  if (!rows[0]) throw ApiError.notFound('Room type not found');
  res.status(204).end();
}));

export default router;
