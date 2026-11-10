# Data quality and the normalisation pipeline

The 14 properties hand over their records as CSV exports. Those exports disagree with each other in three
ways the brief names, plus several a real export always contains. This document records what the pipeline does
about each one, and why it does it that way.

Run it with:

```bash
cd server && npm run seed      # or: npm run etl
```

It prints a report and writes a batch to `etl_batches` with every rejected row in `etl_issues`.

## Results on the shipped exports

```
ENTITY        READ    LOADED   QUARANTINED   WARNINGS
properties       14        14             0          0
rooms           640       640             0          0
guests          275       225             0         17
bookings        640       600            41         12
reviews         300       300             0          0

Bookings loaded cleanly: 600/640 (93.8%)
Currency mix on loaded rows: INR 487, USD 113
```

| Issue code | Severity | Count | Meaning |
|---|---|---|---|
| `CHECKOUT_NOT_AFTER_CHECKIN` | error | 27 | Stay ends on or before it begins |
| `NEGATIVE_RATE` | error | 14 | Amount resolves below zero |
| `MISSING_EMAIL` | warning | 33 | Guest loaded, but cannot be matched to a booking |
| `UNMATCHED_ROOM` | warning | 12 | Room number not in the inventory; booking kept without a room link |
| `MISSING_NAME` | error | 0 | Would reject a nameless guest |
| `UNKNOWN_ROOM_TYPE` | error | 0 | Would reject an alias the map does not cover |
| `UNKNOWN_CURRENCY` | error | 0 | Would reject a currency the map does not know |

`guests` shows 225 loaded against 275 read because 18 records are the same people exported twice with
different casing, and a further 32 have no usable email and are loaded but never merged.

## The three named messes

### 1. Room types renamed across properties

Aliases present in the exports include `Deluxe`, `DELUXE KING`, `Deluxe Twin`, `Superior`, `Executive Room`,
`Premium`, `STD`, `Classic Room`, `Junior Suite`, `Quad Room` and `Base Category`, across five physical
categories.

**Why not fuzzy matching.** A similarity score merges `Superior` with `Superior Deluxe` and splits `Deluxe
Twin` from `Deluxe`. Both errors are invisible: the room count stays plausible and only the ADR is wrong,
which nobody notices until a revenue report is questioned.

**What is done instead.** An explicit alias table (`server/src/etl/roomTypeMap.js`) plus **property-scoped
overrides** for the cases where an alias genuinely means something else at one property:

| Alias | Usually | At this property | Consequence if missed |
|---|---|---|---|
| `Superior` | deluxe | **premier** at MUM-MAL | That property's ADR understated ~30% |
| `Executive Room` | deluxe | **premier** at MUM-JUH | |
| `Premium` | deluxe | **premier** at MUM-WOR | |

Anything the map does not recognise is **quarantined, not guessed** — a human decides, which is the only safe
default when the alternative is silently mispricing a property.

### 2. Rates in INR and USD, sometimes mixed within one property

Currency appears as `INR`, `Rs`, `₹`, `USD`, `usd` and `$`. One property alternates currency per row rather
than per property, so normalising at the property level would still be wrong.

**What is stored.** Every booking keeps all four values:

| Column | Meaning |
|---|---|
| `rate_inr` | The canonical value: everything the API aggregates uses this |
| `amount_original` | Exactly what the property quoted |
| `currency_original` | ISO 4217, resolved from the alias |
| `fx_rate` | The precise rate applied |

**Why keep the rate.** A converted figure without its rate is unauditable — six months later nobody can say
whether 8,450 INR was 100 USD at 84.5 or 98 USD at 86.2. Storing the rate makes every number re-derivable.

**Unknown currencies are rejected**, not assumed to be INR. Silently treating a USD row as INR would understate
it by a factor of 84.

### 3. Check-out before check-in

27 of 640 rows have the dates reversed, and a handful are equal. Loading them would create negative-length
stays; those propagate into occupancy as negative room-nights and corrupt the total — **silently**, because
the aggregate still looks like a number.

**What is done.** Rejected with `CHECKOUT_NOT_AFTER_CHECKIN`. A database `CHECK (check_out > check_in)`
constraint sits underneath as a backstop, so even a future code path that bypasses the ETL cannot insert one.

## Also handled

- **Two date formats.** ISO (`2026-03-04`) and Indian (`04/03/2026`) both appear. The parser tries ISO first,
  then **day-first**, because `03/04/2026` is 3 April here. Reading it month-first would shift a third of the
  bookings by a month — a bug that produces a perfectly plausible-looking dataset.
- **Impossible dates** such as `31/02/2026` are rejected rather than rolled forward into March.
- **Duplicate guests.** Identity is the email when one exists, so `Aarav@Example.COM` and `aarav@example.com`
  are one person. Guests without an email are loaded but **never merged**, because merging on name alone would
  combine different people who happen to share one.
- **Whitespace and casing** are collapsed and normalised in names and emails.
- **Refunds entered as bookings** (negative amounts) are quarantined rather than netted off, because a refund is
  an accounting event on a booking, not a booking with a negative price.

## Why quarantine rather than delete

Every rejected row is written to `etl_issues` with its source file, row number, reason code, a human-readable
detail and the **original row as JSON**. Nothing is lost, so:

- a decision can be reviewed by someone who was not there when it was made;
- a mapping fix can be verified against the rows it would now accept;
- the report can state precisely how much data was set aside and why, instead of quietly dropping it.

The pipeline is idempotent: correcting the alias map and re-running replaces the loaded rows and appends a new
batch, so a mapping mistake is a two-minute fix rather than a data-loss event.
