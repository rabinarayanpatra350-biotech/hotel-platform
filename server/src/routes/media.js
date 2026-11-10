import { Router } from 'express';
import multer from 'multer';
import crypto from 'node:crypto';
import { mkdir } from 'node:fs/promises';
import { extname, join } from 'node:path';
import { query } from '../db/pool.js';
import { asyncHandler, ApiError } from '../lib/errors.js';
import { validateQuery } from '../lib/validate.js';
import { requireAuth, requireRole } from '../middleware/auth.js';
import { mediaQuerySchema } from '../schemas.js';
import config from '../config/index.js';

const router = Router();

const ALLOWED = new Map([
  ['image/jpeg', '.jpg'],
  ['image/png', '.png'],
  ['image/webp', '.webp'],
]);

const storage = multer.diskStorage({
  destination: async (_req, _file, cb) => {
    try { await mkdir(config.uploads.dir, { recursive: true }); cb(null, config.uploads.dir); }
    catch (e) { cb(e); }
  },
  // The stored name is generated, never taken from the client. A client-supplied
  // filename is a path-traversal and an XSS vector, so the original name is kept
  // only as metadata.
  filename: (_req, file, cb) => {
    const ext = ALLOWED.get(file.mimetype) || extname(file.originalname).toLowerCase();
    cb(null, `${Date.now()}-${crypto.randomBytes(8).toString('hex')}${ext}`);
  },
});

const upload = multer({
  storage,
  limits: { fileSize: config.uploads.maxBytes, files: 1 },
  fileFilter: (_req, file, cb) => {
    if (!ALLOWED.has(file.mimetype)) {
      return cb(ApiError.badRequest(`Unsupported file type: ${file.mimetype}. Use JPEG, PNG or WebP.`));
    }
    cb(null, true);
  },
});

router.post('/', requireAuth, requireRole('admin', 'staff'), upload.single('file'), asyncHandler(async (req, res) => {
  if (!req.file) throw ApiError.badRequest('No file was uploaded');
  const { entityType, entityId } = req.query;
  if (!entityType || !entityId) {
    throw ApiError.badRequest('entityType and entityId are required query parameters');
  }
  const url = config.uploads.publicBaseUrl
    ? `${config.uploads.publicBaseUrl}/${req.file.filename}`
    : `/uploads/${req.file.filename}`;

  const { rows } = await query(
    `INSERT INTO media (entity_type, entity_id, filename, original_name, mime_type, size_bytes, url, uploaded_by)
     VALUES ($1,$2,$3,$4,$5,$6,$7,$8) RETURNING *`,
    [entityType, entityId, req.file.filename, req.file.originalname,
     req.file.mimetype, req.file.size, url, req.user.id],
  );
  res.status(201).json({
    data: {
      id: rows[0].id, url, filename: rows[0].filename,
      originalName: rows[0].original_name, mimeType: rows[0].mime_type, sizeBytes: rows[0].size_bytes,
    },
  });
}));

router.get('/', validateQuery(mediaQuerySchema), asyncHandler(async (req, res) => {
  const { entityType, entityId } = req.query;
  const { rows } = await query(
    'SELECT * FROM media WHERE entity_type = $1 AND entity_id = $2 ORDER BY created_at DESC',
    [entityType, entityId],
  );
  res.json({
    data: rows.map((r) => ({
      id: r.id, url: r.url, originalName: r.original_name, mimeType: r.mime_type, sizeBytes: r.size_bytes,
    })),
  });
}));

router.delete('/:id', requireAuth, requireRole('admin', 'staff'), asyncHandler(async (req, res) => {
  const { rows } = await query('DELETE FROM media WHERE id = $1 RETURNING id', [req.params.id]);
  if (!rows[0]) throw ApiError.notFound('Media not found');
  res.status(204).end();
}));

export default router;
