import { Link, NavLink, useNavigate } from 'react-router-dom';
import { useAuth } from '../lib/auth.jsx';

export default function Nav() {
  const { user, isStaff, logout } = useAuth();
  const navigate = useNavigate();

  return (
    <header className="nav">
      <div className="nav-inner">
        <Link to="/" className="brand">
          <span className="brand-mark">MB</span>
          <span className="brand-text">Mumbai Boutique Hotels</span>
        </Link>
        <nav className="nav-links">
          <NavLink to="/" end>Stay</NavLink>
          {user && <NavLink to="/my-bookings">My bookings</NavLink>}
          {isStaff && <NavLink to="/dashboard">Dashboard</NavLink>}
          {isStaff && <NavLink to="/admin/properties">Properties</NavLink>}
          {isStaff && <NavLink to="/admin/enquiries">Enquiries</NavLink>}
        </nav>
        <div className="nav-auth">
          {user ? (
            <>
              <span className="who" title={user.email}>{user.fullName}</span>
              <button className="btn btn-ghost" onClick={async () => { await logout(); navigate('/'); }}>Sign out</button>
            </>
          ) : (
            <>
              <Link className="btn btn-ghost" to="/login">Sign in</Link>
              <Link className="btn btn-primary" to="/signup">Create account</Link>
            </>
          )}
        </div>
      </div>
    </header>
  );
}
