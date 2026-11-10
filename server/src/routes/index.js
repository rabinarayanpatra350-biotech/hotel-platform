import { Router } from 'express';
import authRoutes from './auth.js';
import propertyRoutes from './properties.js';
import roomTypeRoutes from './roomTypes.js';
import roomRoutes from './rooms.js';
import bookingRoutes from './bookings.js';
import reviewRoutes from './reviews.js';
import enquiryRoutes from './enquiries.js';
import metricsRoutes from './metrics.js';
import mediaRoutes from './media.js';
import userRoutes from './users.js';
import jobRoutes from './jobs.js';
import { query } from '../db/pool.js';
import { asyncHandler } from '../lib/errors.js';

const router = Router();

router.get('/health', asyncHandler(async (_req, res) => {
  const db = await query('SELECT 1 AS ok');
  res.json({
    data: {
      status: 'ok',
      database: db.rows[0].ok === 1 ? 'up' : 'down',
      uptimeSeconds: Math.round(process.uptime()),
      version: process.env.npm_package_version || '1.0.0',
    },
  });
}));

router.use('/auth', authRoutes);
router.use('/properties', propertyRoutes);
router.use('/room-types', roomTypeRoutes);
router.use('/rooms', roomRoutes);
router.use('/bookings', bookingRoutes);
router.use('/reviews', reviewRoutes);
router.use('/enquiries', enquiryRoutes);
router.use('/metrics', metricsRoutes);
router.use('/media', mediaRoutes);
router.use('/users', userRoutes);
router.use('/jobs', jobRoutes);

export default router;
