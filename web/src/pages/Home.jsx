import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { apiGet } from '../lib/api.js';

export default function Home() {
  const [properties, setProperties] = useState([]);
  const [q, setQ] = useState('');
  const [minStar, setMinStar] = useState('');
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const controller = new AbortController();
    setLoading(true);
    const params = new URLSearchParams({ pageSize: '50' });
    if (q.trim()) params.set('q', q.trim());
    if (minStar) params.set('minStar', minStar);
    const t = setTimeout(() => {
      apiGet(`/api/properties?${params}`)
        .then((data) => { setProperties(data); setError(null); })
        .catch((e) => setError(e.message))
        .finally(() => setLoading(false));
    }, 250); // debounce so a typed query does not fire per keystroke
    return () => { controller.abort(); clearTimeout(t); };
  }, [q, minStar]);

  return (
    <>
      <section className="hero">
        <div className="container">
          <h1>Fourteen boutique properties. One city that never sits still.</h1>
          <p className="hero-sub">Book direct for the best rate — no commission, no middleman.</p>
          <div className="search-bar">
            <input
              type="search" placeholder="Search by name or area — try Juhu, Worli, Bandra…"
              value={q} onChange={(e) => setQ(e.target.value)} aria-label="Search properties"
            />
            <select value={minStar} onChange={(e) => setMinStar(e.target.value)} aria-label="Minimum star rating">
              <option value="">Any rating</option>
              <option value="5">5 star</option>
              <option value="4">4 star and up</option>
              <option value="3">3 star and up</option>
            </select>
          </div>
        </div>
      </section>

      <section className="container">
        <div className="section-head">
          <h2>Our properties</h2>
          {!loading && <span className="muted">{properties.length} shown</span>}
        </div>

        {error && <div className="alert alert-error">{error}</div>}
        {loading && <p className="muted">Loading properties…</p>}
        {!loading && !properties.length && <p className="muted">No properties match that search.</p>}

        <div className="grid">
          {properties.map((p) => (
            <Link key={p.id} to={`/properties/${p.id}`} className="card property-card">
              <div className="property-card-top">
                <span className="badge">{p.code}</span>
                <span className="stars" aria-label={`${p.starRating} star`}>{'★'.repeat(p.starRating || 0)}</span>
              </div>
              <h3>{p.name}</h3>
              <p className="muted">{p.city}</p>
              <div className="property-card-foot">
                <span>{p.totalRooms} rooms</span>
                {p.avgRating != null && <span>★ {Number(p.avgRating).toFixed(1)} ({p.reviewCount})</span>}
              </div>
            </Link>
          ))}
        </div>
      </section>
    </>
  );
}
