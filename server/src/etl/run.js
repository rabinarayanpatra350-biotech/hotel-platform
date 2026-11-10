#!/usr/bin/env node
/**
 * run.js — the normalisation pipeline.
 *
 * Reads the raw exports from 14 properties, normalises them, loads what is
 * trustworthy and quarantines the rest with a reason. Nothing is silently
 * dropped and nothing is silently coerced: every rejected row is written to
 * etl_issues with the row number, the issue code and the original row, so the
 * decision can be reviewed later by someone who was not there when it was made.
 *
 * Idempotent: re-running replaces the loaded rows and appends a new batch, so a
 * mistake in the mapping is fixed by correcting the map and running again.
 *
 * Run: npm run etl
 */
import { readFile } from 'node:fs/promises';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';
import { parse } from 'csv-parse/sync';

import config from '../config/index.js';
import { pool, query, withTransaction } from '../db/pool.js';
import logger from '../lib/logger.js';
import { CANONICAL_ROOM_TYPES, mapRoomType } from './roomTypeMap.js';
import {
  validateBookingRow, normaliseName, normaliseEmail, cleanText,
  normaliseCurrency, toInr, parseDate, isoDate,
} from './normalise.js';

const here = dirname(fileURLToPath(import.meta.url));
const RAW = join(here, '..', '..', 'data', 'raw');

const readCsv = async (name) => parse(await readFile(join(RAW, name), 'utf8'), {
  columns: true, skip_empty_lines: true, trim: false,
});

const stats = {
  properties: { in: 0, loaded: 0 },
  rooms: { in: 0, loaded: 0, quarantined: 0 },
  guests: { in: 0, loaded: 0, merged: 0, quarantined: 0 },
  bookings: { in: 0, loaded: 0, quarantined: 0, warnings: 0 },
  reviews: { in: 0, loaded: 0, quarantined: 0 },
  issues: [],
  byCode: {},
  roomTypeMapping: {},
  currency: { INR: 0, USD: 0, rejected: 0 },
  fxRate: config.fx.usdInr,
};

function recordIssue(batch, entity, file, rowNumber, code, detail, rawRow, severity = 'error') {
  stats.issues.push({ entity, file, rowNumber, code, detail, rawRow, severity });
  stats.byCode[code] = (stats.byCode[code] || 0) + 1;
  if (severity === 'error') {
    if (entity === 'booking') stats.bookings.quarantined += 1;
    if (entity === 'room') stats.rooms.quarantined += 1;
    if (entity === 'guest') stats.guests.quarantined += 1;
    if (entity === 'review') stats.reviews.quarantined += 1;
  } else if (entity === 'booking') {
    stats.bookings.warnings += 1;
  }
  return { batch, entity, file, rowNumber, code, detail, rawRow, severity };
}

export async function runEtl() {
  logger.info({ fxRate: stats.fxRate }, 'ETL starting');

  const batchRes = await query(
    `INSERT INTO etl_batches (source_file, started_at) VALUES ($1, now()) RETURNING id`,
    ['data/raw/*.csv'],
  );
  const batchId = batchRes.rows[0].id;

  // ---------------------------------------------------------------- properties
  const properties = await readCsv('properties.csv');
  stats.properties.in = properties.length;
  const propertyByCode = new Map();
  for (const p of properties) {
    const code = cleanText(p.property_code).toUpperCase();
    const { rows } = await query(
      `INSERT INTO properties (code, name, city, star_rating, total_rooms)
       VALUES ($1,$2,'Mumbai',$3,0)
       ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, star_rating = EXCLUDED.star_rating,
         updated_at = now()
       RETURNING *`,
      [code, cleanText(p.property_name), Number(p.star_rating) || null],
    );
    propertyByCode.set(code, rows[0]);
    stats.properties.loaded += 1;
  }

  // ---------------------------------------------------------------- room types
  const roomTypeByCode = new Map();
  for (const rt of CANONICAL_ROOM_TYPES) {
    const { rows } = await query(
      `INSERT INTO room_types (code, name, description, max_occupancy, bed_type, base_rate_inr)
       VALUES ($1,$2,$3,$4,$5,$6)
       ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description,
         max_occupancy = EXCLUDED.max_occupancy, bed_type = EXCLUDED.bed_type,
         base_rate_inr = EXCLUDED.base_rate_inr
       RETURNING *`,
      [rt.code, rt.name, rt.description, rt.maxOccupancy, rt.bedType, rt.baseRateInr],
    );
    roomTypeByCode.set(rt.code, rows[0]);
  }

  // ---------------------------------------------------------------- rooms
  const inventory = await readCsv('room_inventory.csv');
  stats.rooms.in = inventory.length;
  await query('DELETE FROM rooms');
  const roomByPropertyNumber = new Map();
  for (let i = 0; i < inventory.length; i += 1) {
    const row = inventory[i];
    const propertyCode = cleanText(row.property_code).toUpperCase();
    const property = propertyByCode.get(propertyCode);
    if (!property) {
      recordIssue(batchId, 'room', 'room_inventory.csv', i + 2, 'UNKNOWN_PROPERTY',
        `Property "${row.property_code}" is not in the group`, row);
      continue;
    }
    const mapped = mapRoomType(row.room_type_raw, propertyCode);
    stats.roomTypeMapping[mapped.matchedBy || 'unmapped'] = (stats.roomTypeMapping[mapped.matchedBy || 'unmapped'] || 0) + 1;
    if (!mapped.canonical) {
      recordIssue(batchId, 'room', 'room_inventory.csv', i + 2, 'UNKNOWN_ROOM_TYPE', mapped.reason, row);
      continue;
    }
    const { rows } = await query(
      `INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
       VALUES ($1,$2,$3,$4,TRUE)
       ON CONFLICT (property_id, room_number) DO UPDATE SET room_type_id = EXCLUDED.room_type_id,
         floor = EXCLUDED.floor
       RETURNING *`,
      [property.id, roomTypeByCode.get(mapped.canonical).id, cleanText(row.room_number),
        Number.parseInt(row.floor, 10) || null],
    );
    roomByPropertyNumber.set(`${propertyCode}|${cleanText(row.room_number)}`, rows[0]);
    stats.rooms.loaded += 1;
  }

  // Keep the denormalised room count honest after the reload.
  await query(
    `UPDATE properties p SET total_rooms = COALESCE((SELECT count(*) FROM rooms r
       WHERE r.property_id = p.id AND r.is_active), 0)`,
  );

  // ---------------------------------------------------------------- guests
  const guestRows = await readCsv('guests.csv');
  stats.guests.in = guestRows.length;
  const guestByEmail = new Map();
  for (let i = 0; i < guestRows.length; i += 1) {
    const row = guestRows[i];
    const email = normaliseEmail(row.email);
    const name = normaliseName(row.full_name);
    if (!name) {
      recordIssue(batchId, 'guest', 'guests.csv', i + 2, 'MISSING_NAME', 'Guest has no name', row);
      continue;
    }
    if (!email) {
      // A guest with no usable email is still a real guest, so it is loaded but
      // flagged — it simply cannot be de-duplicated or matched to a booking.
      const { rows } = await query(
        `INSERT INTO guests (full_name, email, phone, country) VALUES ($1,NULL,$2,$3) RETURNING *`,
        [name, cleanText(row.phone) || null, cleanText(row.country) || null],
      );
      recordIssue(batchId, 'guest', 'guests.csv', i + 2, 'MISSING_EMAIL',
        'No usable email; guest loaded but cannot be matched', row, 'warning');
      continue;
    }
    if (guestByEmail.has(email)) {
      // Same email twice with different casing is the same person.
      stats.guests.merged += 1;
      continue;
    }
    const { rows } = await query(
      `INSERT INTO guests (full_name, email, phone, country) VALUES ($1,$2,$3,$4)
       ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO UPDATE
         SET full_name = guests.full_name
       RETURNING *`,
      [name, email, cleanText(row.phone) || null, cleanText(row.country) || null],
    );
    guestByEmail.set(email, rows[0]);
    stats.guests.loaded += 1;
  }

  // ---------------------------------------------------------------- bookings
  const bookingRows = await readCsv('bookings_2026.csv');
  stats.bookings.in = bookingRows.length;
  await query('DELETE FROM bookings');

  const ctx = { propertyByCode, guestByEmail, usdInrRate: stats.fxRate };
  let loaded = 0;
  for (let i = 0; i < bookingRows.length; i += 1) {
    const row = bookingRows[i];
    const res = validateBookingRow(row, ctx);
    if (!res.ok) {
      for (const issue of res.issues) {
        recordIssue(batchId, 'booking', 'bookings_2026.csv', i + 2, issue.code, issue.detail, row);
      }
      continue;
    }
    const v = res.value;
    const property = propertyByCode.get(v.propertyCode);
    const guest = guestByEmail.get(v.guestEmail);
    const room = v.roomNumber ? roomByPropertyNumber.get(`${v.propertyCode}|${v.roomNumber}`) : null;

    if (!room) {
      // The stay is valid; only the room reference is stale. Keep the booking and
      // record a warning rather than losing real revenue over a missing room id.
      recordIssue(batchId, 'booking', 'bookings_2026.csv', i + 2, 'UNMATCHED_ROOM',
        `Room "${v.roomNumber}" not found at ${v.propertyCode}; booking kept without a room link`,
        row, 'warning');
    }

    await query(
      `INSERT INTO bookings
        (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children,
         rate_inr, amount_original, currency_original, fx_rate, source, status)
       VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15)
       ON CONFLICT (reference) DO NOTHING`,
      [v.reference, property.id, room?.id ?? null, guest.id, v.checkIn, v.checkOut, v.roomsBooked,
        v.adults, v.children, v.rateInr, v.amountOriginal, v.currencyOriginal, v.fxRate, v.source, v.status],
    );
    loaded += 1;
    stats.currency[v.currencyOriginal] += 1;
  }
  stats.bookings.loaded = loaded;

  // ---------------------------------------------------------------- reviews
  const reviewRows = await readCsv('reviews.csv');
  stats.reviews.in = reviewRows.length;
  await query('DELETE FROM reviews');
  for (let i = 0; i < reviewRows.length; i += 1) {
    const row = reviewRows[i];
    const propertyCode = cleanText(row.property_code).toUpperCase();
    const property = propertyByCode.get(propertyCode);
    const rating = Number.parseInt(row.rating, 10);
    const email = normaliseEmail(row.guest_email);
    if (!property) {
      recordIssue(batchId, 'review', 'reviews.csv', i + 2, 'UNKNOWN_PROPERTY',
        `Property "${row.property_code}" is not in the group`, row);
      continue;
    }
    if (!Number.isFinite(rating) || rating < 1 || rating > 5) {
      recordIssue(batchId, 'review', 'reviews.csv', i + 2, 'INVALID_RATING', `Rating "${row.rating}"`, row);
      continue;
    }
    const guest = email ? guestByEmail.get(email) : null;
    await query(
      `INSERT INTO reviews (property_id, guest_id, rating, title, body) VALUES ($1,$2,$3,$4,$5)`,
      [property.id, guest?.id ?? null, rating, cleanText(row.title) || null, cleanText(row.body) || null],
    );
    stats.reviews.loaded += 1;
  }

  // ---------------------------------------------------------------- persist issues
  await withTransaction(async (client) => {
    for (const it of stats.issues) {
      await client.query(
        `INSERT INTO etl_issues (batch_id, source_file, row_number, entity, severity, issue_code, detail, raw_row)
         VALUES ($1,$2,$3,$4,$5,$6,$7,$8)`,
        [batchId, it.file, it.rowNumber, it.entity, it.severity, it.code, it.detail, JSON.stringify(it.rawRow)],
      );
    }
    await client.query(
      `UPDATE etl_batches SET rows_in = $1, rows_loaded = $2, rows_quarantined = $3, finished_at = now()
       WHERE id = $4`,
      [stats.bookings.in, stats.bookings.loaded, stats.bookings.quarantined, batchId],
    );
  });

  return { batchId, stats };
}

/** Human-readable data-quality report — the same numbers the docs quote. */
export function formatReport({ batchId, stats: s }) {
  const lines = [];
  const totalIn = s.bookings.in;
  const cleanPct = totalIn ? ((s.bookings.loaded / totalIn) * 100).toFixed(1) : '0.0';
  lines.push('');
  lines.push('='.repeat(72));
  lines.push('  DATA QUALITY REPORT');
  lines.push('='.repeat(72));
  lines.push(`  batch                ${batchId}`);
  lines.push(`  FX rate applied      USD 1 = INR ${s.fxRate}`);
  lines.push('');
  lines.push('  ENTITY        READ    LOADED   QUARANTINED   WARNINGS');
  lines.push('  ' + '-'.repeat(62));
  const row = (n, o) => lines.push(
    `  ${n.padEnd(12)}  ${String(o.in).padStart(5)}  ${String(o.loaded).padStart(7)}  ` +
    `${String(o.quarantined ?? 0).padStart(11)}  ${String(o.warnings ?? o.merged ?? 0).padStart(9)}`,
  );
  row('properties', s.properties);
  row('rooms', s.rooms);
  row('guests', { ...s.guests, warnings: s.guests.merged });
  row('bookings', s.bookings);
  row('reviews', s.reviews);
  lines.push('');
  lines.push(`  Bookings loaded cleanly: ${s.bookings.loaded}/${totalIn} (${cleanPct}%)`);
  lines.push(`  Currency mix on loaded rows: INR ${s.currency.INR}, USD ${s.currency.USD}`);
  lines.push(`  Room-type mappings by source: ${JSON.stringify(s.roomTypeMapping)}`);
  lines.push('');
  lines.push('  ISSUES BY CODE');
  lines.push('  ' + '-'.repeat(62));
  const entries = Object.entries(s.byCode).sort((a, b) => b[1] - a[1]);
  if (!entries.length) lines.push('  (none)');
  for (const [code, n] of entries) lines.push(`  ${code.padEnd(30)} ${String(n).padStart(5)}`);
  lines.push('='.repeat(72));
  lines.push('');
  return lines.join('\n');
}

if (import.meta.url === `file://${process.argv[1]}`) {
  runEtl()
    .then((r) => {
      // eslint-disable-next-line no-console
      console.log(formatReport(r));
      return pool.end();
    })
    .then(() => process.exit(0))
    .catch((err) => { logger.error({ err }, 'ETL failed'); process.exit(1); });
}
