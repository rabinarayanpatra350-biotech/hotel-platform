import { useEffect, useState } from 'react';
import { apiGet, apiPatch } from '../lib/api.js';

export default function AdminEnquiries() {
  const [items, setItems] = useState([]);
  const [filter, setFilter] = useState('');
  const [error, setError] = useState(null);

  const load = () => {
    const qs = filter ? `&status=${filter}` : '';
    apiGet(`/api/enquiries?pageSize=50${qs}`).then(setItems).catch((e) => setError(e.message));
  };
  useEffect(() => { load(); }, [filter]);

  async function setStatus(id, status) {
    try { await apiPatch(`/api/enquiries/${id}`, { status }); await load(); }
    catch (err) { setError(err.message); }
  }

  return (
    <div className="container">
      <div className="section-head">
        <h1>Enquiries</h1>
        <select value={filter} onChange={(e) => setFilter(e.target.value)} aria-label="Filter by status">
          <option value="">All</option>
          <option value="new">New</option>
          <option value="contacted">Contacted</option>
          <option value="closed">Closed</option>
        </select>
      </div>
      {error && <div className="alert alert-error">{error}</div>}
      {!items.length && <p className="muted">No enquiries yet.</p>}
      {items.map((e) => (
        <article className="card" key={e.id}>
          <div className="section-head">
            <div>
              <strong>{e.name}</strong> <span className="muted small">{e.email}</span>
              {e.propertyName && <span className="muted small"> · {e.propertyName}</span>}
            </div>
            <span className={`pill pill-${e.status}`}>{e.status}</span>
          </div>
          <p>{e.message}</p>
          <div className="actions">
            {['new', 'contacted', 'closed'].map((s) => (
              <button key={s} className="btn btn-small" disabled={e.status === s}
                onClick={() => setStatus(e.id, s)}>Mark {s}</button>
            ))}
          </div>
        </article>
      ))}
    </div>
  );
}
