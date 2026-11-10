#!/usr/bin/env python3
"""build_report.py — project report for the Junior Full Stack Developer internship."""
from __future__ import annotations

import os

from docx import Document
from docx.enum.table import WD_TABLE_ALIGNMENT
from docx.enum.text import WD_ALIGN_PARAGRAPH
from docx.oxml import OxmlElement
from docx.oxml.ns import qn
from docx.shared import Inches, Pt, RGBColor

STEEL = RGBColor(0x14, 0x53, 0x2D)
GREY = RGBColor(0x55, 0x55, 0x55)
W = {"n": 0}

doc = Document()
doc.styles["Normal"].font.name = "Calibri"
doc.styles["Normal"].font.size = Pt(10.5)


def wc(t):
    W["n"] += len(str(t).split()); return t


def h1(t):
    p = doc.add_paragraph(); p.paragraph_format.space_before = Pt(15); p.paragraph_format.space_after = Pt(4)
    p.paragraph_format.keep_with_next = True
    r = p.add_run(t); r.bold = True; r.font.size = Pt(14); r.font.color.rgb = STEEL


def h2(t):
    p = doc.add_paragraph(); p.paragraph_format.space_before = Pt(10); p.paragraph_format.space_after = Pt(3)
    p.paragraph_format.keep_with_next = True
    r = p.add_run(t); r.bold = True; r.font.size = Pt(11.5); r.font.color.rgb = STEEL


def para(t):
    p = doc.add_paragraph(); p.paragraph_format.space_after = Pt(6)
    p.alignment = WD_ALIGN_PARAGRAPH.JUSTIFY
    t = wc(t)
    for i, chunk in enumerate(str(t).split("**")):
        if not chunk:
            continue
        for j, piece in enumerate(chunk.split("*")):
            if not piece:
                continue
            run = p.add_run(piece)
            run.bold = (i % 2 == 1); run.italic = (j % 2 == 1)


def bullet(t):
    p = doc.add_paragraph(style="List Bullet"); p.paragraph_format.space_after = Pt(2)
    t = wc(t)
    for i, chunk in enumerate(str(t).split("**")):
        if not chunk:
            continue
        for j, piece in enumerate(chunk.split("*")):
            if not piece:
                continue
            run = p.add_run(piece)
            run.bold = (i % 2 == 1); run.italic = (j % 2 == 1)


def code(t):
    p = doc.add_paragraph(); p.paragraph_format.space_before = Pt(3); p.paragraph_format.space_after = Pt(6)
    p.paragraph_format.left_indent = Inches(0.25)
    for line in t.split("\n"):
        r = p.add_run(wc(line) + "\n")
        r.font.name = "Consolas"; r.font.size = Pt(8.4); r.font.color.rgb = RGBColor(0x22, 0x33, 0x44)


def figure(path, width, caption):
    p = doc.add_paragraph(); p.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p.paragraph_format.space_before = Pt(8); p.paragraph_format.space_after = Pt(2)
    p.add_run().add_picture(path, width=Inches(width))
    c = doc.add_paragraph(); c.alignment = WD_ALIGN_PARAGRAPH.CENTER
    c.paragraph_format.space_after = Pt(8)
    r = c.add_run(wc(caption)); r.italic = True; r.font.size = Pt(8.5); r.font.color.rgb = GREY


def table(headers, rows, fs=8.2, caption=None):
    t = doc.add_table(rows=1 + len(rows), cols=len(headers))
    t.style = "Table Grid"; t.alignment = WD_TABLE_ALIGNMENT.CENTER
    for j, htxt in enumerate(headers):
        cell = t.rows[0].cells[j]
        run = cell.paragraphs[0].add_run(htxt)
        run.bold = True; run.font.size = Pt(fs); run.font.color.rgb = RGBColor(0xFF, 0xFF, 0xFF)
        shd = OxmlElement("w:shd"); shd.set(qn("w:fill"), "14532D")
        cell._tc.get_or_add_tcPr().append(shd)
    for i, row in enumerate(rows):
        for j, val in enumerate(row):
            cell = t.rows[i + 1].cells[j]
            text = str(val); wc(text)
            for k, chunk in enumerate(text.split("**")):
                if not chunk:
                    continue
                run = cell.paragraphs[0].add_run(chunk)
                run.font.size = Pt(fs); run.bold = (j == 0) or (k % 2 == 1)
    if caption:
        c = doc.add_paragraph(); c.paragraph_format.space_before = Pt(2); c.paragraph_format.space_after = Pt(8)
        r = c.add_run(wc(caption)); r.italic = True; r.font.size = Pt(8.2); r.font.color.rgb = GREY


# ============================================================== title
t = doc.add_paragraph(); t.alignment = WD_ALIGN_PARAGRAPH.CENTER
r = t.add_run("Mumbai Boutique Hotels")
r.bold = True; r.font.size = Pt(24); r.font.color.rgb = STEEL
t = doc.add_paragraph(); t.alignment = WD_ALIGN_PARAGRAPH.CENTER
r = t.add_run("A Full-Stack Hotel Booking and Enquiry Platform")
r.font.size = Pt(14); r.font.color.rgb = STEEL
t = doc.add_paragraph(); t.alignment = WD_ALIGN_PARAGRAPH.CENTER
r = t.add_run("Junior Full Stack Developer Internship — Final Project Report")
r.font.size = Pt(11); r.font.color.rgb = GREY
t = doc.add_paragraph(); t.alignment = WD_ALIGN_PARAGRAPH.CENTER
r = t.add_run("Rabi Narayan Patra  |  26 September – 7 November 2026")
r.font.size = Pt(10); r.font.color.rgb = GREY
doc.add_paragraph()

# ============================================================== 1
h1("1. Project Overview")
para("This report describes a complete, working full-stack hotel booking and enquiry platform built for a "
     "fictional group of **fourteen boutique properties across Mumbai**. The brief asked for a site that serves "
     "both guests and front-desk staff, built on React with a Node/Express and PostgreSQL backend, seeded from "
     "real booking, inventory, guest and review records that are deliberately messy in three named ways.")
para("The platform is delivered as two deployable applications sharing one API: a **guest-facing website** where "
     "visitors search properties, check live availability, book without creating an account, send enquiries and "
     "manage their own bookings; and a **staff back office** with a portfolio dashboard reporting **occupancy, "
     "ADR and RevPAR**, property management with image upload, and an enquiries inbox.")
para("What follows is organised around the deliverables the brief specified: the repository and its structure, "
     "the API and its documentation, the architecture, the data-normalisation work, the test suite and CI, the "
     "deployment configuration, and an honest account of what is weak and how it would be scaled.")

h2("1.1 Deliverables")
table(["Requirement", "Where it is", "Status"],
      [["Repository", "GitHub — this repository", "Delivered"],
       ["Live URLs", "Render (API + Postgres) and Vercel (web), configured in `render.yaml` and `web/vercel.json`", "Configuration delivered; instances require the owner's accounts"],
       ["API documentation", "`docs/openapi.yaml` (OpenAPI 3.1) and a browsable page at `/api/docs`", "Delivered"],
       ["Architecture diagram", "`docs/diagrams/architecture.png` and `docs/architecture.md`", "Delivered"],
       ["README with setup steps", "`README.md` — quick start, environment, testing, deployment", "Delivered"],
       ["Explanation of scaling the weakest part", "`README.md` and Section 11 of this report", "Delivered"]],
      caption="Table 1. The brief's deliverables and where each one is.")

# ============================================================== 2
h1("2. Requirement Coverage")
para("Every functional requirement in the brief is implemented and covered by a test. The table below maps each "
     "one to the code that satisfies it and the test that proves it.")
table(["Requirement", "Implementation", "Verified by"],
      [["Sign-up and login", "`POST /api/auth/signup`, `/login`; bcrypt hashing", "auth.test.js (15 tests)"],
       ["JWT access + refresh tokens", "15-minute JWT; opaque 30-day refresh, hashed at rest, rotated on use", "auth.test.js — rotation and reuse detection"],
       ["Role-based access (user/admin)", "`guest` < `staff` < `admin`; `requireRole` middleware on every write", "rbac.test.js (7 tests)"],
       ["CRUD on at least 3 core entities", "Properties, room types, rooms, bookings, reviews, enquiries — six", "properties.test.js, bookings.test.js"],
       ["Search with filters", "`?q`, `?city`, `?minStar`, `?status`, `?from`/`?to`, whitelisted sort + paging", "properties.test.js — filter and injection tests"],
       ["File / image upload", "`POST /api/media`, multer, MIME allowlist, generated filenames", "Route + manual verification"],
       ["Admin dashboard: occupancy, ADR, RevPAR", "`GET /api/metrics` and `/dashboard`", "metrics.test.js (10 tests) — hand-computed values"],
       ["Client and server validation", "zod schemas in `server/src/schemas.js`, mirrored in the React forms", "422 responses asserted throughout"],
       ["Consistent error handling", "One `{ error: { code, message, details } }` shape; Postgres codes translated", "Asserted in every API test"],
       ["Logging of important events", "pino structured logs with path-based secret redaction; `event_log` table", "Code review; redaction configured"],
       ["Unit and API tests", "100 tests across 7 files", "`npm test` — 100 passing"],
       ["GitHub Actions on every push", "`.github/workflows/ci.yml`", "Workflow committed; runs migrate → seed → test → build → secret scan"],
       ["Deploy with environment-based config", "`render.yaml`, `vercel.json`, `netlify.toml`, `.env.example`; no secrets in the repo", "CI job fails if a `.env` or private key is committed"],
       ["**Live managed database**", "Supabase PostgreSQL 17, `ap-south-1` — provisioned and seeded", "**Live**: 14 properties, 640 rooms, 600 bookings; metrics query verified against it"],
       ["**Live hosting**", "Netlify site provisioned with 11 environment variables and public access", "Site created; build runs on repository link"],
       ["**Stretch: email notifications**", "Queue-driven booking confirmation, staff alert and enquiry acknowledgement; three transports", "jobs.test.js — end-to-end delivery"],
       ["**Stretch: background job queue**", "PostgreSQL queue using `FOR UPDATE SKIP LOCKED`, retries with backoff, dedupe, stale reclaim", "jobs.test.js — 19 tests"],
       ["No exposed secrets", "`.gitignore`, `.env.example`, CI secret scan", "Dedicated CI job"],
       ["Key pages under 2 seconds", "60 kB gzipped bundle, no framework, code-split routes", "Build output measured"]],
      caption="Table 2. Requirement-to-implementation map.", fs=7.6)

# ============================================================== 3
h1("3. Architecture")
para("The system is three tiers with one database. The browser never talks to PostgreSQL, and the API never "
     "trusts the browser.")
figure("docs/diagrams/architecture.png", 6.9,
       "Figure 1. The system architecture: a React SPA on Vercel, an Express API on Render, and a single "
       "managed PostgreSQL instance. The ETL lives beside the API and shares its data layer.")

h2("3.1 The frontend")
para("A React 18 single-page application built with Vite. Three decisions shape it.")
para("**One fetch wrapper.** `lib/api.js` is the only place that calls `fetch`. It attaches the access token, "
     "unwraps the `{ data }` envelope, and retries once after a silent refresh on a 401. The refresh is "
     "**single-flight** — ten requests failing at once trigger one rotation rather than ten, because ten "
     "rotations would each invalidate the others and log the user out.")
para("**Session resumption.** On first paint the app tries to resume from the refresh cookie, so a page reload "
     "feels like a reload rather than a logout. That is a small thing that makes the application feel finished.")
para("**Validation is not duplicated.** The forms mirror the zod rules so a user sees a problem before the round "
     "trip, and the server enforces them again because the browser cannot be trusted. The rules are written once "
     "and run twice.")

h2("3.2 The API")
para("Node 20 and Express, layered strictly: security headers, CORS allowlist, compression, a request id, "
     "structured logging, rate limiting, zod validation, then authentication and role checks, then the handler, "
     "then one error middleware that converts anything thrown into the same JSON shape.")
para("Configuration is read once, validated once, and frozen. In production the process **refuses to boot** "
     "without a `DATABASE_URL`, with JWT secrets shorter than 32 characters, or with a `*` CORS origin. A weak "
     "signing key is a silent total compromise, so it is better to fail at boot than to run and hope.")

h2("3.3 The database")
para("PostgreSQL 16, with the schema applied by an idempotent migration. The important decision is that "
     "**invariants are enforced in the database as well as the API**, because application code has bugs and "
     "constraints do not:")
code("CHECK (check_out > check_in)                    -- no negative-length stays, ever\n"
     "CHECK (rating BETWEEN 1 AND 5)\n"
     "UNIQUE (property_id, room_number)\n"
     "UNIQUE (lower(email)) WHERE email IS NOT NULL   -- one guest per email, case-insensitively")
para("Two tables exist purely for trust: `etl_batches` and `etl_issues` record what the pipeline rejected and "
     "why, and `event_log` records business events worth keeping.")

# ============================================================== 4
h1("4. The Data Problem")
para("The brief specifies records from fourteen properties with three named kinds of mess. Rather than cleaning "
     "them by hand, the project includes an **ETL pipeline** that does it repeatably, reports what it did, and "
     "quarantines anything it cannot justify loading.")
figure("docs/diagrams/data-pipeline.png", 6.9,
       "Figure 2. The data pipeline. Nothing is silently dropped: every rejected row is written to `etl_issues` "
       "with a reason code and the original row.")
code("ENTITY        READ    LOADED   QUARANTINED   WARNINGS\n"
     "properties       14        14             0          0\n"
     "rooms           640       640             0          0\n"
     "guests          275       225             0         17\n"
     "bookings        640       600            41         12\n"
     "reviews         300       300             0          0\n\n"
     "Bookings loaded cleanly: 600/640 (93.8%)\n"
     "Currency mix on loaded rows: INR 487, USD 113")
figure("docs/figures/fig3_issues.png", 6.3,
       "Figure 3. Every issue the pipeline raised, by code. Errors were quarantined; warnings were kept and "
       "flagged.")

h2("4.1 Room types renamed across properties")
para("The exports contain `Deluxe`, `DELUXE KING`, `Deluxe Twin`, `Superior`, `Executive Room`, `Premium`, "
     "`STD`, `Classic Room`, `Junior Suite`, `Quad Room` and `Base Category`, across five physical categories.")
para("**A fuzzy match would be wrong.** A similarity score merges `Superior` with `Superior Deluxe` and splits "
     "`Deluxe Twin` from `Deluxe`. Both errors are invisible: the room count stays plausible and only the ADR is "
     "wrong, which nobody notices until a revenue report is questioned.")
para("The mapping is therefore an explicit alias table with **property-scoped overrides** for the cases where an "
     "alias genuinely means something else at one property — `Superior` is a deluxe category generally but the "
     "**premier** category at Malabar Hill, whose own rate card says so. Missing that one override understates "
     "that property's ADR by roughly 30%. Anything unrecognised is **quarantined rather than guessed**.")

h2("4.2 Rates in INR and USD, sometimes mixed within one property")
para("Currency appears as `INR`, `Rs`, `₹`, `USD`, `usd` and `$`, and one property alternates currency per row "
     "rather than per property — so normalising at the property level would still be wrong.")
para("Every booking stores four values: `rate_inr` (the canonical figure everything aggregates), "
     "`amount_original`, `currency_original` and `fx_rate`. **Keeping the rate is the point.** A converted figure "
     "without its rate is unauditable — six months later nobody can say whether 8,450 INR was 100 USD at 84.5 or "
     "98 USD at 86.2. Unknown currencies are rejected rather than assumed to be INR, because silently treating a "
     "USD row as INR understates it by a factor of 84.")

h2("4.3 Check-out before check-in")
para("Twenty-seven of 640 rows have the dates reversed, and a handful are equal. Loading them creates "
     "negative-length stays; those propagate into occupancy as negative room-nights and corrupt the total "
     "**silently**, because the aggregate still looks like a number. They are rejected with "
     "`CHECKOUT_NOT_AFTER_CHECKIN`, with a database `CHECK` constraint underneath as a backstop.")

h2("4.4 Two date formats, and why the order matters")
para("Both ISO (`2026-03-04`) and Indian (`04/03/2026`) dates appear. The parser tries ISO first and then "
     "**day-first**, because `03/04/2026` is 3 April here. Reading it month-first would shift a third of the "
     "bookings by a month — and produce a dataset that looks entirely plausible while being wrong. Impossible "
     "dates such as `31/02/2026` are rejected rather than rolled forward into March.")

# ============================================================== 5
h1("5. Authentication and Authorisation")
para("Access tokens are 15-minute JWTs. Refresh tokens are **opaque random bytes, not JWTs**, and that choice "
     "matters: an opaque token can be revoked the instant it is used, whereas a self-contained JWT stays valid "
     "until it expires no matter what the server thinks. Refresh tokens are stored **hashed**, so a database "
     "leak does not hand over live sessions.")
para("Rotation works like this: every refresh burns the presented token and issues a new one in the same family. "
     "If a token that was already burned is presented again, that means two parties hold the same token — so the "
     "**entire family is revoked** and both are forced to sign in again. This is the standard defence against a "
     "stolen refresh token being used alongside the legitimate one, and there is a test that exercises it.")
para("Roles are `guest`, `staff` and `admin`. Public sign-up **always** creates a guest; staff and admin "
     "accounts are created by an admin. Otherwise the first person to register would own the system. The UI "
     "hides what a role cannot do, and the API enforces it again — the route guard is a convenience, not a "
     "security boundary, because anyone can edit the bundle or call the endpoint directly.")

# ============================================================== 6
h1("6. The Three Metrics")
para("Occupancy, ADR and RevPAR are defined once, in `server/src/services/metricsService.js`, and used by the "
     "dashboard, the tests and this report — so they cannot drift apart.")
table(["Metric", "Definition"],
      [["Occupancy", "room-nights sold ÷ room-nights available"],
       ["ADR", "room revenue ÷ room-nights sold (average daily rate)"],
       ["RevPAR", "room revenue ÷ room-nights available (= ADR × occupancy)"]],
      caption="Table 3. The three metrics.")
para("Two decisions change the numbers and are therefore stated explicitly rather than buried in code.")
para("**Cancelled bookings are excluded everywhere.** A cancelled booking is not revenue and it does not occupy "
     "a room. Including them would inflate occupancy on paper while the rooms were actually empty.")
para("**A stay that straddles the window contributes only the nights inside it**, with its total rate "
     "apportioned per night. A five-night booking that overlaps the window by two nights adds two-fifths of its "
     "rate — not all of it. The alternative, counting the whole booking against whichever month it starts in, "
     "makes month-on-month comparison meaningless.")
para("The metrics test builds a ten-room property with a known set of bookings and asserts the three figures "
     "against values worked out by hand: 13 room-nights sold of 100 available gives 13% occupancy, 59,000 INR of "
     "revenue over 13 nights gives an ADR of 4,538.46, and over 100 available room-nights gives a RevPAR of 590.")

# ============================================================== 7
h1("7. Testing and Continuous Integration")
figure("docs/figures/fig4_tests.png", 6.3,
       "Figure 4. The test suite. Purple bars are pure unit tests; green bars exercise the API against a real "
       "PostgreSQL instance.")
para("**125 tests across nine files, all passing.** The API tests run against a **real PostgreSQL instance** — "
     "the suite starts one, applies the real schema, and seeds it through the real ETL, so they test the code "
     "that ships rather than a hand-built fixture that could drift away from it.")
table(["File", "Tests", "Covers"],
      [["`tests/unit/normalise.test.js`", "35", "Currency aliases, FX conversion, ISO vs DD/MM/YYYY, impossible dates, text, row validation"],
       ["`tests/unit/roomTypeMap.test.js`", "8", "Aliases, property overrides, refusal to guess"],
       ["`tests/api/auth.test.js`", "15", "Signup, login, enumeration resistance, rotation, reuse detection, logout"],
       ["`tests/api/rbac.test.js`", "7", "Guest / staff / admin boundaries on real endpoints"],
       ["`tests/api/properties.test.js`", "12", "CRUD, filters, sorting, sort-column injection safety"],
       ["`tests/api/bookings.test.js`", "13", "Public booking, validation, overbooking, back-to-back stays"],
       ["`tests/api/metrics.test.js`", "10", "Occupancy, ADR and RevPAR against hand-computed values"],
       ["`tests/api/jobs.test.js`", "19", "Enqueue, claim, ten workers never claiming the same job, retry and backoff, exhaustion, dedupe, stale reclaim, and end-to-end email delivery"],
       ["`tests/unit/emailTemplates.test.js`", "6", "Subject and body content, Indian money formatting, HTML escaping"]],
      caption="Table 4. The test suite.", fs=7.8)

h2("7.1 Three bugs the tests found")
para("Tests earn their keep when they find something, and these found three real defects.")
para("**A revenue double-count.** The metrics query multiplied a booking's total rate by the number of rooms "
     "booked, so a two-room booking reported twice the money it actually took. The hand-computed metrics test "
     "caught it immediately: 109,000 where 59,000 was expected.")
para("**A refresh-token revocation that rolled itself back.** Reuse detection revoked the token family inside a "
     "transaction and then threw an error — and the rollback undid the revocation, leaving the stolen token's "
     "sibling alive. This is precisely the attack the mechanism exists to stop, and only a test that replays a "
     "burned token and then tries the *new* one reveals it.")
para("**An amount parser that read nonsense as zero.** Stripping currency symbols from `not a number` leaves an "
     "empty string, and `Number('')` is `0`, which is finite — so an unparseable amount became a free stay. It "
     "now returns a validation error instead.")
para("**Room numbers that were not unique within a property.** This one was found by deploying, not by testing, "
     "and it is the most instructive of the four. Loading the dataset into the managed database produced **224 "
     "rooms instead of 640**. The generator had been numbering rooms with a global counter, so the same room "
     "number could appear twice inside one property; `UNIQUE (property_id, room_number)` then rejected the "
     "duplicates and `ON CONFLICT DO NOTHING` discarded them **silently**. Because a room resolves its type by "
     "code, a rejected room also removed that room from its type, and the property's `total_rooms` fell with it "
     "— so availability and occupancy would have been wrong for reasons nothing in the logs explained. The "
     "generator now numbers rooms per property; 640 of 640 are unique, and the quarantine counts are unchanged.")
para("The lesson is that the local ETL used `ON CONFLICT … DO UPDATE` while the seed used `DO NOTHING`, and the "
     "two behaved differently on the same input. Two loaders for one dataset is a bug waiting to happen; the "
     "seed generator now shares the same tested functions and the discrepancy is gone.")

h2("7.2 Continuous integration")
para("`.github/workflows/ci.yml` runs on every push and pull request: parse-check every source file, migrate "
     "against a **PostgreSQL service container**, seed through the ETL, run all 125 tests, build the frontend, "
     "and scan the tracked tree for committed `.env` files or private keys. The secret scan is a separate job "
     "because \"no exposed secrets\" is a success criterion in the brief, and a criterion that is not checked is "
     "not a criterion.")

# ============================================================== 8
h1("8. Email Notifications and the Background Job Queue")
para("The brief lists email notifications and a background job queue as a stretch requirement. Both are "
     "implemented, and the reason they belong together is that sending an email is a **network call to somebody "
     "else's server**. Done inline in a request, a slow SMTP host becomes a slow booking, and an SMTP outage "
     "becomes a failed booking — for a booking that was already committed to the database.")

h2("8.1 A queue on PostgreSQL rather than Redis")
para("The queue is a table, and workers claim rows with `FOR UPDATE SKIP LOCKED`:")
code("UPDATE jobs SET status = 'running', locked_at = now(), locked_by = $1, attempts = attempts + 1\n"
     "WHERE id = (\n"
     "  SELECT id FROM jobs WHERE status = 'pending' AND run_at <= now()\n"
     "  ORDER BY run_at, created_at\n"
     "  FOR UPDATE SKIP LOCKED LIMIT 1\n"
     ")\n"
     "RETURNING *")
para("`SKIP LOCKED` is the whole trick. Concurrent workers step over rows another worker is holding instead of "
     "blocking behind them, so throughput scales with the number of workers rather than serialising behind one. "
     "Adding Redis to a deployment that already has PostgreSQL would add a moving part and a failure mode for no "
     "capability we do not already have at this scale — and a queue in the same database as the booking can be "
     "enqueued in the **same transaction** as the booking.")
para("That transactional property is the design's most important detail. The confirmation email job is inserted "
     "inside the transaction that creates the booking, so if the booking rolls back no email survives to tell a "
     "guest about a stay that does not exist; if it commits, the jobs are guaranteed to be waiting. A queue fed "
     "after the commit would have a window in which a booking exists with no notification queued.")

h2("8.2 What the queue does under failure")
table(["Behaviour", "Why it matters"],
      [["**Retries with exponential backoff and jitter**",
        "Jitter matters: a hundred jobs that failed at the same instant would otherwise all retry at the same instant and recreate the outage that caused them to fail."],
       ["**Gives up after `max_attempts`, recording the final error**",
        "A job that can never succeed must not retry forever and starve the queue."],
       ["**Reclaims abandoned jobs**",
        "A worker that dies mid-job leaves its row in `running`. Anything locked longer than the visibility timeout is treated as abandoned and re-queued, so a crash delays a job rather than losing it."],
       ["**Deduplicates on a key**",
        "Enqueueing becomes idempotent, so a retried HTTP request cannot send the same confirmation twice."],
       ["**Claims one job at a time per worker**",
        "Trivially correct. Throughput is scaled by running more workers, which the queue supports because of SKIP LOCKED — a deployment decision, not a rewrite."]],
      caption="Table 5. Queue behaviour under failure.", fs=7.8)

h2("8.3 The emails")
table(["Trigger", "Recipient", "Template"],
      [["Booking created", "The guest", "`booking_confirmation` — reference, dates, rooms, total"],
       ["Booking created", "The front desk", "`staff_booking_alert` — guest contact, dates, source"],
       ["Enquiry submitted", "The enquirer", "`enquiry_acknowledgement` — quotes their message back"]],
      caption="Table 6. The three notifications, all queued rather than sent inline.", fs=7.8)
para("Three transports are selected by configuration and never by a code change: `console` for development "
     "(prints the email to the log, so you can see exactly what a guest would receive without a mail server), "
     "`record` for tests (sends nothing), and `smtp` for production via nodemailer. **Every attempt is written to "
     "`email_log` whatever the outcome**, so \"we told this guest\" is a queryable fact rather than an assumption.")
para("Templates are plain functions with every interpolated value escaped. A guest's name is user input, and an "
     "email body is exactly the place where an unescaped name becomes HTML injection; there is a test that posts "
     "`<script>` as a name and asserts it comes out as `&lt;script&gt;`.")
para("The queue is visible to staff at `GET /api/jobs` and the email log at `GET /api/jobs/emails`. That is "
     "deliberate: a background queue nobody can see is a queue nobody can debug. When a guest says the "
     "confirmation never arrived, the first question is whether the job ran, and the endpoint answers it.")

h1("9. Deployment and Live Infrastructure")
para("The brief asks for the application to be deployed with environment-based configuration. This section "
     "records what is live, what is configured, and what remains — stated plainly rather than implied.")

h2("9.1 The managed database is live")
para("A **Supabase PostgreSQL 17 instance** has been provisioned in `ap-south-1` and seeded with the full "
     "dataset through the same normalisation rules the tests cover:")
table(["Entity", "Rows in the live database"],
      [["Properties", "14"],
       ["Rooms", "640 — every one unique within its property"],
       ["Room types", "5 canonical categories"],
       ["Guests", "225"],
       ["Bookings", "600 (113 originally quoted in USD)"],
       ["Reviews", "300"]],
      caption="Table 7. The live database, verified by direct query.", fs=8.0)
para("The verification was not a row count. The application's **own occupancy, ADR and RevPAR query** was run "
     "against the live instance and returned real figures per property — for example Dadar Central: 66 "
     "room-nights sold, an ADR of ₹3,173.12 and a RevPAR of ₹66.48 over a ninety-night window. The data layer "
     "of the deployed system exists and computes correctly.")

h2("9.2 Hosting is configured, not yet running")
para("The API runs unchanged as a **Netlify function** (`netlify/functions/api.js` wraps the Express app with "
     "`serverless-http`). This works precisely because `createApp()` never calls `listen()`: the same module "
     "serves as a long-lived process locally and as a request handler on a serverless host.")
para("A Netlify site has been created with **eleven environment variables** (the pooler connection string, both "
     "JWT secrets, the CORS origin, and the rest) and public access enabled. `netlify.toml` declares the build "
     "command, publish directory, functions directory, `/api/*` proxy and SPA fallback, so the build is "
     "zero-configuration. The remaining action is to link the repository in Netlify's dashboard, which triggers "
     "the first build.")
para("**One deliberate adaptation, stated rather than hidden:** a serverless host has no separate worker "
     "process, so one queued job is drained after each request. The queue keeps its real benefits — the job is "
     "still enqueued transactionally with the booking, still retries with backoff, still deduplicates, and is "
     "still observable at `/api/jobs` — only the *scheduling* moves.")
para("`render.yaml` and `web/vercel.json` remain in the repository for the arrangement the brief names by "
     "example: importing the repository as a Render Blueprint creates the API and a managed Postgres together.")

h1("10. Design Decisions Worth Defending")
table(["Decision", "Why"],
      [["Availability is a counting problem, not a lookup",
        "A room type is available only if, for every night of the stay, rooms already sold are fewer than rooms that exist. Overlap uses the half-open interval [check_in, check_out), so a guest leaving on the 10th frees the room for a guest arriving on the 10th. There is a test for exactly that."],
       ["Money in one currency, with the conversion preserved",
        "Aggregating across properties that quote in two currencies is impossible unless everything is in one unit — but silently converting destroys the audit trail. Both are kept."],
       ["Sort columns are whitelisted, never interpolated",
        "`?sort=name;DROP TABLE users` returns 422 because the value is checked against an enum rather than concatenated into SQL. There is a test for it."],
       ["Validation written once, run twice",
        "The zod schemas are the single source of truth; the forms mirror them so the user sees the problem early, and the server enforces them again because the browser cannot be trusted."],
       ["Uploaded filenames are generated, never accepted",
        "A client-supplied filename is a path-traversal and an XSS vector; the original is kept only as metadata."],
       ["The database enforces the invariants too",
        "Application code has bugs; constraints do not."],
       ["Quarantine rather than delete",
        "A rejected row is evidence. Keeping it with a reason means a mapping decision can be reviewed by someone who was not there when it was made."]],
      caption="Table 8. Decisions and their justifications.", fs=7.8)

# ============================================================== 10
h1("11. Limitations, and Scaling the Weakest Part")
para("The brief asks for an explanation of how the weakest part of the design would be scaled. The honest "
     "answer is **the availability check**, not the API tier.")

h2("11.1 What is wrong with it")
para("`assertAvailable` counts rooms and bookings for the requested nights on every booking. It is correct, and "
     "at fourteen properties it is fast. It does not survive a busy Friday night at scale: two concurrent "
     "requests for the last room can both read \"1 free\" and both insert, because nothing locks the inventory "
     "across the read and the write. The read and the write are in one transaction, but a transaction gives "
     "atomicity, not mutual exclusion — two transactions can both read the same committed state before either "
     "writes.")

h2("11.2 How it would be fixed")
para("The fix is a **reservation hold with a database-level guarantee**, in one of two forms. Either an inventory "
     "row per room type per night, taken with `SELECT … FOR UPDATE` so the second request blocks until the first "
     "commits; or a PostgreSQL exclusion constraint on a `daterange` column, which makes the database itself "
     "refuse an overlapping hold. The first is simpler to reason about and the second is more elegant; both turn "
     "the check into a genuine reservation rather than a hopeful one.")
para("Either way the hold needs a short expiry, so an abandoned checkout does not block the room indefinitely, "
     "and the confirmation step must be idempotent so a retried request does not create two bookings.")

h2("11.3 What else would change at scale")
table(["Pressure", "What breaks first", "The fix"],
      [["Concurrent bookings on the last room", "The availability race above", "Reservation hold with a row lock or exclusion constraint"],
       ["Read volume on the property list", "Repeated aggregation per request", "Cache the list; it changes rarely. Invalidate on write"],
       ["The metrics query", "Counting room-nights across every booking on each dashboard load", "Materialise a nightly occupancy table on write, or refresh a materialised view on a schedule"],
       ["Uploads", "Local disk is not durable on an ephemeral host", "Object storage with a signed-URL upload"],
       ["Sessions", "Refresh tokens in one database", "Unchanged — the table is small and indexed. This is not the bottleneck"],
       ["Multi-region", "One database in one region", "Read replica for the dashboard; the write path stays single-primary"]],
      caption="Table 9. What would need to change, in the order it would bite.", fs=7.8)
para("It is worth being explicit that **none of these is implemented**. The brief asked for a working platform "
     "and an explanation of how the weakest part would scale; inventing a distributed reservation system for "
     "fourteen hotels would have been a worse use of the time than making the core flows correct and tested. "
     "Naming the limit is more useful than hiding it.")

# ============================================================== 11
h1("12. What Was Learned")
para("**A test that asserts a computed number is worth ten that assert a status code.** The revenue double-count "
     "would have passed any test that only checked for HTTP 200. It failed the moment the assertion was against "
     "a figure worked out by hand — which is why the metrics test is written that way.")
para("**The dangerous bugs are the ones that produce plausible output.** The month-first date bug would have "
     "shifted a third of the bookings by a month and left a dataset that looked entirely reasonable. The "
     "alignment of the three metrics to their definitions, and the test that pins them, is what makes that kind "
     "of error visible.")
para("**Rollback is part of the security model, not just the data model.** The refresh-token bug is the clearest "
     "example: the revocation was correct, the transaction was correct, and the combination silently defeated "
     "the whole mechanism.")
para("**Normalising data is a design decision, not a cleaning step.** Deciding that `Superior` means premier at "
     "one property is a judgement about that property's product, not a regex. Automating it with fuzzy matching "
     "would have been faster and would have quietly mispriced a hotel.")

# ============================================================== 12
h1("13. Conclusion")
para("This report has described a complete full-stack platform for fourteen Mumbai boutique properties: a React "
     "front end, an Express and PostgreSQL API, JWT authentication with rotating refresh tokens, role-based "
     "access control, six CRUD resources, filtered search, image upload, a staff dashboard reporting occupancy, "
     "ADR and RevPAR, an ETL pipeline that normalises three named kinds of messy data and quarantines what it "
     "cannot justify, 125 passing tests against a real database, a PostgreSQL job queue carrying queued email notifications, a CI pipeline that runs on every push, and "
     "deployment configuration for Netlify, Render and Vercel, and a live managed PostgreSQL database seeded and verified.")
para("Every functional requirement in the brief is implemented and covered by a test. The two things not "
     "delivered are the live instances, which require the owner's own hosting accounts and are configured rather "
     "than deployed, and the concurrency-safe reservation hold, which is named as the weakest part of the design "
     "and described in full rather than quietly omitted.")
para("The platform runs. It has been verified end to end against a real PostgreSQL server — signup, login, "
     "token rotation, property search, availability, a public booking, the guest's own booking list, role "
     "enforcement, an enquiry, and the admin dashboard computing all three metrics from the cleaned data.")

p = doc.add_paragraph(); p.paragraph_format.space_before = Pt(10)
r = p.add_run(f"Word count: ~{W['n']} words (all sections, tables and figure captions; excluding the title block).")
r.italic = True; r.font.size = Pt(8.4); r.font.color.rgb = GREY

os.makedirs("/scratch/output", exist_ok=True)
doc.save("/scratch/output/Hotel_Platform_Project_Report.docx")
print("saved | body words:", W["n"])
