#!/usr/bin/env node
/**
 * exportSeedSql.js — emits the same clean dataset the ETL loads, as plain SQL.
 *
 * Why this exists: the deployed database is a managed Supabase instance that the
 * build environment cannot reach over TCP. The ETL normally writes through `pg`;
 * this reuses the *same* pure functions — validateBookingRow, mapRoomType,
 * normaliseName — to produce INSERT statements that can be applied through any
 * SQL channel, so the deployed data is derived by the same rules as the tested
 * one rather than by a second, divergent implementation.
 *
 * Foreign keys are resolved with subqueries on natural keys (property code, room
 * number, guest email) instead of generated UUIDs, which keeps the file portable.
 *
 * Run: node scripts/exportSeedSql.js
 */
import { readFile, writeFile } from 'node:fs/promises';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';
import { parse } from 'csv-parse/sync';

import { CANONICAL_ROOM_TYPES, mapRoomType } from '../src/etl/roomTypeMap.js';
import {
  validateBookingRow, normaliseName, normaliseEmail, cleanText, toInr, parseDate, isoDate,
  normaliseStatus,
} from '../src/etl/normalise.js';

const here = dirname(fileURLToPath(import.meta.url));
const RAW = join(here, '..', 'data', 'raw');
const OUT = join(here, '..', 'data', 'seed.sql');
const USD_INR = Number(process.env.FX_USD_INR || 84.5);

const readCsv = async (n) => parse(await readFile(join(RAW, n), 'utf8'), {
  columns: true, skip_empty_lines: true, trim: false,
});

/** Single-quote escaping. Every value that reaches SQL goes through this. */
const q = (v) => {
  if (v === null || v === undefined) return 'NULL';
  if (typeof v === 'number') return Number.isFinite(v) ? String(v) : 'NULL';
  return `'${String(v).replace(/'/g, "''")}'`;
};

const lines = [];
const stats = { properties: 0, rooms: 0, guests: 0, bookings: 0, quarantined: 0, reviews: 0, byCode: {} };
const note = (code) => { stats.byCode[code] = (stats.byCode[code] || 0) + 1; };

// ---------------------------------------------------------------- properties
const properties = await readCsv('properties.csv');
const propertyCodes = new Set();
lines.push('-- properties');
for (const p of properties) {
  const code = cleanText(p.property_code).toUpperCase();
  propertyCodes.add(code);
  lines.push(
    `INSERT INTO properties (code, name, city, star_rating) VALUES (${q(code)}, ${q(cleanText(p.property_name))}, 'Mumbai', ${q(Number(p.star_rating) || null)}) ON CONFLICT (code) DO NOTHING;`,
  );
  stats.properties += 1;
}

// ---------------------------------------------------------------- room types
lines.push('-- room types');
for (const rt of CANONICAL_ROOM_TYPES) {
  lines.push(
    `INSERT INTO room_types (code, name, description, max_occupancy, bed_type, base_rate_inr) VALUES (${q(rt.code)}, ${q(rt.name)}, ${q(rt.description)}, ${rt.maxOccupancy}, ${q(rt.bedType)}, ${rt.baseRateInr}) ON CONFLICT (code) DO NOTHING;`,
  );
}

// ---------------------------------------------------------------- rooms
lines.push('-- rooms');
const inventory = await readCsv('room_inventory.csv');
const roomKeys = new Set();
for (const row of inventory) {
  const code = cleanText(row.property_code).toUpperCase();
  if (!propertyCodes.has(code)) { note('UNKNOWN_PROPERTY'); continue; }
  const mapped = mapRoomType(row.room_type_raw, code);
  if (!mapped.canonical) { note('UNKNOWN_ROOM_TYPE'); continue; }
  const roomNumber = cleanText(row.room_number);
  lines.push(
    `INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, ${q(roomNumber)}, ${q(Number.parseInt(row.floor, 10) || null)}, TRUE
     FROM properties p, room_types rt WHERE p.code = ${q(code)} AND rt.code = ${q(mapped.canonical)}
     ON CONFLICT (property_id, room_number) DO NOTHING;`,
  );
  roomKeys.add(`${code}|${roomNumber}`);
  stats.rooms += 1;
}

// keep the denormalised count honest
lines.push(`UPDATE properties p SET total_rooms = COALESCE((SELECT count(*) FROM rooms r WHERE r.property_id = p.id AND r.is_active), 0);`);

// ---------------------------------------------------------------- guests
lines.push('-- guests');
const guestRows = await readCsv('guests.csv');
const guestEmails = new Set();
for (const row of guestRows) {
  const email = normaliseEmail(row.email);
  const name = normaliseName(row.full_name);
  if (!name) { note('MISSING_NAME'); continue; }
  if (!email) { note('MISSING_EMAIL'); continue; }
  if (guestEmails.has(email)) { note('DUPLICATE_GUEST'); continue; }
  guestEmails.add(email);
  lines.push(
    `INSERT INTO guests (full_name, email, phone, country) VALUES (${q(name)}, ${q(email)}, ${q(cleanText(row.phone) || null)}, ${q(cleanText(row.country) || null)}) ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;`,
  );
  stats.guests += 1;
}

// ---------------------------------------------------------------- bookings
lines.push('-- bookings');
const bookingRows = await readCsv('bookings_2026.csv');
const ctx = { usdInrRate: USD_INR, propertyByCode: new Map([...propertyCodes].map((c) => [c, 1])), guestByEmail: new Map([...guestEmails].map((e) => [e, 1])) };
for (const row of bookingRows) {
  const res = validateBookingRow(row, ctx);
  if (!res.ok) {
    for (const i of res.issues) note(i.code);
    stats.quarantined += 1;
    continue;
  }
  const v = res.value;
  const roomRef = v.roomNumber && roomKeys.has(`${v.propertyCode}|${v.roomNumber}`)
    ? `(SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = ${q(v.propertyCode)} AND r.room_number = ${q(v.roomNumber)})`
    : 'NULL';
  lines.push(
    `INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT ${q(v.reference)}, p.id, ${roomRef}, g.id, ${q(v.checkIn)}, ${q(v.checkOut)}, ${v.roomsBooked}, ${v.adults}, ${v.children}, ${v.rateInr}, ${v.amountOriginal}, ${q(v.currencyOriginal)}, ${v.fxRate}, ${q(v.source)}, ${q(v.status)}
     FROM properties p, guests g WHERE p.code = ${q(v.propertyCode)} AND lower(g.email) = ${q(v.guestEmail)}
     ON CONFLICT (reference) DO NOTHING;`,
  );
  stats.bookings += 1;
}

// ---------------------------------------------------------------- reviews
lines.push('-- reviews');
const reviewRows = await readCsv('reviews.csv');
for (const row of reviewRows) {
  const code = cleanText(row.property_code).toUpperCase();
  const rating = Number.parseInt(row.rating, 10);
  if (!propertyCodes.has(code)) { note('UNKNOWN_PROPERTY'); continue; }
  if (!Number.isFinite(rating) || rating < 1 || rating > 5) { note('INVALID_RATING'); continue; }
  const email = normaliseEmail(row.guest_email);
  const guestRef = email && guestEmails.has(email)
    ? `(SELECT id FROM guests WHERE lower(email) = ${q(email)})` : 'NULL';
  lines.push(
    `INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, ${guestRef}, ${rating}, ${q(cleanText(row.title) || null)}, ${q(cleanText(row.body) || null)}
     FROM properties p WHERE p.code = ${q(code)};`,
  );
  stats.reviews += 1;
}

await writeFile(OUT, lines.join('\n') + '\n', 'utf8');
console.log(`seed SQL written to ${OUT}`);
console.log(`  statements ${lines.filter((l) => !l.startsWith('--')).length}`);
console.log(`  ${JSON.stringify(stats)}`);
