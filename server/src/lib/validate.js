import { ZodError } from 'zod';
import { ApiError } from './errors.js';

/**
 * Validation runs on the server for every write, regardless of what the client
 * did. The same zod schemas are re-used by the React forms so the browser shows
 * the same messages before the request is even sent — one source of truth,
 * enforced twice.
 */
export function parse(schema, data) {
  const result = schema.safeParse(data);
  if (!result.success) {
    throw ApiError.unprocessable('Validation failed', formatZod(result.error));
  }
  return result.data;
}

export function formatZod(error) {
  return error.issues.map((i) => ({
    field: i.path.join('.') || '(root)',
    message: i.message,
  }));
}

export function validateBody(schema) {
  return (req, _res, next) => {
    try {
      req.body = parse(schema, req.body);
      next();
    } catch (e) { next(e); }
  };
}

export function validateQuery(schema) {
  return (req, _res, next) => {
    try {
      req.query = parse(schema, req.query);
      next();
    } catch (e) { next(e); }
  };
}

export { ZodError };
