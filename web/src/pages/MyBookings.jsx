import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { apiGet, inr } from '../lib/api.js';

export default function MyBookings() {
  const [bookings, setBookings] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    apiGet('/api/bookings?pageSize=50')
      .then(setBookings)
      .catch((e) => setError(e.message))
      .finally(() => setLoading(false));
  }, []);

  return (
    <div className="container">
      <h1>My bookings</h1>
      {error && <div className="alert alert-error">{error}</div>}
      {loading && <p className="muted">Loading…</p>}
      {!loading && !bookings.length && (
        <div className="card">
          <p>You have no bookings yet.</p>
          <Link className="btn btn-primary" to="/">Find a property</Link>
        </div>
      )}
      {bookings.length > 0 && (
        <table className="table">
          <thead>
            <tr><th>Reference</th><th>Property</th><th>Dates</th><th>Nights</th><th>Total</th><th>Status</th></tr>
          </thead>
          <tbody>
            {bookings.map((b) => (
              <tr key={b.id}>
                <td><code>{b.reference}</code></td>
                <td>{b.propertyName}</td>
                <td>{b.checkIn} → {b.checkOut}</td>
                <td>{b.nights}</td>
                <td>{inr(b.rateInr)}</td>
                <td><span className={`pill pill-${b.status}`}>{b.status.replace('_', ' ')}</span></td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  );
}
