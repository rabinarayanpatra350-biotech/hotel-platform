# Deployment

## Live now: GitHub Pages

### https://rabinarayanpatra350-biotech.github.io/hotel-platform/

Published from `/docs` on `main` by GitHub's own Pages build — no hosting account, no CLI, no token.
`docs/index.html` is a self-contained static build of the frontend that talks to the **same PostgreSQL database**
through Supabase's REST API instead of the Express server.

**What it carries:** property search and filters, property detail with room types, real inventory and reviews,
booking and enquiry submission (both write to the live database), and the staff dashboard computing occupancy,
ADR and RevPAR from real bookings.

**What it cannot carry, because GitHub Pages serves files and runs no code:** sign-in, JWT sessions, and the
staff/admin roles those sessions gate. The full server-side application is in `server/` and is what the test
suite covers. The page says this in a visible note rather than letting a visitor discover it.

**Security.** With the browser talking to the database directly, row-level security is the only boundary. Every
table is closed by default and opened only where the public site genuinely needs it:

| Table | Anonymous access |
|---|---|
| `properties`, `room_types`, `rooms`, `reviews` | SELECT |
| `bookings`, `guests`, `enquiries` | INSERT only — never readable |
| `property_metrics`, `room_availability` (views) | SELECT, aggregate-only, no guest records |
| `users`, `refresh_tokens`, `jobs`, `email_log`, `etl_*` | **none — verified to return 0 rows** |

Verified by switching the database session to the `anon` role and querying each table: the catalogue returns
14 properties / 5 room types / 640 rooms / 300 reviews, and the four sensitive tables return 0 rows.

---


The application is deployed as **two managed services** plus a **managed database**. Everything is
environment-driven; no secret is in the repository.

```
Browser ──▶ Netlify (React build + /api/* serverless function) ──▶ Supabase PostgreSQL 16
```

## What is already provisioned

| Component | Status |
|---|---|
| **Database** — Supabase Postgres 17, `ap-south-1` | **Live and seeded** — 14 properties, 640 rooms, 600 bookings, 300 reviews, 225 guests |
| **Netlify site** — `hotel-platform-iw9s` | **Created**, 11 environment variables set, public access enabled |
| **Build config** — `netlify.toml` | Committed; zero-config build |

## One step remains: connect the repository

Netlify builds from Git, so the last action is to point the existing site at this repository. It takes about a
minute and needs no configuration, because `netlify.toml` already declares the build command, publish directory,
functions directory, API proxy and SPA fallback.

1. Open <https://app.netlify.com/projects/hotel-platform-iw9s>
2. **Site configuration → Build & deploy → Link repository** (or *Import from Git* on a fresh site)
3. Choose `rabinarayanpatra350-biotech/hotel-platform`, branch `main`
4. Leave the build settings alone — `netlify.toml` overrides them
5. **Deploy**

Netlify will run `npm --prefix web ci && npm --prefix web run build`, publish `web/dist`, and bundle
`netlify/functions/api.js` as the API.

### Environment variables (already set on the site)

| Key | Purpose |
|---|---|
| `DATABASE_URL` | Supabase **pooler** connection (port 6543) — serverless functions open a connection per invocation, so the pooler multiplexes them |
| `DATABASE_SSL` | `true` — Supabase requires TLS |
| `JWT_ACCESS_SECRET`, `JWT_REFRESH_SECRET` | Token signing, 48 characters each |
| `CORS_ORIGINS` | `https://hotel-platform-iw9s.netlify.app` |
| `MAIL_TRANSPORT` | `record` — no SMTP credentials here, so emails are queued and logged to `email_log` rather than sent |
| `NODE_ENV` | `production` |

## Why a serverless function, and what changes

`server/src/app.js` exports `createApp()` and **never calls `listen()`** — that is what lets the same module run
as a long-lived server locally (`npm start`) and as a request handler on Netlify. `netlify/functions/api.js`
adapts it with `serverless-http`.

One deliberate adaptation: the background worker does not run as a separate process on a serverless host, so
**one job is drained after each request**. The queue keeps its real benefits — the job is still enqueued
transactionally with the booking, still retries with backoff, still deduplicates, and is still observable at
`/api/jobs` — it is only the *scheduling* that moves. That is stated here rather than hidden.

## Seeding the managed database

The build environment cannot reach Supabase over TCP, so the data was loaded through the SQL channel instead:

```bash
cd server
node scripts/exportSeedSql.js     # emits data/seed.sql using the same tested ETL functions
```

`exportSeedSql.js` reuses `validateBookingRow`, `mapRoomType` and `normaliseName` — the functions the test suite
covers — so the deployed dataset is produced by the same rules as the verified one, not by a second
implementation that could drift.

## Deploying to Render + Vercel instead

`render.yaml` and `web/vercel.json` remain in the repository for the arrangement the brief names. Import the
repository as a Render Blueprint and it creates the API and a managed Postgres together; set
`CORS_ORIGINS` to the Vercel URL, and `VITE_API_URL` on Vercel to the Render URL.

## Verifying a deployment

```bash
curl https://<site>/api/health
# {"data":{"status":"ok","database":"up",...}}

curl "https://<site>/api/properties?pageSize=5"
curl "https://<site>/api/metrics?from=2026-01-01&to=2026-04-01"   # needs a staff token
```
