-- ============================================================================
-- Mumbai Boutique Hotels — canonical schema (PostgreSQL 14+)
-- Applied by src/db/migrate.js. Every statement is idempotent so the migration
-- can be re-run safely.
--
-- Money policy: every monetary column that the application reads or aggregates
-- is stored in INR in `*_inr`. The original amount, its currency and the exact
-- FX rate used are kept alongside it, so a rate can always be audited rather
-- than silently assumed. See docs/data-quality.md.
-- ============================================================================

CREATE TABLE IF NOT EXISTS schema_migrations (
  version     TEXT PRIMARY KEY,
  applied_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- ---------------------------------------------------------------- auth
CREATE TABLE IF NOT EXISTS users (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email         TEXT NOT NULL,
  password_hash TEXT NOT NULL,
  full_name     TEXT NOT NULL,
  role          TEXT NOT NULL DEFAULT 'guest'
                CHECK (role IN ('guest', 'staff', 'admin')),
  is_active     BOOLEAN NOT NULL DEFAULT TRUE,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE UNIQUE INDEX IF NOT EXISTS users_email_lower_idx ON users (lower(email));

-- Refresh tokens are stored hashed and rotated on every use, so a stolen token
-- is usable at most once and a replayed token revokes the whole family.
CREATE TABLE IF NOT EXISTS refresh_tokens (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id     UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  token_hash  TEXT NOT NULL UNIQUE,
  family_id   UUID NOT NULL,
  expires_at  TIMESTAMPTZ NOT NULL,
  revoked_at  TIMESTAMPTZ,
  replaced_by UUID,
  user_agent  TEXT,
  ip          TEXT,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS refresh_tokens_user_idx ON refresh_tokens (user_id);
CREATE INDEX IF NOT EXISTS refresh_tokens_family_idx ON refresh_tokens (family_id);

-- ---------------------------------------------------------------- inventory
CREATE TABLE IF NOT EXISTS properties (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code         TEXT NOT NULL UNIQUE,
  name         TEXT NOT NULL,
  city         TEXT NOT NULL DEFAULT 'Mumbai',
  address      TEXT,
  description  TEXT,
  star_rating  SMALLINT CHECK (star_rating BETWEEN 1 AND 5),
  total_rooms  INTEGER NOT NULL DEFAULT 0 CHECK (total_rooms >= 0),
  is_active    BOOLEAN NOT NULL DEFAULT TRUE,
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- The canonical room taxonomy. The 14 source properties each named their rooms
-- differently ("Deluxe", "DELUXE KING", "Superior Deluxe", ...); every one of
-- those aliases maps onto exactly one row here. See src/etl/roomTypeMap.js.
CREATE TABLE IF NOT EXISTS room_types (
  id             UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code           TEXT NOT NULL UNIQUE,
  name           TEXT NOT NULL,
  description    TEXT,
  max_occupancy  SMALLINT NOT NULL DEFAULT 2 CHECK (max_occupancy >= 1),
  bed_type       TEXT,
  base_rate_inr  NUMERIC(12, 2) NOT NULL CHECK (base_rate_inr >= 0),
  created_at     TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS rooms (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  property_id   UUID NOT NULL REFERENCES properties(id) ON DELETE CASCADE,
  room_type_id  UUID NOT NULL REFERENCES room_types(id) ON DELETE RESTRICT,
  room_number   TEXT NOT NULL,
  floor         SMALLINT,
  is_active     BOOLEAN NOT NULL DEFAULT TRUE,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (property_id, room_number)
);
CREATE INDEX IF NOT EXISTS rooms_property_idx ON rooms (property_id);

CREATE TABLE IF NOT EXISTS guests (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  full_name   TEXT NOT NULL,
  email       TEXT,
  phone       TEXT,
  country     TEXT,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);
-- A guest is identified by email when we have one; records without an email are
-- kept but never merged automatically, because merging on name alone is unsafe.
CREATE UNIQUE INDEX IF NOT EXISTS guests_email_lower_idx
  ON guests (lower(email)) WHERE email IS NOT NULL;

-- ---------------------------------------------------------------- bookings
CREATE TABLE IF NOT EXISTS bookings (
  id                UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  reference         TEXT NOT NULL UNIQUE,
  property_id       UUID NOT NULL REFERENCES properties(id) ON DELETE RESTRICT,
  room_id           UUID REFERENCES rooms(id) ON DELETE SET NULL,
  guest_id          UUID NOT NULL REFERENCES guests(id) ON DELETE RESTRICT,
  check_in          DATE NOT NULL,
  check_out         DATE NOT NULL,
  rooms_booked      SMALLINT NOT NULL DEFAULT 1 CHECK (rooms_booked >= 1),
  adults            SMALLINT NOT NULL DEFAULT 1 CHECK (adults >= 1),
  children          SMALLINT NOT NULL DEFAULT 0 CHECK (children >= 0),
  -- the canonical, aggregated field
  rate_inr          NUMERIC(12, 2) NOT NULL CHECK (rate_inr >= 0),
  -- the audit trail for that number
  amount_original   NUMERIC(12, 2),
  currency_original CHAR(3),
  fx_rate           NUMERIC(12, 6),
  source            TEXT NOT NULL DEFAULT 'direct',
  status            TEXT NOT NULL DEFAULT 'confirmed'
                    CHECK (status IN ('pending', 'confirmed', 'checked_in', 'checked_out', 'cancelled')),
  created_by        UUID REFERENCES users(id) ON DELETE SET NULL,
  created_at        TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at        TIMESTAMPTZ NOT NULL DEFAULT now(),
  -- enforced in the database as well as the API: a stay cannot end before it starts
  CONSTRAINT bookings_dates_ordered CHECK (check_out > check_in)
);
CREATE INDEX IF NOT EXISTS bookings_property_dates_idx ON bookings (property_id, check_in, check_out);
CREATE INDEX IF NOT EXISTS bookings_guest_idx ON bookings (guest_id);
CREATE INDEX IF NOT EXISTS bookings_status_idx ON bookings (status);

CREATE TABLE IF NOT EXISTS reviews (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  property_id  UUID NOT NULL REFERENCES properties(id) ON DELETE CASCADE,
  booking_id   UUID REFERENCES bookings(id) ON DELETE SET NULL,
  guest_id     UUID REFERENCES guests(id) ON DELETE SET NULL,
  rating       SMALLINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
  title        TEXT,
  body         TEXT,
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS reviews_property_idx ON reviews (property_id);

CREATE TABLE IF NOT EXISTS enquiries (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  property_id  UUID REFERENCES properties(id) ON DELETE SET NULL,
  name         TEXT NOT NULL,
  email        TEXT NOT NULL,
  phone        TEXT,
  message      TEXT NOT NULL,
  status       TEXT NOT NULL DEFAULT 'new' CHECK (status IN ('new', 'contacted', 'closed')),
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS enquiries_status_idx ON enquiries (status);

-- ---------------------------------------------------------------- media
CREATE TABLE IF NOT EXISTS media (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  entity_type   TEXT NOT NULL CHECK (entity_type IN ('property', 'room_type', 'room')),
  entity_id     UUID NOT NULL,
  filename      TEXT NOT NULL,
  original_name TEXT NOT NULL,
  mime_type     TEXT NOT NULL,
  size_bytes    INTEGER NOT NULL,
  url           TEXT NOT NULL,
  uploaded_by   UUID REFERENCES users(id) ON DELETE SET NULL,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS media_entity_idx ON media (entity_type, entity_id);

-- ---------------------------------------------------------------- ETL / audit
-- Raw rows land here exactly as received, before any cleaning. Nothing is
-- overwritten: a bad row is quarantined with a reason, never deleted.
CREATE TABLE IF NOT EXISTS etl_batches (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  source_file  TEXT NOT NULL,
  rows_in      INTEGER NOT NULL DEFAULT 0,
  rows_loaded  INTEGER NOT NULL DEFAULT 0,
  rows_quarantined INTEGER NOT NULL DEFAULT 0,
  started_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
  finished_at  TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS etl_issues (
  id          BIGSERIAL PRIMARY KEY,
  batch_id    UUID REFERENCES etl_batches(id) ON DELETE CASCADE,
  source_file TEXT NOT NULL,
  row_number  INTEGER NOT NULL,
  entity      TEXT NOT NULL,
  severity    TEXT NOT NULL DEFAULT 'error' CHECK (severity IN ('warning', 'error')),
  issue_code  TEXT NOT NULL,
  detail      TEXT NOT NULL,
  raw_row     JSONB NOT NULL,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS etl_issues_batch_idx ON etl_issues (batch_id);
CREATE INDEX IF NOT EXISTS etl_issues_code_idx ON etl_issues (issue_code);

-- Business events worth keeping: logins, failed logins, admin writes.
CREATE TABLE IF NOT EXISTS event_log (
  id         BIGSERIAL PRIMARY KEY,
  actor_id   UUID,
  action     TEXT NOT NULL,
  entity     TEXT,
  entity_id  TEXT,
  meta       JSONB NOT NULL DEFAULT '{}'::jsonb,
  ip         TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS event_log_action_idx ON event_log (action, created_at DESC);

-- ---------------------------------------------------------------- metrics
-- Occupancy, ADR and RevPAR computed in one place so the dashboard, the tests
-- and the report cannot drift apart. Cancelled bookings never count; a stay
-- contributes only the nights that fall inside the requested window.
CREATE OR REPLACE VIEW v_booking_nights AS
SELECT b.id            AS booking_id,
        b.property_id,
        b.rooms_booked,
        b.rate_inr,
        g.d              AS stay_date,
        (b.rate_inr / GREATEST((b.check_out - b.check_in), 1)) AS nightly_rate_inr
FROM bookings b
JOIN LATERAL generate_series(b.check_in, b.check_out - INTERVAL '1 day', INTERVAL '1 day') AS g(d) ON TRUE
WHERE b.status <> 'cancelled';

-- ---------------------------------------------------------------- jobs
-- A background job queue built on PostgreSQL rather than Redis. Workers claim
-- rows with FOR UPDATE SKIP LOCKED, which is the canonical way to build a queue
-- on Postgres: two workers cannot claim the same row, and a worker that dies
-- mid-job simply leaves its lock to time out and the job to be reclaimed.
--
-- The reason for a queue at all is that sending an email is a network call to
-- somebody else's server. Doing it inline in a request means a slow SMTP host
-- becomes a slow booking, and an SMTP outage becomes a failed booking — for a
-- booking that was actually written to the database successfully.
CREATE TABLE IF NOT EXISTS jobs (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  type          TEXT NOT NULL,
  payload       JSONB NOT NULL DEFAULT '{}'::jsonb,
  status        TEXT NOT NULL DEFAULT 'pending'
                CHECK (status IN ('pending', 'running', 'done', 'failed', 'cancelled')),
  attempts      INTEGER NOT NULL DEFAULT 0,
  max_attempts  INTEGER NOT NULL DEFAULT 5,
  run_at        TIMESTAMPTZ NOT NULL DEFAULT now(),
  locked_at     TIMESTAMPTZ,
  locked_by     TEXT,
  last_error    TEXT,
  dedupe_key    TEXT,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT now(),
  finished_at   TIMESTAMPTZ
);
CREATE INDEX IF NOT EXISTS jobs_claim_idx ON jobs (status, run_at)
  WHERE status IN ('pending', 'running');
CREATE UNIQUE INDEX IF NOT EXISTS jobs_dedupe_idx ON jobs (dedupe_key) WHERE dedupe_key IS NOT NULL;

-- One row per email we attempted to send. Kept separately from jobs so that the
-- business record of "we told this guest" survives any pruning of the queue.
CREATE TABLE IF NOT EXISTS email_log (
  id            BIGSERIAL PRIMARY KEY,
  job_id        UUID REFERENCES jobs(id) ON DELETE SET NULL,
  to_address    TEXT NOT NULL,
  subject       TEXT NOT NULL,
  template      TEXT NOT NULL,
  status        TEXT NOT NULL CHECK (status IN ('sent', 'failed')),
  provider      TEXT NOT NULL DEFAULT 'console',
  provider_id   TEXT,
  error         TEXT,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS email_log_created_idx ON email_log (created_at DESC);
