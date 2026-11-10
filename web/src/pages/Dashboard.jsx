import { useEffect, useState } from 'react';
import { apiGet, inr, pct } from '../lib/api.js';

const iso = (d) => d.toISOString().slice(0, 10);
const daysAgo = (n) => { const d = new Date(); d.setDate(d.getDate() - n); return iso(d); };

/**
 * Occupancy, ADR and RevPAR.
 *
 * The three numbers are computed server-side in one place (metricsService.js) so
 * that this page, the API tests and the written report can never disagree. The
 * dashboard's only job is to present them.
 */
export default function Dashboard() {
  const [from, setFrom] = useState(daysAgo(90));
  const [to, setTo] = useState(iso(new Date()));
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    setLoading(true);
    apiGet(`/api/metrics?from=${from}&to=${to}&groupBy=month`)
      .then((d) => { setData(d); setError(null); })
      .catch((e) => setError(e.message))
      .finally(() => setLoading(false));
  }, [from, to]);

  const p = data?.portfolio;
  const rows = data?.properties || [];
  const months = data?.months || [];
  const peak = Math.max(1, ...months.map((m) => m.revenueInr));

  return (
    <div className="container">
      <div className="section-head">
        <h1>Portfolio dashboard</h1>
        <div className="row-form">
          <label>From<input type="date" value={from} onChange={(e) => setFrom(e.target.value)} /></label>
          <label>To<input type="date" value={to} onChange={(e) => setTo(e.target.value)} /></label>
        </div>
      </div>

      {error && <div className="alert alert-error">{error}</div>}
      {loading && <p className="muted">Calculating…</p>}

      {p && !loading && (
        <>
          <div className="kpis">
            <div className="kpi">
              <span className="kpi-label">Occupancy</span>
              <strong className="kpi-value">{pct(p.occupancyRate)}</strong>
              <span className="kpi-sub">{p.roomNightsSold} of {p.roomNightsAvailable} room-nights</span>
            </div>
            <div className="kpi">
              <span className="kpi-label">ADR</span>
              <strong className="kpi-value">{inr(p.adrInr)}</strong>
              <span className="kpi-sub">average daily rate</span>
            </div>
            <div className="kpi">
              <span className="kpi-label">RevPAR</span>
              <strong className="kpi-value">{inr(p.revparInr)}</strong>
              <span className="kpi-sub">revenue per available room</span>
            </div>
            <div className="kpi">
              <span className="kpi-label">Room revenue</span>
              <strong className="kpi-value">{inr(p.revenueInr)}</strong>
              <span className="kpi-sub">{data.window.nights} nights</span>
            </div>
          </div>

          {months.length > 0 && (
            <section className="card">
              <h2>Revenue by month</h2>
              <div className="bars">
                {months.map((m) => (
                  <div className="bar-row" key={m.month}>
                    <span className="bar-label">{m.month}</span>
                    <div className="bar-track">
                      <div className="bar-fill" style={{ width: `${(m.revenueInr / peak) * 100}%` }} />
                    </div>
                    <span className="bar-value">{inr(m.revenueInr)}</span>
                  </div>
                ))}
              </div>
            </section>
          )}

          <section className="card">
            <h2>By property</h2>
            <table className="table">
              <thead>
                <tr>
                  <th>Property</th><th className="num">Rooms</th><th className="num">Sold</th>
                  <th className="num">Occupancy</th><th className="num">ADR</th>
                  <th className="num">RevPAR</th><th className="num">Revenue</th>
                </tr>
              </thead>
              <tbody>
                {rows.map((r) => (
                  <tr key={r.propertyId}>
                    <td>{r.propertyName} <span className="muted small">{r.propertyCode}</span></td>
                    <td className="num">{r.roomsAvailable}</td>
                    <td className="num">{r.roomNightsSold}</td>
                    <td className="num">{pct(r.occupancyRate)}</td>
                    <td className="num">{inr(r.adrInr)}</td>
                    <td className="num">{inr(r.revparInr)}</td>
                    <td className="num">{inr(r.revenueInr)}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </section>
        </>
      )}
    </div>
  );
}
