import { Router } from 'express';
import { asyncHandler } from '../lib/errors.js';
import { validateBody } from '../lib/validate.js';
import { requireAuth, requireRole } from '../middleware/auth.js';
import { roleSchema, staffUserSchema } from '../schemas.js';
import * as auth from '../services/authService.js';
import { query } from '../db/pool.js';

const router = Router();
router.use(requireAuth, requireRole('admin'));

router.get('/', asyncHandler(async (req, res) => {
  res.json({ data: await auth.listUsers({ page: 1, pageSize: 100, role: req.query.role }) });
}));

// Admin-created staff accounts — the only way a non-guest role is ever granted.
router.post('/', validateBody(staffUserSchema), asyncHandler(async (req, res) => {
  const b = req.body;
  const hash = await auth.hashPassword(b.password);
  const { rows } = await query(
    `INSERT INTO users (email, password_hash, full_name, role) VALUES ($1,$2,$3,$4) RETURNING *`,
    [b.email, hash, b.fullName, b.role],
  );
  res.status(201).json({ data: auth.publicUser(rows[0]) });
}));

router.patch('/:id/role', validateBody(roleSchema), asyncHandler(async (req, res) => {
  res.json({ data: await auth.setRole(req.params.id, req.body.role) });
}));

export default router;
