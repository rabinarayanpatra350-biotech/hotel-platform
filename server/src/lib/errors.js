/**
 * One error shape for the whole API. Handlers throw; the error middleware turns
 * whatever comes out into the same JSON body, so a client never has to guess
 * whether it got `message`, `error` or `detail`.
 */
export class ApiError extends Error {
  constructor(status, code, message, details) {
    super(message);
    this.name = 'ApiError';
    this.status = status;
    this.code = code;
    this.details = details;
  }
  static badRequest(msg = 'Bad request', details) { return new ApiError(400, 'BAD_REQUEST', msg, details); }
  static unauthorized(msg = 'Authentication required') { return new ApiError(401, 'UNAUTHORIZED', msg); }
  static forbidden(msg = 'You do not have access to this resource') { return new ApiError(403, 'FORBIDDEN', msg); }
  static notFound(msg = 'Resource not found') { return new ApiError(404, 'NOT_FOUND', msg); }
  static conflict(msg = 'Resource already exists', details) { return new ApiError(409, 'CONFLICT', msg, details); }
  static unprocessable(msg = 'Validation failed', details) { return new ApiError(422, 'VALIDATION_FAILED', msg, details); }
  static tooMany(msg = 'Too many requests') { return new ApiError(429, 'RATE_LIMITED', msg); }
  static internal(msg = 'Something went wrong') { return new ApiError(500, 'INTERNAL_ERROR', msg); }
}

export function notFoundHandler(req, _res, next) {
  next(ApiError.notFound(`No route for ${req.method} ${req.originalUrl}`));
}

// eslint-disable-next-line no-unused-vars
export function errorHandler(err, req, res, _next) {
  const isApi = err instanceof ApiError;
  const status = isApi ? err.status : (err.status || 500);
  const code = isApi ? err.code : 'INTERNAL_ERROR';

  if (status >= 500) {
    req.log?.error({ err }, 'unhandled error');
  } else {
    req.log?.info({ code, path: req.originalUrl }, 'request rejected');
  }

  // Postgres error codes worth translating into something a client can act on.
  let body = {
    error: {
      code,
      message: isApi ? err.message : 'Something went wrong',
      ...(isApi && err.details ? { details: err.details } : {}),
    },
  };
  if (err.code === '23505') { body = { error: { code: 'CONFLICT', message: 'That record already exists' } }; }
  else if (err.code === '23503') { body = { error: { code: 'BAD_REQUEST', message: 'Related record does not exist' } }; }
  else if (err.code === '23514') { body = { error: { code: 'VALIDATION_FAILED', message: 'A database constraint rejected this value' } }; }

  const finalStatus = err.code === '23505' ? 409 : (err.code === '23503' || err.code === '23514' ? 400 : status);
  if (req.id) body.error.requestId = req.id;
  res.status(finalStatus).json(body);
}

/** Wraps an async handler so a rejected promise reaches the error middleware. */
export const asyncHandler = (fn) => (req, res, next) => Promise.resolve(fn(req, res, next)).catch(next);
