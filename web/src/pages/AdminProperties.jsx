import { useEffect, useState } from 'react';
import { apiGet, apiPost, apiPatch, apiDelete, api } from '../lib/api.js';
import { useAuth } from '../lib/auth.jsx';

export default function AdminProperties() {
  const { isAdmin } = useAuth();
  const [properties, setProperties] = useState([]);
  const [error, setError] = useState(null);
  const [notice, setNotice] = useState(null);
  const [form, setForm] = useState({ code: '', name: '', starRating: 4, description: '' });
  const [busy, setBusy] = useState(false);

  const load = () => apiGet('/api/properties?pageSize=100').then(setProperties).catch((e) => setError(e.message));
  useEffect(() => { load(); }, []);

  async function create(e) {
    e.preventDefault();
    setBusy(true); setError(null); setNotice(null);
    try {
      await apiPost('/api/properties', { ...form, starRating: Number(form.starRating) });
      setNotice(`Created ${form.code}.`);
      setForm({ code: '', name: '', starRating: 4, description: '' });
      await load();
    } catch (err) {
      const detail = err.details?.length ? `: ${err.details.map((d) => d.message).join('; ')}` : '';
      setError(`${err.message}${detail}`);
    } finally { setBusy(false); }
  }

  async function toggleActive(p) {
    try {
      await apiPatch(`/api/properties/${p.id}`, { isActive: !p.isActive });
      await load();
    } catch (err) { setError(err.message); }
  }

  async function remove(p) {
    if (!window.confirm(`Delete ${p.name}? This cannot be undone.`)) return;
    try { await apiDelete(`/api/properties/${p.id}`); await load(); }
    catch (err) { setError(err.message); }
  }

  async function uploadImage(p, file) {
    if (!file) return;
    setError(null);
    try {
      const fd = new FormData();
      fd.append('file', file);
      await api(`/api/media?entityType=property&entityId=${p.id}`, { method: 'POST', body: fd });
      setNotice(`Image uploaded for ${p.name}.`);
    } catch (err) { setError(err.message); }
  }

  return (
    <div className="container">
      <h1>Properties</h1>
      {error && <div className="alert alert-error">{error}</div>}
      {notice && <div className="alert alert-success">{notice}</div>}

      <form className="card row-form" onSubmit={create}>
        <label>Code<input value={form.code} required placeholder="MUM-XXX"
          onChange={(e) => setForm({ ...form, code: e.target.value.toUpperCase() })} /></label>
        <label>Name<input value={form.name} required minLength={3}
          onChange={(e) => setForm({ ...form, name: e.target.value })} /></label>
        <label>Stars<select value={form.starRating} onChange={(e) => setForm({ ...form, starRating: e.target.value })}>
          {[1, 2, 3, 4, 5].map((n) => <option key={n} value={n}>{n}</option>)}
        </select></label>
        <button className="btn btn-primary" disabled={busy}>{busy ? 'Saving…' : 'Add property'}</button>
      </form>

      <table className="table">
        <thead><tr><th>Code</th><th>Name</th><th>Stars</th><th className="num">Rooms</th><th>Active</th><th>Image</th><th /></tr></thead>
        <tbody>
          {properties.map((p) => (
            <tr key={p.id}>
              <td><code>{p.code}</code></td>
              <td>{p.name}</td>
              <td>{'★'.repeat(p.starRating || 0)}</td>
              <td className="num">{p.totalRooms}</td>
              <td>{p.isActive ? 'Yes' : 'No'}</td>
              <td>
                <input type="file" accept="image/png,image/jpeg,image/webp"
                  onChange={(e) => uploadImage(p, e.target.files?.[0])} />
              </td>
              <td className="actions">
                <button className="btn btn-small" onClick={() => toggleActive(p)}>
                  {p.isActive ? 'Deactivate' : 'Activate'}
                </button>
                {isAdmin && <button className="btn btn-small btn-danger" onClick={() => remove(p)}>Delete</button>}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
