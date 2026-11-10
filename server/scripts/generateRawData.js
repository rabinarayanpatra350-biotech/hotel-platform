#!/usr/bin/env node
/**
 * generateRawData.js — produces the raw exports that the 14 properties hand over.
 *
 * These files are deliberately messy in exactly the three ways the brief names,
 * plus a few a real export always contains. The mess is deterministic (seeded),
 * so the ETL tests can assert on precise counts rather than "some rows failed".
 *
 *   1. room types renamed across properties   -> "Deluxe", "DELUXE KING", "Superior", ...
 *   2. rates in INR and USD                   -> mixed within a single property
 *   3. check-out before check-in              -> invalid stays that must be quarantined
 *   plus: DD/MM/YYYY vs ISO dates, duplicate guests, blank emails, negative
 *   rates, currency written as "Rs" / "$" / "INR" / "usd".
 *
 * Run: node scripts/generateRawData.js
 */
import { mkdirSync, writeFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';

const here = dirname(fileURLToPath(import.meta.url));
const OUT = join(here, '..', 'data', 'raw');
mkdirSync(OUT, { recursive: true });

// ------------------------------------------------------------------ seeded RNG
let seed = 20260926;
const rnd = () => {
  seed = (seed * 1664525 + 1013904223) % 4294967296;
  return seed / 4294967296;
};
const pick = (arr) => arr[Math.floor(rnd() * arr.length)];
const int = (a, b) => a + Math.floor(rnd() * (b - a + 1));

// ------------------------------------------------------------------ properties
const PROPERTIES = [
  ['MUM-CSB', 'Colaba Sea Breeze', 'Colaba', 4, 42],
  ['MUM-BAY', 'Bandra Bay House', 'Bandra West', 4, 36],
  ['MUM-JUH', 'Juhu Sands', 'Juhu', 5, 58],
  ['MUM-POW', 'Powai Lakeview', 'Powai', 4, 64],
  ['MUM-WOR', 'Worli Seaface', 'Worli', 5, 48],
  ['MUM-AND', 'Andheri Grand', 'Andheri East', 3, 72],
  ['MUM-BOR', 'Borivali Greens', 'Borivali', 3, 40],
  ['MUM-DAD', 'Dadar Central', 'Dadar', 3, 34],
  ['MUM-MAL', 'Malabar Hill Residency', 'Malabar Hill', 5, 28],
  ['MUM-LOW', 'Lower Parel Loft', 'Lower Parel', 4, 44],
  ['MUM-GOR', 'Goregaon Park', 'Goregaon', 3, 56],
  ['MUM-CHE', 'Chembur Orchid', 'Chembur', 3, 38],
  ['MUM-VER', 'Versova Beach House', 'Versova', 4, 32],
  ['MUM-MUL', 'Mulund Comfort', 'Mulund', 2, 46],
];

writeFileSync(join(OUT, 'properties.csv'), [
  'property_code,property_name,locality,star_rating,total_rooms',
  ...PROPERTIES.map((p) => p.join(',')),
].join('\n') + '\n');

// ------------------------------------------------------------------ room inventory
// Each property names its rooms its own way. The same physical category can
// appear under several aliases, and a couple of aliases mean different things at
// different properties — which is why the mapping is property-aware.
const ALIASES = {
  standard: ['Standard', 'STD', 'standard room', 'Economy', 'Classic Room', 'Base Category'],
  deluxe: ['Deluxe', 'DELUXE KING', 'Deluxe Room', 'Deluxe Twin', 'Superior', 'Executive Room', 'Premium'],
  premier: ['Premier', 'Premier Room', 'Premium Deluxe', 'Club Room', 'Signature'],
  suite: ['Suite', 'SUITE', 'Junior Suite', 'Executive Suite', 'Luxury Suite', 'Sea View Suite'],
  family: ['Family', 'Family Room', 'Triple', 'Quad Room', 'Family Suite'],
};
// Property-scoped overrides where the alias genuinely means something else.
const OVERRIDES = [
  { property: 'MUM-MAL', alias: 'Superior', canonical: 'premier' },
  { property: 'MUM-JUH', alias: 'Executive Room', canonical: 'premier' },
  { property: 'MUM-WOR', alias: 'Premium', canonical: 'premier' },
];

const invRows = ['property_code,room_number,room_type_raw,floor,nightly_rate,currency'];
const roomsByProperty = new Map(); // real inventory, so bookings mostly reference real rooms
let roomSeq = 0;
// Room numbers must be unique WITHIN a property: the schema has
// UNIQUE (property_id, room_number), and a global counter could emit the same
// number twice inside one property, silently losing rooms on load.
for (const [code, , , , totalRooms] of PROPERTIES) {
  const perType = Math.max(2, Math.round(totalRooms / 5));
  let idxInProperty = 0;
  for (const [canonical, aliases] of Object.entries(ALIASES)) {
    const alias = pick(aliases);
    const override = OVERRIDES.find((o) => o.property === code && o.alias === alias);
    const effective = override ? override.canonical : canonical;
    const base = { standard: 4200, deluxe: 6800, premier: 9500, suite: 16000, family: 7800 }[effective];
    // Roughly one property in three quotes in USD, and one mixes the two.
    const useUsd = code === 'MUM-JUH' || code === 'MUM-WOR' || (rnd() < 0.2);
    for (let i = 0; i < perType; i += 1) {
      roomSeq += 1;
      const jitter = 1 + (rnd() - 0.5) * 0.18;
      const rateInr = Math.round((base * jitter) / 100) * 100;
      // A mixed-currency property flips currency per row, not per property.
      const rowUsd = code === 'MUM-WOR' ? (i % 2 === 0) : useUsd;
      const rate = rowUsd ? Math.round((rateInr / 84.5) / 5) * 5 : rateInr;
      const currency = rowUsd ? pick(['USD', 'usd', '$']) : pick(['INR', 'INR', 'Rs']);
      idxInProperty += 1;
      const roomNumber = `${100 + Math.floor(idxInProperty / 100)}${String(idxInProperty % 100).padStart(2, '0')}`;
      if (!roomsByProperty.has(code)) roomsByProperty.set(code, []);
      roomsByProperty.get(code).push({ roomNumber, canonical: effective });
      invRows.push([code, roomNumber, alias, int(1, 12), rate, currency].join(','));
    }
  }
}
writeFileSync(join(OUT, 'room_inventory.csv'), invRows.join('\n') + '\n');

// ------------------------------------------------------------------ guests
const FIRST = ['Aarav', 'Isha', 'Rohan', 'Meera', 'Kabir', 'Ananya', 'Vikram', 'Priya', 'Arjun', 'Nisha',
  'Rahul', 'Sneha', 'Aditya', 'Kavya', 'Sanjay', 'Divya', 'Nikhil', 'Pooja', 'Karan', 'Tara',
  'James', 'Sarah', 'Daniel', 'Emma', 'Lucas', 'Olivia', 'Hiroshi', 'Yuki', 'Wei', 'Fatima'];
const LAST = ['Sharma', 'Patel', 'Iyer', 'Nair', 'Khan', 'Reddy', 'Mehta', 'Gupta', 'Desai', 'Joshi',
  'Rao', 'Verma', 'Singh', 'Kapoor', 'Bose', 'Menon', 'Smith', 'Johnson', 'Brown', 'Tanaka', 'Chen'];
const COUNTRIES = ['India', 'India', 'India', 'United Kingdom', 'United States', 'Singapore', 'Japan', 'UAE'];

const guests = [];
for (let i = 0; i < 260; i += 1) {
  const fn = pick(FIRST); const ln = pick(LAST);
  const email = rnd() < 0.12 ? '' : `${fn.toLowerCase()}.${ln.toLowerCase()}${int(1, 99)}@example.com`;
  guests.push({
    full_name: rnd() < 0.05 ? `  ${fn} ${ln}  ` : `${fn} ${ln}`,
    email,
    phone: rnd() < 0.15 ? '' : `+91 ${int(70, 99)}${int(100, 999)} ${int(10000, 99999)}`,
    country: pick(COUNTRIES),
  });
}
// Deliberate duplicates: the same person exported twice with different casing.
for (let i = 0; i < 18; i += 1) {
  const g = guests[i];
  if (!g.email) continue;
  guests.push({ ...g, full_name: g.full_name.toUpperCase(), email: g.email.toUpperCase() });
}
writeFileSync(join(OUT, 'guests.csv'),
  ['full_name,email,phone,country', ...guests.map((g) => `${g.full_name},${g.email},${g.phone},${g.country}`)].join('\n') + '\n');

// ------------------------------------------------------------------ bookings
const iso = (d) => d.toISOString().slice(0, 10);
const dmy = (d) => `${String(d.getUTCDate()).padStart(2, '0')}/${String(d.getUTCMonth() + 1).padStart(2, '0')}/${d.getUTCFullYear()}`;
const addDays = (d, n) => new Date(d.getTime() + n * 86400000);

const START = new Date('2026-01-01T00:00:00Z');
const bookingRows = ['booking_ref,property_code,room_number,guest_email,check_in,check_out,rooms_booked,adults,children,amount,currency,source,status'];
const SOURCES = ['direct', 'website', 'ota', 'phone', 'walk_in'];
const STATUSES = ['confirmed', 'confirmed', 'confirmed', 'checked_out', 'checked_out', 'cancelled', 'pending'];

const withEmail = guests.filter((g) => g.email);
let badDates = 0; let badRates = 0; let usdRows = 0;

for (let i = 0; i < 640; i += 1) {
  const [code] = pick(PROPERTIES);
  const guest = pick(withEmail);
  const start = addDays(START, int(0, 300));
  const nights = int(1, 6);
  let end = addDays(start, nights);
  let checkIn = start; let checkOut = end;

  // ~4% of rows have the dates the wrong way round, as real exports do.
  if (rnd() < 0.04) { [checkIn, checkOut] = [end, start]; badDates += 1; }

  const useUsd = rnd() < 0.18;
  let amount = useUsd ? Math.round((int(4000, 30000) / 84.5) / 5) * 5 : int(4000, 30000);
  if (rnd() < 0.02) { amount = -Math.abs(amount); badRates += 1; } // refund entered as a booking
  if (useUsd) usdRows += 1;

  const dateFmt = rnd() < 0.3 ? dmy : iso;
  const currency = useUsd ? pick(['USD', 'usd', '$']) : pick(['INR', 'INR', 'Rs']);

  bookingRows.push([
    `RAW-${String(i + 1).padStart(5, '0')}`, code,
    rnd() < 0.03
      ? `999${String(int(1, 99)).padStart(2, '0')}`            // stale: room no longer in inventory
      : pick(roomsByProperty.get(code)).roomNumber,
    rnd() < 0.03 ? guest.email.toUpperCase() : guest.email,
    dateFmt(checkIn), dateFmt(checkOut), int(1, 3), int(1, 4), rnd() < 0.25 ? int(1, 2) : 0,
    amount, currency, pick(SOURCES), pick(STATUSES),
  ].join(','));
}
writeFileSync(join(OUT, 'bookings_2026.csv'), bookingRows.join('\n') + '\n');

// ------------------------------------------------------------------ reviews
const TITLES = ['Lovely stay', 'Great location', 'Would come back', 'Mixed feelings', 'Excellent service',
  'Noisy at night', 'Perfect for a short trip', 'Good value', 'Not as described', 'Superb breakfast'];
const BODIES = [
  'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.',
  'Great location, easy walk to the sea face. The air conditioning was a little loud at night.',
  'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.',
  'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.',
  'Check-in took twenty minutes longer than it should have, but the room itself was excellent.',
  'Good value for Mumbai. The rooftop is worth the visit on its own.',
  'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.',
  'Not quite what the photos suggested, though the bed was extremely comfortable.',
];
const reviewRows = ['property_code,guest_email,rating,title,body'];
for (let i = 0; i < 300; i += 1) {
  const [code] = pick(PROPERTIES);
  const guest = pick(withEmail);
  reviewRows.push([code, guest.email, int(1, 5), `"${pick(TITLES)}"`, `"${pick(BODIES)}"`].join(','));
}
writeFileSync(join(OUT, 'reviews.csv'), reviewRows.join('\n') + '\n');

console.log('raw exports written to', OUT);
console.log(`  properties      ${PROPERTIES.length}`);
console.log(`  room inventory  ${invRows.length - 1}`);
console.log(`  guests          ${guests.length} (incl. 18 deliberate duplicates)`);
console.log(`  bookings        ${bookingRows.length - 1}  (${badDates} with reversed dates, ${badRates} with negative rates, ${usdRows} in USD)`);
console.log(`  reviews         ${reviewRows.length - 1}`);
