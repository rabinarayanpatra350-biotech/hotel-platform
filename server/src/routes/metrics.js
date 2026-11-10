import { Router } from 'express';
import { asyncHandler } from '../lib/errors.js';
import { validateQuery } from '../lib/validate.js';
import { requireAuth, requireRole } from '../middleware/auth.js';
import { metricsQuerySchema } from '../schemas.js';
import { computeMetrics, occupancySeries } from '../services/metricsService.js';

const router = Router();
router.use(requireAuth, requireRole('admin', 'staff'));

// The admin dashboard's headline numbers.
router.get('/', validateQuery(metricsQuerySchema), asyncHandler(async (req, res) => {
  res.json({ data: await computeMetrics(req.query) });
}));

router.get('/occupancy-series', asyncHandler(async (req, res) => {
  const { propertyId, from, to } = req.query;
  res.json({ data: await occupancySeries({ propertyId, from, to }) });
}));

export default router;
