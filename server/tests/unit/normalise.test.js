import { describe, it, expect } from 'vitest';
import {
  normaliseCurrency, toInr, parseDate, isoDate, cleanText, normaliseName,
  normaliseEmail, validateBookingRow, normaliseStatus, round2,
} from '../../src/etl/normalise.js';

describe('normaliseCurrency', () => {
  it.each([
    ['INR', 'INR'], ['inr', 'INR'], ['Rs', 'INR'], ['Rs.', 'INR'], ['₹', 'INR'],
    ['USD', 'USD'], ['usd', 'USD'], ['$', 'USD'], ['US$', 'USD'],
  ])('maps %s to %s', (input, expected) => {
    expect(normaliseCurrency(input)).toBe(expected);
  });

  it('returns null for an unknown currency rather than assuming INR', () => {
    // Guessing here would understate a USD booking by a factor of 84.
    expect(normaliseCurrency('EUR')).toBeNull();
    expect(normaliseCurrency('')).toBeNull();
    expect(normaliseCurrency(null)).toBeNull();
  });
});

describe('toInr', () => {
  it('leaves INR untouched and records a rate of 1', () => {
    const r = toInr(5000, 'INR', 84.5);
    expect(r).toMatchObject({ ok: true, amountInr: 5000, currency: 'INR', fxRate: 1 });
  });

  it('converts USD at the supplied rate and keeps that rate for audit', () => {
    const r = toInr(100, 'USD', 84.5);
    expect(r.amountInr).toBe(8450);
    expect(r.fxRate).toBe(84.5);
    expect(r.currency).toBe('USD');
  });

  it('rounds to two decimals', () => {
    expect(toInr(10.005, 'USD', 84.5).amountInr).toBe(845.42);
  });

  it('rejects an unknown currency', () => {
    expect(toInr(100, 'EUR', 84.5)).toMatchObject({ ok: false, issue: 'UNKNOWN_CURRENCY' });
  });

  it('strips currency symbols and thousands separators from the amount', () => {
    expect(toInr('₹5,000', 'INR', 84.5).amountInr).toBe(5000);
  });

  it('rejects a non-numeric amount', () => {
    expect(toInr('not a number', 'INR', 84.5)).toMatchObject({ ok: false, issue: 'NON_NUMERIC_AMOUNT' });
  });
});

describe('parseDate', () => {
  it('parses ISO dates', () => {
    expect(isoDate(parseDate('2026-03-04'))).toBe('2026-03-04');
  });

  it('parses DD/MM/YYYY as day-first, not month-first', () => {
    // The single most dangerous ambiguity in the export: reading this as
    // month-first would move a third of the bookings by a month.
    expect(isoDate(parseDate('04/03/2026'))).toBe('2026-03-04');
    expect(isoDate(parseDate('25/12/2026'))).toBe('2026-12-25');
  });

  it('rejects dates that do not exist', () => {
    expect(parseDate('31/02/2026')).toBeNull();
    expect(parseDate('2026-02-30')).toBeNull();
  });

  it('rejects free text', () => {
    expect(parseDate('next Tuesday')).toBeNull();
    expect(parseDate('')).toBeNull();
    expect(parseDate(null)).toBeNull();
  });
});

describe('text helpers', () => {
  it('collapses and trims whitespace', () => {
    expect(cleanText('  Aarav   Sharma ')).toBe('Aarav Sharma');
  });
  it('normalises name casing but keeps initials', () => {
    expect(normaliseName('  AARAV sharma ')).toBe('Aarav Sharma');
    expect(normaliseName('r j patel')).toBe('R J Patel');
  });
  it('lowercases and rejects malformed emails', () => {
    expect(normaliseEmail(' Aarav@Example.COM ')).toBe('aarav@example.com');
    expect(normaliseEmail('not-an-email')).toBeNull();
    expect(normaliseEmail('')).toBeNull();
  });
  it('normalises booking status, defaulting to confirmed', () => {
    expect(normaliseStatus('CHECKED OUT')).toBe('checked_out');
    expect(normaliseStatus('checked-in')).toBe('checked_in');
    expect(normaliseStatus('nonsense')).toBe('confirmed');
  });
  it('rounds halves correctly', () => {
    expect(round2(2.005)).toBe(2.01);
  });
});

describe('validateBookingRow', () => {
  const ctx = {
    usdInrRate: 84.5,
    propertyByCode: new Map([['MUM-CSB', { id: 'p1' }]]),
    guestByEmail: new Map([['aarav@example.com', { id: 'g1' }]]),
  };
  const good = {
    booking_ref: 'RAW-1', property_code: 'MUM-CSB', room_number: '10101',
    guest_email: 'aarav@example.com', check_in: '2026-03-01', check_out: '2026-03-04',
    rooms_booked: '2', adults: '2', children: '1', amount: '20000', currency: 'INR',
    source: 'website', status: 'confirmed',
  };

  it('accepts a valid row and returns a fully typed value', () => {
    const r = validateBookingRow(good, ctx);
    expect(r.ok).toBe(true);
    expect(r.value).toMatchObject({
      checkIn: '2026-03-01', checkOut: '2026-03-04', roomsBooked: 2,
      rateInr: 20000, currencyOriginal: 'INR', fxRate: 1,
    });
  });

  it('flags check-out before check-in', () => {
    const r = validateBookingRow({ ...good, check_out: '2026-02-27' }, ctx);
    expect(r.ok).toBe(false);
    expect(r.issues.map((i) => i.code)).toContain('CHECKOUT_NOT_AFTER_CHECKIN');
  });

  it('flags a zero-night stay (same day in and out)', () => {
    const r = validateBookingRow({ ...good, check_out: good.check_in }, ctx);
    expect(r.issues.map((i) => i.code)).toContain('CHECKOUT_NOT_AFTER_CHECKIN');
  });

  it('flags a negative rate', () => {
    const r = validateBookingRow({ ...good, amount: '-5000' }, ctx);
    expect(r.issues.map((i) => i.code)).toContain('NEGATIVE_RATE');
  });

  it('flags an unknown currency', () => {
    const r = validateBookingRow({ ...good, currency: 'EUR' }, ctx);
    expect(r.issues.map((i) => i.code)).toContain('UNKNOWN_CURRENCY');
  });

  it('flags an unknown property', () => {
    const r = validateBookingRow({ ...good, property_code: 'MUM-NOPE' }, ctx);
    expect(r.issues.map((i) => i.code)).toContain('UNKNOWN_PROPERTY');
  });

  it('flags an unknown guest', () => {
    const r = validateBookingRow({ ...good, guest_email: 'stranger@example.com' }, ctx);
    expect(r.issues.map((i) => i.code)).toContain('UNKNOWN_GUEST');
  });

  it('converts a USD row and records the rate used', () => {
    const r = validateBookingRow({ ...good, amount: '100', currency: '$' }, ctx);
    expect(r.value.rateInr).toBe(8450);
    expect(r.value.currencyOriginal).toBe('USD');
    expect(r.value.fxRate).toBe(84.5);
  });

  it('reports every problem at once rather than stopping at the first', () => {
    const r = validateBookingRow(
      { ...good, check_out: '2026-02-01', amount: '-1', currency: 'INR', property_code: 'X' }, ctx,
    );
    const codes = r.issues.map((i) => i.code);
    expect(codes).toEqual(expect.arrayContaining([
      'CHECKOUT_NOT_AFTER_CHECKIN', 'NEGATIVE_RATE', 'UNKNOWN_PROPERTY',
    ]));
  });

  it('reports an unknown currency instead of a negative rate', () => {
    // With no usable currency the INR amount cannot be derived, so a negative
    // rate is not a separate finding — the currency is the root cause.
    const r = validateBookingRow({ ...good, amount: '-1', currency: 'EUR' }, ctx);
    const codes = r.issues.map((i) => i.code);
    expect(codes).toContain('UNKNOWN_CURRENCY');
    expect(codes).not.toContain('NEGATIVE_RATE');
  });
});
