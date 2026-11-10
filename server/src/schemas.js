import { z } from 'zod';

/**
 * Every write schema lives here and is imported by both the API and the React
 * forms. The task asks for validation on client and server; the way to make
 * those two agree is not to write the rules twice, it is to write them once and
 * run them in both places.
 */

export const uuid = z.string().uuid('Must be a valid id');
export const isoDate = z
  .string()
  .regex(/^\d{4}-\d{2}-\d{2}$/, 'Use YYYY-MM-DD')
  .refine((v) => !Number.isNaN(Date.parse(v)), 'Not a real date');

export const pagination = {
  page: z.coerce.number().int().min(1).default(1),
  pageSize: z.coerce.number().int().min(1).max(100).default(20),
};

// ------------------------------------------------------------------ auth
export const signupSchema = z.object({
  email: z.string().trim().toLowerCase().email('Enter a valid email address'),
  password: z
    .string()
    .min(10, 'Use at least 10 characters')
    .max(128, 'Too long')
    .refine((v) => /[a-zA-Z]/.test(v) && /[0-9]/.test(v), 'Include at least one letter and one number'),
  fullName: z.string().trim().min(2, 'Enter your name').max(120),
});

export const loginSchema = z.object({
  email: z.string().trim().toLowerCase().email('Enter a valid email address'),
  password: z.string().min(1, 'Password is required'),
});

export const refreshSchema = z.object({ refreshToken: z.string().min(10).optional() });

export const roleSchema = z.object({ role: z.enum(['guest', 'staff', 'admin']) });

export const staffUserSchema = signupSchema.extend({
  role: z.enum(['guest', 'staff', 'admin']).default('staff'),
});

// ------------------------------------------------------------------ properties
export const propertyCreateSchema = z.object({
  code: z.string().trim().min(2).max(20).regex(/^[A-Z0-9-]+$/, 'Use capitals, digits and dashes only'),
  name: z.string().trim().min(3).max(160),
  city: z.string().trim().min(2).max(80).default('Mumbai'),
  address: z.string().trim().max(400).optional(),
  description: z.string().trim().max(4000).optional(),
  starRating: z.coerce.number().int().min(1).max(5).optional(),
  isActive: z.coerce.boolean().optional(),
});

export const propertyUpdateSchema = propertyCreateSchema.partial().omit({ code: true });

export const propertyQuerySchema = z.object({
  ...pagination,
  q: z.string().trim().max(120).optional(),
  city: z.string().trim().max(80).optional(),
  minStar: z.coerce.number().int().min(1).max(5).optional(),
  isActive: z.enum(['true', 'false']).optional(),
  sort: z.enum(['name', 'created_at', 'star_rating', 'total_rooms']).default('name'),
  order: z.enum(['asc', 'desc']).default('asc'),
});

// ------------------------------------------------------------------ room types
export const roomTypeCreateSchema = z.object({
  code: z.string().trim().min(2).max(30).regex(/^[a-z0-9_]+$/, 'Use lowercase letters, digits and underscores'),
  name: z.string().trim().min(2).max(80),
  description: z.string().trim().max(2000).optional(),
  maxOccupancy: z.coerce.number().int().min(1).max(12).default(2),
  bedType: z.string().trim().max(60).optional(),
  baseRateInr: z.coerce.number().min(0).max(10_000_000),
});

export const roomTypeUpdateSchema = roomTypeCreateSchema.partial().omit({ code: true });

// ------------------------------------------------------------------ rooms
export const roomCreateSchema = z.object({
  propertyId: uuid,
  roomTypeId: uuid,
  roomNumber: z.string().trim().min(1).max(20),
  floor: z.coerce.number().int().min(-5).max(120).optional(),
  isActive: z.coerce.boolean().optional(),
});

export const roomUpdateSchema = roomCreateSchema.partial().omit({ propertyId: true });

// ------------------------------------------------------------------ bookings
export const bookingCreateSchema = z
  .object({
    propertyId: uuid,
    roomId: uuid.optional(),
    guestId: uuid.optional(),
    // an inline guest is accepted so the public site can book without an account
    guest: z
      .object({
        fullName: z.string().trim().min(2).max(120),
        email: z.string().trim().toLowerCase().email().optional(),
        phone: z.string().trim().max(30).optional(),
        country: z.string().trim().max(60).optional(),
      })
      .optional(),
    checkIn: isoDate,
    checkOut: isoDate,
    roomsBooked: z.coerce.number().int().min(1).max(20).default(1),
    adults: z.coerce.number().int().min(1).max(20).default(1),
    children: z.coerce.number().int().min(0).max(10).default(0),
    rateInr: z.coerce.number().min(0).max(10_000_000).optional(),
    source: z.enum(['direct', 'website', 'ota', 'phone', 'walk_in']).default('website'),
    status: z.enum(['pending', 'confirmed', 'checked_in', 'checked_out', 'cancelled']).default('confirmed'),
  })
  .superRefine((v, ctx) => {
    if (Date.parse(v.checkOut) <= Date.parse(v.checkIn)) {
      ctx.addIssue({
        code: z.ZodIssueCode.custom,
        path: ['checkOut'],
        message: 'Check-out must be after check-in',
      });
    }
    if (!v.guestId && !v.guest) {
      ctx.addIssue({ code: z.ZodIssueCode.custom, path: ['guest'], message: 'Provide a guestId or guest details' });
    }
  });

export const bookingUpdateSchema = z
  .object({
    checkIn: isoDate.optional(),
    checkOut: isoDate.optional(),
    roomsBooked: z.coerce.number().int().min(1).max(20).optional(),
    adults: z.coerce.number().int().min(1).max(20).optional(),
    children: z.coerce.number().int().min(0).max(10).optional(),
    rateInr: z.coerce.number().min(0).max(10_000_000).optional(),
    status: z.enum(['pending', 'confirmed', 'checked_in', 'checked_out', 'cancelled']).optional(),
  })
  .refine((v) => Object.keys(v).length > 0, 'Nothing to update');

export const bookingQuerySchema = z.object({
  ...pagination,
  propertyId: uuid.optional(),
  guestId: uuid.optional(),
  status: z.enum(['pending', 'confirmed', 'checked_in', 'checked_out', 'cancelled']).optional(),
  from: isoDate.optional(),
  to: isoDate.optional(),
  q: z.string().trim().max(120).optional(),
  sort: z.enum(['check_in', 'created_at', 'rate_inr']).default('check_in'),
  order: z.enum(['asc', 'desc']).default('desc'),
});

// ------------------------------------------------------------------ reviews
export const reviewCreateSchema = z.object({
  propertyId: uuid,
  bookingId: uuid.optional(),
  guestId: uuid.optional(),
  rating: z.coerce.number().int().min(1, 'Rating is 1 to 5').max(5),
  title: z.string().trim().max(140).optional(),
  body: z.string().trim().min(10, 'Say a little more').max(4000),
});

export const reviewQuerySchema = z.object({
  ...pagination,
  propertyId: uuid.optional(),
  minRating: z.coerce.number().int().min(1).max(5).optional(),
  order: z.enum(['asc', 'desc']).default('desc'),
});

// ------------------------------------------------------------------ enquiries
export const enquiryCreateSchema = z.object({
  propertyId: uuid.optional(),
  name: z.string().trim().min(2).max(120),
  email: z.string().trim().toLowerCase().email('Enter a valid email address'),
  phone: z.string().trim().max(30).optional(),
  message: z.string().trim().min(10, 'Tell us a little more').max(4000),
});

export const enquiryUpdateSchema = z.object({
  status: z.enum(['new', 'contacted', 'closed']),
});

export const enquiryQuerySchema = z.object({
  ...pagination,
  status: z.enum(['new', 'contacted', 'closed']).optional(),
  propertyId: uuid.optional(),
});

// ------------------------------------------------------------------ metrics
export const metricsQuerySchema = z.object({
  propertyId: uuid.optional(),
  from: isoDate,
  to: isoDate,
  groupBy: z.enum(['property', 'month', 'none']).default('property'),
});

// ------------------------------------------------------------------ media
export const mediaQuerySchema = z.object({
  entityType: z.enum(['property', 'room_type', 'room']),
  entityId: uuid,
});

export const availabilityQuerySchema = z.object({
  propertyId: uuid,
  checkIn: isoDate,
  checkOut: isoDate,
  roomTypeId: uuid.optional(),
  adults: z.coerce.number().int().min(1).max(20).default(1),
});
