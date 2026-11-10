import { Router } from 'express';
import { query } from '../db/pool.js';
import { asyncHandler, ApiError } from '../lib/errors.js';
import { validateBody, validateQuery } from '../lib/validate.js';
import { requireAuth, requireRole } from '../middleware/auth.js';
import { enquiryCreateSchema, enquiryUpdateSchema, enquiryQuerySchema } from '../schemas.js';
import { withTransaction } from '../db/pool.js';
import { enqueue } from '../jobs/queue.js';

const router = Router();
const map = (r) => ({
  id: r.id, propertyId: r.property_id, propertyName: r.property_name, name: r.name,
  email: r.email, phone: r.phone, message: r.message, status: r.status, createdAt: r.created_at,
});

// Public: this is the enquiry form on the website.
router.post('/', validateBody(enquiryCreateSchema), asyncHandler(async (req, res) => {
  const b = req.body;
  // The enquiry and its acknowledgement are written together: the guest is told
  // their message arrived only if it actually did.
  const row = await withTransaction(async (client) => {
    const { rows } = await client.query(
      `INSERT INTO enquiries (property_id, name, email, phone, message) VALUES ($1,$2,$3,$4,$5) RETURNING *`,
      [b.propertyId || null, b.name, b.email, b.phone || null, b.message],
    );
    await enqueue('enquiry_acknowledgement',
      { enquiry: { name: b.name, email: b.email, message: b.message } },
      { client, dedupeKey: `enquiry-ack:${rows[0].id}` });
    return rows[0];
  });
  req.log?.info({ enquiryId: row.id }, 'enquiry received');
  res.status(201).json({ data: map(row) });
}));

router.get('/', requireAuth, requireRole('admin', 'staff'), validateQuery(enquiryQuerySchema), asyncHandler(async (req, res) => {
  const { page, pageSize, status, propertyId } = req.query;
  const where = ['1=1']; const params = [];
  if (status) { params.push(status); where.push(`e.status = $${params.length}`); }
  if (propertyId) { params.push(propertyId); where.push(`e.property_id = $${params.length}`); }
  const whereSql = where.join(' AND ');
  const total = await query(`SELECT count(*)::int AS c FROM enquiries e WHERE ${whereSql}`, params);
  params.push(pageSize, (page - 1) * pageSize);
  const { rows } = await query(
    `SELECT e.*, p.name AS property_name FROM enquiries e
     LEFT JOIN properties p ON p.id = e.property_id
     WHERE ${whereSql} ORDER BY e.created_at DESC
     LIMIT $${params.length - 1} OFFSET $${params.length}`, params,
  );
  res.json({ data: rows.map(map), meta: { page, pageSize, total: total.rows[0].c } });
}));

router.patch('/:id', requireAuth, requireRole('admin', 'staff'), validateBody(enquiryUpdateSchema), asyncHandler(async (req, res) => {
  const { rows } = await query(
    'UPDATE enquiries SET status = $1 WHERE id = $2 RETURNING *', [req.body.status, req.params.id],
  );
  if (!rows[0]) throw ApiError.notFound('Enquiry not found');
  res.json({ data: map(rows[0]) });
}));

export default router;
