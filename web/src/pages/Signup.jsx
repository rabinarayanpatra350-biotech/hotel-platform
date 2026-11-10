import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../lib/auth.jsx';

export default function Signup() {
  const { signup } = useAuth();
  const navigate = useNavigate();
  const [form, setForm] = useState({ fullName: '', email: '', password: '' });
  const [error, setError] = useState(null);
  const [busy, setBusy] = useState(false);

  // Mirrors the server's zod rule so the user sees the problem before the round trip.
  const weakPassword = form.password.length > 0 &&
    (form.password.length < 10 || !/[a-zA-Z]/.test(form.password) || !/[0-9]/.test(form.password));

  async function onSubmit(e) {
    e.preventDefault();
    setBusy(true); setError(null);
    try {
      await signup(form.email, form.password, form.fullName);
      navigate('/my-bookings', { replace: true });
    } catch (err) {
      const detail = err.details?.length ? `: ${err.details.map((d) => d.message).join('; ')}` : '';
      setError(`${err.message}${detail}`);
    } finally { setBusy(false); }
  }

  return (
    <div className="container narrow">
      <form className="card stack" onSubmit={onSubmit}>
        <h1>Create your account</h1>
        {error && <div className="alert alert-error">{error}</div>}
        <label>Full name<input value={form.fullName} required minLength={2}
          onChange={(e) => setForm({ ...form, fullName: e.target.value })} /></label>
        <label>Email<input type="email" value={form.email} required autoComplete="email"
          onChange={(e) => setForm({ ...form, email: e.target.value })} /></label>
        <label>Password
          <input type="password" value={form.password} required autoComplete="new-password"
            onChange={(e) => setForm({ ...form, password: e.target.value })} />
        </label>
        <p className="muted small">At least 10 characters, with a letter and a number.</p>
        {weakPassword && <div className="alert alert-error">That password is too weak.</div>}
        <button className="btn btn-primary" disabled={busy || weakPassword}>
          {busy ? 'Creating…' : 'Create account'}
        </button>
        <p className="muted small">Already registered? <Link to="/login">Sign in</Link>.</p>
      </form>
    </div>
  );
}
