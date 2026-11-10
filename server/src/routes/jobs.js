import { Router } from 'express';
import { asyncHandler } from '../lib/errors.js';
import { requireAuth, requireRole } from '../middleware/auth.js';
import { query } from '../db/pool.js';
import { stats, listJobs } from '../jobs/queue.js';
import { transportName } from '../lib/mailer.js';

const router = Router();
router.use(requireAuth, requireRole('admin', 'staff'));

/**
 * Queue observability. A background queue that nobody can see is a queue nobody
 * can debug: when a guest says the confirmation never arrived, the first
 * question is whether the job ran, and this answers it.
 */
router.get('/', asyncHandler(async (req, res) => {
  const [counts, jobs] = await Promise.all([
    stats(),
    listJobs({ status: req.query.status, limit: Number(req.query.limit) || 50 }),
  ]);
  res.json({ data: { counts, jobs, emailTransport: transportName() } });
}));

router.get('/emails', asyncHandler(async (req, res) => {
  const { rows } = await query(
    `SELECT id, to_address, subject, template, status, provider, error, created_at
     FROM email_log ORDER BY created_at DESC LIMIT $1`,
    [Number(req.query.limit) || 50],
  );
  res.json({
    data: rows.map((r) => ({
      id: r.id, to: r.to_address, subject: r.subject, template: r.template,
      status: r.status, provider: r.provider, error: r.error, createdAt: r.created_at,
    })),
  });
}));

export default router;
