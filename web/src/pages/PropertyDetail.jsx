import { useEffect, useMemo, useState } from 'react';
import { useParams } from 'react-router-dom';
import { apiGet, apiPost, inr } from '../lib/api.js';

const today = () => new Date().toISOString().slice(0, 10);
const plusDays = (n) => { const d = new Date(); d.setDate(d.getDate() + n); return d.toISOString().slice(0, 10); };

export default function PropertyDetail() {
  const { id } = useParams();
  const [property, setProperty] = useState(null);
  const [reviews, setReviews] = useState([]);
  const [error, setError] = useState(null);

  const [checkIn, setCheckIn] = useState(plusDays(7));
  const [checkOut, setCheckOut] = useState(plusDays(10));
  const [availability, setAvailability] = useState([]);
  const [checking, setChecking] = useState(false);

  const [selected, setSelected] = useState(null);
  const [guest, setGuest] = useState({ fullName: '', email: '', phone: '' });
  const [booking, setBooking] = useState(null);
  const [bookingError, setBookingError] = useState(null);
  const [submitting, setSubmitting] = useState(false);

  const [enquiry, setEnquiry] = useState({ name: '', email: '', message: '' });
  const [enquirySent, setEnquirySent] = useState(false);

  useEffect(() => {
    apiGet(`/api/properties/${id}`).then(setProperty).catch((e) => setError(e.message));
    apiGet(`/api/reviews?propertyId=${id}&pageSize=6`).then(setReviews).catch(() => {});
  }, [id]);

  const nights = useMemo(() => {
    const n = (Date.parse(checkOut) - Date.parse(checkIn)) / 86400000;
    return Number.isFinite(n) && n > 0 ? n : 0;
  }, [checkIn, checkOut]);

  async function checkAvailability(e) {
    e?.preventDefault();
    setChecking(true); setBookingError(null);
    try {
      const data = await apiGet(
        `/api/rooms/availability?propertyId=${id}&checkIn=${checkIn}&checkOut=${checkOut}`,
      );
      setAvailability(data);
    } catch (err) { setBookingError(err.message); }
    finally { setChecking(false); }
  }

  async function submitBooking(e) {
    e.preventDefault();
    setBookingError(null); setSubmitting(true);
    try {
      const data = await apiPost('/api/bookings', {
        propertyId: id,
        checkIn, checkOut,
        roomsBooked: 1,
        adults: 2,
        guest,
      });
      setBooking(data);
    } catch (err) {
      // Field-level messages come back from the same zod schema the form uses.
      const detail = err.details?.length ? ` (${err.details.map((d) => d.message).join('; ')})` : '';
      setBookingError(`${err.message}${detail}`);
    } finally { setSubmitting(false); }
  }

  async function submitEnquiry(e) {
    e.preventDefault();
    try {
      await apiPost('/api/enquiries', { propertyId: id, ...enquiry });
      setEnquirySent(true);
      setEnquiry({ name: '', email: '', message: '' });
    } catch (err) {
      const detail = err.details?.length ? `: ${err.details.map((d) => d.message).join('; ')}` : '';
      setError(`${err.message}${detail}`);
    }
  }

  if (error && !property) return <div className="container"><div className="alert alert-error">{error}</div></div>;
  if (!property) return <div className="container"><p className="muted">Loading…</p></div>;

  return (
    <div className="container">
      <div className="detail-head">
        <div>
          <span className="badge">{property.code}</span>
          <h1>{property.name}</h1>
          <p className="muted">{property.city} · {property.starRating}★ · {property.totalRooms} rooms
            {property.avgRating != null && <> · ★ {Number(property.avgRating).toFixed(1)} from {property.reviewCount} reviews</>}
          </p>
        </div>
      </div>
      {property.description && <p className="lede">{property.description}</p>}

      <div className="two-col">
        <section className="card">
          <h2>Check availability</h2>
          <form className="row-form" onSubmit={checkAvailability}>
            <label>Check in
              <input type="date" value={checkIn} min={today()} onChange={(e) => setCheckIn(e.target.value)} required />
            </label>
            <label>Check out
              <input type="date" value={checkOut} min={checkIn} onChange={(e) => setCheckOut(e.target.value)} required />
            </label>
            <button className="btn btn-primary" disabled={checking || nights < 1}>
              {checking ? 'Checking…' : `Check ${nights || 0} night${nights === 1 ? '' : 's'}`}
            </button>
          </form>

          {nights < 1 && <p className="alert alert-error">Check-out must be after check-in.</p>}

          {availability.length > 0 && (
            <table className="table">
              <thead><tr><th>Room type</th><th>Sleeps</th><th>Per night</th><th>Free</th><th /></tr></thead>
              <tbody>
                {availability.map((r) => (
                  <tr key={r.roomTypeId}>
                    <td><strong>{r.name}</strong></td>
                    <td>{r.maxOccupancy}</td>
                    <td>{inr(r.baseRateInr)}</td>
                    <td>{r.roomsFree}</td>
                    <td>
                      <button className="btn btn-small" disabled={!r.isAvailable}
                        onClick={() => setSelected(r)}>
                        {r.isAvailable ? 'Select' : 'Sold out'}
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}

          {selected && !booking && (
            <form className="stack" onSubmit={submitBooking}>
              <h3>Book the {selected.name}</h3>
              <p className="muted">{nights} night{nights === 1 ? '' : 's'} · {inr(selected.baseRateInr * nights)} estimated</p>
              <label>Full name<input value={guest.fullName} required minLength={2}
                onChange={(e) => setGuest({ ...guest, fullName: e.target.value })} /></label>
              <label>Email<input type="email" value={guest.email} required
                onChange={(e) => setGuest({ ...guest, email: e.target.value })} /></label>
              <label>Phone (optional)<input value={guest.phone}
                onChange={(e) => setGuest({ ...guest, phone: e.target.value })} /></label>
              {bookingError && <div className="alert alert-error">{bookingError}</div>}
              <button className="btn btn-primary" disabled={submitting}>
                {submitting ? 'Booking…' : 'Confirm booking'}
              </button>
            </form>
          )}

          {booking && (
            <div className="alert alert-success">
              <strong>Booked.</strong> Your reference is <code>{booking.reference}</code> —
              {' '}{booking.nights} nights, {inr(booking.rateInr)}.
            </div>
          )}
        </section>

        <aside className="card">
          <h2>Send an enquiry</h2>
          {enquirySent && <div className="alert alert-success">Thank you — the property will be in touch.</div>}
          <form className="stack" onSubmit={submitEnquiry}>
            <label>Your name<input value={enquiry.name} required minLength={2}
              onChange={(e) => setEnquiry({ ...enquiry, name: e.target.value })} /></label>
            <label>Email<input type="email" value={enquiry.email} required
              onChange={(e) => setEnquiry({ ...enquiry, email: e.target.value })} /></label>
            <label>Message<textarea rows={4} value={enquiry.message} required minLength={10}
              onChange={(e) => setEnquiry({ ...enquiry, message: e.target.value })} /></label>
            <button className="btn btn-primary">Send enquiry</button>
          </form>
        </aside>
      </div>

      {reviews.length > 0 && (
        <section className="card">
          <h2>What guests say</h2>
          <ul className="reviews">
            {reviews.map((r) => (
              <li key={r.id}>
                <div className="review-head">
                  <span className="stars">{'★'.repeat(r.rating)}{'☆'.repeat(5 - r.rating)}</span>
                  {r.title && <strong>{r.title}</strong>}
                </div>
                <p>{r.body}</p>
                <p className="muted small">— {r.guestName || 'A guest'}</p>
              </li>
            ))}
          </ul>
        </section>
      )}
    </div>
  );
}
