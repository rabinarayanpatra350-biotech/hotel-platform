import { useState } from 'react';
import { Link, useNavigate, useLocation } from 'react-router-dom';
import { useAuth } from '../lib/auth.jsx';

export default function Login() {
  const { login } = useAuth();
  const navigate = useNavigate();
  const location = useLocation();
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState(null);
  const [busy, setBusy] = useState(false);

  async function onSubmit(e) {
    e.preventDefault();
    setBusy(true); setError(null);
    try {
      const user = await login(email, password);
      const dest = location.state?.from || (user.role === 'guest' ? '/my-bookings' : '/dashboard');
      navigate(dest, { replace: true });
    } catch (err) { setError(err.message); }
    finally { setBusy(false); }
  }

  return (
    <div className="container narrow">
      <form className="card stack" onSubmit={onSubmit}>
        <h1>Sign in</h1>
        {error && <div className="alert alert-error">{error}</div>}
        <label>Email<input type="email" value={email} required autoComplete="email"
          onChange={(e) => setEmail(e.target.value)} /></label>
        <label>Password<input type="password" value={password} required autoComplete="current-password"
          onChange={(e) => setPassword(e.target.value)} /></label>
        <button className="btn btn-primary" disabled={busy}>{busy ? 'Signing in…' : 'Sign in'}</button>
        <p className="muted small">No account? <Link to="/signup">Create one</Link>.</p>
      </form>
    </div>
  );
}
