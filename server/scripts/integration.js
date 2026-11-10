import { startDevDb } from './devDb.js';
const db = await startDevDb({ database: 'hotel_int', port: 55460, dataDir: '/scratch/work/hotel/server/.pgint' });
process.env.DATABASE_URL = db.url;
process.env.NODE_ENV = 'production';
process.env.JWT_ACCESS_SECRET = 'x'.repeat(40);
process.env.JWT_REFRESH_SECRET = 'y'.repeat(40);
process.env.LOG_LEVEL = 'silent';
const { migrate } = await import('../src/db/migrate.js');
await migrate();
const { runEtl } = await import('../src/etl/run.js');
await runEtl();
const { createApp } = await import('../src/app.js');
const app = createApp();
const server = app.listen(0);
await new Promise((r) => server.once('listening', r));
const port = server.address().port;
const base = `http://127.0.0.1:${port}`;
const call = async (p, opts = {}) => {
  const r = await fetch(base + p, { ...opts, headers: { 'Content-Type': 'application/json', ...(opts.headers || {}) } });
  return { status: r.status, body: r.status === 204 ? null : await r.json() };
};
const ok = (label, cond, extra = '') => console.log(`${cond ? 'PASS' : 'FAIL'}  ${label}${extra ? '  ' + extra : ''}`);

let r = await call('/api/health');
ok('GET /api/health', r.status === 200 && r.body.data.database === 'up');

r = await call('/api/properties?pageSize=50');
ok('GET /api/properties', r.status === 200 && r.body.data.length >= 14, `${r.body.data.length} properties`);

const prop = r.body.data[0];
r = await call(`/api/properties/${prop.id}`);
ok('GET /api/properties/:id', r.status === 200 && r.body.data.roomTypes.length > 0, `${r.body.data.roomTypes.length} room types`);

r = await call('/api/properties?q=Juhu');
ok('search filter', r.status === 200 && r.body.data.length === 1);

r = await call(`/api/rooms/availability?propertyId=${prop.id}&checkIn=2027-06-01&checkOut=2027-06-04`);
ok('availability', r.status === 200 && r.body.data.length > 0, `${r.body.data.length} types`);

const email = `smoke${Date.now()}@example.com`;
r = await call('/api/auth/signup', { method: 'POST', body: JSON.stringify({ email, password: 'Password12345', fullName: 'Smoke Guest' }) });
ok('POST /api/auth/signup', r.status === 201 && r.body.data.user.role === 'guest');

r = await call('/api/auth/login', { method: 'POST', body: JSON.stringify({ email, password: 'Password12345' }) });
ok('POST /api/auth/login', r.status === 200 && !!r.body.data.accessToken);
const guestToken = r.body.data.accessToken;
const refreshTok = r.body.data.refreshToken;

r = await call('/api/bookings', { method: 'POST', body: JSON.stringify({
  propertyId: prop.id, checkIn: '2027-06-01', checkOut: '2027-06-04', roomsBooked: 1, adults: 2,
  guest: { fullName: 'Smoke Guest', email } }) });
ok('POST /api/bookings (public)', r.status === 201, r.body.data?.reference || '');
const bookingRef = r.body.data?.reference;

r = await call('/api/bookings?pageSize=10', { headers: { Authorization: `Bearer ${guestToken}` } });
ok('GET /api/bookings (guest sees own)', r.status === 200 && r.body.data.some((b) => b.reference === bookingRef));

r = await call('/api/metrics?from=2026-01-01&to=2026-04-01', { headers: { Authorization: `Bearer ${guestToken}` } });
ok('guest blocked from metrics', r.status === 403);

r = await call('/api/auth/refresh', { method: 'POST', body: JSON.stringify({ refreshToken: refreshTok }) });
ok('POST /api/auth/refresh (rotation)', r.status === 200 && r.body.data.refreshToken !== refreshTok);

r = await call('/api/enquiries', { method: 'POST', body: JSON.stringify({ propertyId: prop.id, name: 'Enquirer', email: 'e@example.com', message: 'Do you have parking for a large car?' }) });
ok('POST /api/enquiries', r.status === 201);

r = await call('/api/properties', { method: 'POST', body: JSON.stringify({ code: 'NOPE', name: 'X' }) });
ok('unauthenticated write blocked', r.status === 401);

// admin
const { query } = await import('../src/db/pool.js');
const { hashPassword } = await import('../src/services/authService.js');
const adminEmail = `admin${Date.now()}@example.com`;
await query(`INSERT INTO users (email,password_hash,full_name,role) VALUES ($1,$2,'Admin','admin')`, [adminEmail, await hashPassword('Password12345')]);
r = await call('/api/auth/login', { method: 'POST', body: JSON.stringify({ email: adminEmail, password: 'Password12345' }) });
const adminToken = r.body.data.accessToken;
r = await call('/api/metrics?from=2026-01-01&to=2026-04-01&groupBy=month', { headers: { Authorization: `Bearer ${adminToken}` } });
ok('admin metrics', r.status === 200 && r.body.data.portfolio.roomNightsAvailable > 0,
   `occ ${(r.body.data.portfolio.occupancyRate * 100).toFixed(1)}%  ADR ₹${r.body.data.portfolio.adrInr}  RevPAR ₹${r.body.data.portfolio.revparInr}`);

r = await call('/api/metrics?from=2026-01-01&to=2026-04-01', { headers: { Authorization: `Bearer ${adminToken}` } });
const top = r.body.data.properties.sort((a, b) => b.revparInr - a.revparInr)[0];
console.log(`      best RevPAR: ${top.propertyName} — ₹${top.revparInr} (occ ${(top.occupancyRate * 100).toFixed(1)}%)`);

server.close();
const { closePool } = await import('../src/db/pool.js');
await closePool();
db.stop();
process.exit(0);
