import { Navigate, useLocation } from 'react-router-dom';
import { useAuth } from '../lib/auth.jsx';

/**
 * Guards a route in the UI. This is a convenience, not a security boundary — the
 * API enforces every rule again on its own, because anyone can edit the bundle
 * or call the endpoint directly.
 */
export default function ProtectedRoute({ children, staffOnly = false }) {
  const { user, loading, isStaff } = useAuth();
  const location = useLocation();

  if (loading) return <div className="container"><p className="muted">Checking your session…</p></div>;
  if (!user) return <Navigate to="/login" state={{ from: location.pathname }} replace />;
  if (staffOnly && !isStaff) {
    return (
      <div className="container">
        <div className="card"><h2>Staff access only</h2>
          <p className="muted">Your account does not have access to this area. Ask an administrator if you need it.</p>
        </div>
      </div>
    );
  }
  return children;
}
