/**
 * Pure normalisation helpers. No database, no I/O — which is what makes them
 * cheap to unit-test exhaustively, and why the ETL's correctness rests on tested
 * functions rather than on inspection of the loaded tables.
 */

/** Currencies the group actually uses, with the spellings that appear in exports. */
export const CURRENCY_ALIASES = {
  inr: 'INR', rs: 'INR', 'rs.': 'INR', '₹': 'INR', rupees: 'INR', 'inr.': 'INR',
  usd: 'USD', '$': 'USD', us$: 'USD', dollars: 'USD', 'usd.': 'USD',
};

/**
 * Normalises a raw currency token to ISO 4217, or returns null.
 * Returns null rather than guessing: an unknown currency silently treated as INR
 * would understate a USD booking by a factor of 84.
 */
export function normaliseCurrency(raw) {
  if (raw === null || raw === undefined) return null;
  const key = String(raw).trim().toLowerCase();
  return CURRENCY_ALIASES[key] || null;
}

/**
 * Converts an amount to INR and returns the full audit trail.
 * The FX rate used is returned alongside the result so that every converted row
 * can be re-derived later; a conversion without its rate is unauditable.
 */
export function toInr(amount, currencyRaw, usdInrRate) {
  const currency = normaliseCurrency(currencyRaw);
  if (currency === null) return { ok: false, issue: 'UNKNOWN_CURRENCY', currencyRaw };
  let n;
  if (typeof amount === 'number') {
    n = amount;
  } else {
    // Strip currency symbols and thousands separators, but keep the sign. An
    // amount that strips down to nothing must be rejected, not read as zero:
    // Number('') is 0 and finite, which would quietly price a stay at nothing.
    const stripped = String(amount ?? '').replace(/[^0-9.\-]/g, '');
    n = stripped === '' || stripped === '-' || stripped === '.' ? Number.NaN : Number(stripped);
  }
  if (!Number.isFinite(n)) return { ok: false, issue: 'NON_NUMERIC_AMOUNT', amount };
  if (currency === 'INR') return { ok: true, amountInr: round2(n), currency: 'INR', fxRate: 1 };
  return { ok: true, amountInr: round2(n * usdInrRate), currency: 'USD', fxRate: usdInrRate };
}

/**
 * Parses the two date formats the exports use: ISO (YYYY-MM-DD) and the Indian
 * DD/MM/YYYY. Order matters — "03/04/2026" is 3 April here, not 4 March, and
 * getting it backwards would silently shift a third of the bookings by a month.
 */
export function parseDate(raw) {
  if (raw === null || raw === undefined) return null;
  const s = String(raw).trim();
  if (!s) return null;

  const iso = /^(\d{4})-(\d{2})-(\d{2})$/.exec(s);
  if (iso) {
    const [, y, m, d] = iso;
    return validDate(Number(y), Number(m), Number(d));
  }
  const dmy = /^(\d{1,2})\/(\d{1,2})\/(\d{4})$/.exec(s);
  if (dmy) {
    const [, d, m, y] = dmy;
    return validDate(Number(y), Number(m), Number(d));
  }
  return null;
}

function validDate(y, m, d) {
  if (m < 1 || m > 12 || d < 1 || d > 31) return null;
  const dt = new Date(Date.UTC(y, m - 1, d));
  // Rejects 31 February, which Date would otherwise roll into March.
  if (dt.getUTCFullYear() !== y || dt.getUTCMonth() !== m - 1 || dt.getUTCDate() !== d) return null;
  return dt;
}

export function isoDate(d) {
  return d instanceof Date && !Number.isNaN(d.getTime()) ? d.toISOString().slice(0, 10) : null;
}

export const round2 = (n) => Math.round((Number(n) + Number.EPSILON) * 100) / 100;

/** Collapses runs of whitespace and trims. "  Aarav  Sharma " -> "Aarav Sharma". */
export function cleanText(raw) {
  if (raw === null || raw === undefined) return '';
  return String(raw).replace(/\s+/g, ' ').trim();
}

/** Title-cases a name that may have arrived in any case. */
export function normaliseName(raw) {
  const t = cleanText(raw);
  if (!t) return '';
  return t.split(' ').map((w) => (w.length <= 2 ? w.toUpperCase() : w[0].toUpperCase() + w.slice(1).toLowerCase())).join(' ');
}

export function normaliseEmail(raw) {
  const t = cleanText(raw).toLowerCase();
  if (!t) return null;
  // Deliberately permissive: an export's emails are not ours to reject, only to
  // flag. A malformed one is quarantined by the caller, not silently dropped.
  return /^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(t) ? t : null;
}

/**
 * Validates one raw booking row and returns either a cleaned value or a list of
 * reasons it cannot be loaded. Every reason is a code, not prose, so the
 * data-quality report can count and group them.
 */
export function validateBookingRow(row, ctx) {
  const issues = [];
  const checkIn = parseDate(row.check_in);
  const checkOut = parseDate(row.check_out);

  if (!checkIn) issues.push({ code: 'INVALID_CHECK_IN', detail: `Could not parse check-in "${row.check_in}"` });
  if (!checkOut) issues.push({ code: 'INVALID_CHECK_OUT', detail: `Could not parse check-out "${row.check_out}"` });
  if (checkIn && checkOut && checkOut.getTime() <= checkIn.getTime()) {
    issues.push({
      code: 'CHECKOUT_NOT_AFTER_CHECKIN',
      detail: `check_out ${isoDate(checkOut)} is not after check_in ${isoDate(checkIn)}`,
    });
  }

  const money = toInr(row.amount, row.currency, ctx.usdInrRate);
  if (!money.ok) issues.push({ code: money.issue, detail: `Amount "${row.amount}" / currency "${row.currency}"` });
  else if (money.amountInr < 0) {
    issues.push({ code: 'NEGATIVE_RATE', detail: `Amount resolves to ${money.amountInr} INR` });
  }

  const roomsBooked = Number.parseInt(row.rooms_booked, 10);
  if (!Number.isFinite(roomsBooked) || roomsBooked < 1) {
    issues.push({ code: 'INVALID_ROOMS_BOOKED', detail: `rooms_booked "${row.rooms_booked}"` });
  }

  if (!ctx.propertyByCode.has(cleanText(row.property_code).toUpperCase())) {
    issues.push({ code: 'UNKNOWN_PROPERTY', detail: `Property "${row.property_code}" is not in the group` });
  }

  const email = normaliseEmail(row.guest_email);
  if (!email) issues.push({ code: 'INVALID_GUEST_EMAIL', detail: `Guest email "${row.guest_email}"` });
  else if (!ctx.guestByEmail.has(email)) {
    issues.push({ code: 'UNKNOWN_GUEST', detail: `No guest record for ${email}` });
  }

  if (issues.length) return { ok: false, issues };

  return {
    ok: true,
    value: {
      reference: cleanText(row.booking_ref),
      propertyCode: cleanText(row.property_code).toUpperCase(),
      roomNumber: cleanText(row.room_number) || null,
      guestEmail: email,
      checkIn: isoDate(checkIn),
      checkOut: isoDate(checkOut),
      roomsBooked,
      adults: Math.max(1, Number.parseInt(row.adults, 10) || 1),
      children: Math.max(0, Number.parseInt(row.children, 10) || 0),
      rateInr: money.amountInr,
      amountOriginal: round2(Number(String(row.amount).replace(/[^0-9.\-]/g, ''))),
      currencyOriginal: money.currency,
      fxRate: money.fxRate,
      source: cleanText(row.source).toLowerCase() || 'unknown',
      status: normaliseStatus(row.status),
    },
  };
}

const STATUSES = new Set(['pending', 'confirmed', 'checked_in', 'checked_out', 'cancelled']);
export function normaliseStatus(raw) {
  const s = cleanText(raw).toLowerCase().replace(/[\s-]+/g, '_');
  return STATUSES.has(s) ? s : 'confirmed';
}
