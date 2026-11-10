/**
 * The canonical room taxonomy, and the alias table that maps what the 14
 * properties actually call their rooms onto it.
 *
 * This is the piece that cannot be automated away. A fuzzy string match would
 * happily merge "Superior" with "Superior Deluxe" and split "Deluxe Twin" from
 * "Deluxe", and the resulting ADR would be wrong in a way nobody notices until a
 * revenue report is questioned. So the mapping is explicit, reviewed, and
 * property-aware.
 */

export const CANONICAL_ROOM_TYPES = [
  { code: 'standard', name: 'Standard Room', maxOccupancy: 2, bedType: 'Queen', baseRateInr: 4200,
    description: 'Compact room with a queen bed, city view, and workspace.' },
  { code: 'deluxe', name: 'Deluxe Room', maxOccupancy: 3, bedType: 'King', baseRateInr: 6800,
    description: 'Larger room with a king bed, seating area and either a city or courtyard view.' },
  { code: 'premier', name: 'Premier Room', maxOccupancy: 3, bedType: 'King', baseRateInr: 9500,
    description: 'Upper-floor room with a sea or skyline view, lounge access and evening canapes.' },
  { code: 'suite', name: 'Suite', maxOccupancy: 4, bedType: 'King + Sofa bed', baseRateInr: 16000,
    description: 'Separate living room, dining nook and a private balcony.' },
  { code: 'family', name: 'Family Room', maxOccupancy: 5, bedType: 'King + 2 Twin', baseRateInr: 7800,
    description: 'Two connected sleeping areas, designed for families travelling with children.' },
];

/**
 * Global alias table. Keys are lower-cased and whitespace-collapsed.
 * Anything not listed here is NOT guessed at — it is quarantined with
 * UNKNOWN_ROOM_TYPE so a human decides, which is the only safe default.
 */
const GLOBAL_ALIASES = {
  standard: ['standard', 'std', 'standard room', 'economy', 'economy room', 'classic', 'classic room',
    'base category', 'base', 'superior single'],
  deluxe: ['deluxe', 'deluxe room', 'deluxe king', 'deluxe twin', 'deluxe queen', 'superior',
    'superior room', 'executive', 'executive room', 'premium', 'premium room'],
  premier: ['premier', 'premier room', 'premium deluxe', 'club', 'club room', 'signature',
    'signature room', 'grand deluxe'],
  suite: ['suite', 'junior suite', 'executive suite', 'luxury suite', 'sea view suite',
    'premium suite', 'presidential suite'],
  family: ['family', 'family room', 'triple', 'triple room', 'quad', 'quad room', 'family suite',
    'twin family'],
};

/**
 * Property-scoped overrides. "Superior" is a deluxe category at most properties
 * but the premier category at Malabar Hill, whose own rate card says so. Without
 * this table that property's ADR is understated by roughly 30%.
 */
const PROPERTY_OVERRIDES = {
  'MUM-MAL': { superior: 'premier', 'executive room': 'premier' },
  'MUM-JUH': { 'executive room': 'premier', 'premium': 'premier' },
  'MUM-WOR': { premium: 'premier' },
};

const normaliseKey = (raw) => String(raw ?? '').trim().toLowerCase().replace(/\s+/g, ' ');

const GLOBAL_LOOKUP = new Map();
for (const [canonical, aliases] of Object.entries(GLOBAL_ALIASES)) {
  for (const a of aliases) GLOBAL_LOOKUP.set(a, canonical);
}

/**
 * @returns {{ canonical: string|null, reason?: string, matchedBy: 'override'|'alias'|'canonical-code'|null }}
 */
export function mapRoomType(rawAlias, propertyCode) {
  const key = normaliseKey(rawAlias);
  if (!key) return { canonical: null, reason: 'Empty room type', matchedBy: null };

  const override = PROPERTY_OVERRIDES[propertyCode]?.[key];
  if (override) return { canonical: override, matchedBy: 'override' };

  // A value that exactly equals a canonical code is unambiguous, so it is
  // resolved before the alias table (where several codes are also aliases).
  if (CANONICAL_ROOM_TYPES.some((t) => t.code === key)) {
    return { canonical: key, matchedBy: 'canonical-code' };
  }

  const hit = GLOBAL_LOOKUP.get(key);
  if (hit) return { canonical: hit, matchedBy: 'alias' };
  return { canonical: null, reason: `Unrecognised room type "${rawAlias}"`, matchedBy: null };
}

export function listAliasesFor(canonical) {
  return GLOBAL_ALIASES[canonical] || [];
}

export { GLOBAL_ALIASES, PROPERTY_OVERRIDES, normaliseKey };
