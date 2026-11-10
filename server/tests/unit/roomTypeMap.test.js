import { describe, it, expect } from 'vitest';
import { mapRoomType, CANONICAL_ROOM_TYPES, normaliseKey } from '../../src/etl/roomTypeMap.js';

describe('mapRoomType', () => {
  it('maps the aliases the 14 properties actually use', () => {
    expect(mapRoomType('Deluxe', 'MUM-CSB').canonical).toBe('deluxe');
    expect(mapRoomType('DELUXE KING', 'MUM-CSB').canonical).toBe('deluxe');
    expect(mapRoomType('Deluxe Twin', 'MUM-BAY').canonical).toBe('deluxe');
    expect(mapRoomType('STD', 'MUM-AND').canonical).toBe('standard');
    expect(mapRoomType('Classic Room', 'MUM-DAD').canonical).toBe('standard');
    expect(mapRoomType('Junior Suite', 'MUM-JUH').canonical).toBe('suite');
    expect(mapRoomType('Quad Room', 'MUM-GOR').canonical).toBe('family');
  });

  it('is case- and whitespace-insensitive', () => {
    expect(mapRoomType('  deluxe   KING ', 'MUM-CSB').canonical).toBe('deluxe');
  });

  it('applies property-scoped overrides where an alias means something else', () => {
    // "Superior" is a deluxe category generally, but the premier category at
    // Malabar Hill. Getting this wrong understates that property's ADR by ~30%.
    expect(mapRoomType('Superior', 'MUM-CSB').canonical).toBe('deluxe');
    expect(mapRoomType('Superior', 'MUM-MAL').canonical).toBe('premier');
    expect(mapRoomType('Superior', 'MUM-MAL').matchedBy).toBe('override');
    expect(mapRoomType('Premium', 'MUM-WOR').canonical).toBe('premier');
    expect(mapRoomType('Executive Room', 'MUM-JUH').canonical).toBe('premier');
  });

  it('accepts an already-canonical code', () => {
    expect(mapRoomType('deluxe', 'MUM-CSB').matchedBy).toBe('canonical-code');
  });

  it('refuses to guess at an unrecognised alias', () => {
    const r = mapRoomType('Rooftop Cabana', 'MUM-CSB');
    expect(r.canonical).toBeNull();
    expect(r.reason).toContain('Unrecognised');
  });

  it('rejects an empty alias', () => {
    expect(mapRoomType('', 'MUM-CSB').canonical).toBeNull();
  });

  it('maps every alias of every canonical type back to that type', () => {
    // Guards against a typo in the alias table silently orphaning a category.
    for (const t of CANONICAL_ROOM_TYPES) {
      expect(mapRoomType(t.code, 'MUM-CSB').canonical).toBe(t.code);
    }
  });

  it('normalises keys consistently', () => {
    expect(normaliseKey('  Deluxe   KING ')).toBe('deluxe king');
  });
});
