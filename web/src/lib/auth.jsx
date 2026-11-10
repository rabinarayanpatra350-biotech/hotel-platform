import { createContext, useContext, useEffect, useMemo, useState } from 'react';
import { api, apiPost, setAccessToken, getAccessToken } from './api.js';

const AuthContext = createContext(null);

export function AuthProvider({ children }) {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);

  // On first paint, try to resume a session from the refresh cookie. This is what
  // makes a page reload feel like a reload rather than a logout.
  useEffect(() => {
    let alive = true;
    (async () => {
      try {
        if (getAccessToken()) {
          const me = await api('/api/auth/me');
          if (alive) setUser(me.user);
        } else {
          const r = await fetch(`${import.meta.env.VITE_API_URL || ''}/api/auth/refresh`, {
            method: 'POST', credentials: 'include',
            headers: { 'Content-Type': 'application/json' }, body: '{}',
          });
          if (r.ok) {
            const body = await r.json();
            setAccessToken(body.data.accessToken);
            if (alive) setUser(body.data.user);
          }
        }
      } catch { /* stay logged out */ }
      if (alive) setLoading(false);
    })();
    return () => { alive = false; };
  }, []);

  const value = useMemo(() => ({
    user,
    loading,
    isStaff: user?.role === 'staff' || user?.role === 'admin',
    isAdmin: user?.role === 'admin',
    async login(email, password) {
      const data = await apiPost('/api/auth/login', { email, password });
      setAccessToken(data.accessToken);
      setUser(data.user);
      return data.user;
    },
    async signup(email, password, fullName) {
      await apiPost('/api/auth/signup', { email, password, fullName });
      return value.login(email, password);
    },
    async logout() {
      try { await apiPost('/api/auth/logout', {}); } catch { /* already gone */ }
      setAccessToken(null);
      setUser(null);
    },
  }), [user, loading]);

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

export const useAuth = () => useContext(AuthContext);
