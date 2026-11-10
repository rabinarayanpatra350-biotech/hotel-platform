/**
 * One fetch wrapper for the whole app.
 *
 * It attaches the access token, unwraps the API's { data } envelope, and — the
 * part that matters — retries once on a 401 after refreshing. Because the access
 * token lives 15 minutes, a long-lived dashboard session would otherwise start
 * failing with no explanation. The refresh is single-flight: several requests
 * failing at once must trigger one refresh, not one each, or they invalidate
 * each other's rotated token.
 */
const BASE = import.meta.env.VITE_API_URL || '';

let accessToken = sessionStorage.getItem('accessToken') || null;
let refreshing = null;

export const setAccessToken = (t) => {
  accessToken = t;
  if (t) sessionStorage.setItem('accessToken', t);
  else sessionStorage.removeItem('accessToken');
};
export const getAccessToken = () => accessToken;

class ApiError extends Error {
  constructor(status, payload) {
    super(payload?.error?.message || `Request failed (${status})`);
    this.status = status;
    this.code = payload?.error?.code;
    this.details = payload?.error?.details || [];
  }
}
export { ApiError };

async function refreshToken() {
  if (!refreshing) {
    refreshing = fetch(`${BASE}/api/auth/refresh`, {
      method: 'POST',
      credentials: 'include',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({}),
    })
      .then(async (r) => {
        if (!r.ok) return null;
        const body = await r.json();
        setAccessToken(body.data.accessToken);
        return body.data.accessToken;
      })
      .catch(() => null)
      .finally(() => { refreshing = null; });
  }
  return refreshing;
}

export async function api(path, { method = 'GET', body, headers = {}, raw = false, retry = true } = {}) {
  const opts = {
    method,
    credentials: 'include',
    headers: { ...headers },
  };
  if (accessToken) opts.headers.Authorization = `Bearer ${accessToken}`;
  if (body instanceof FormData) {
    opts.body = body; // let the browser set the multipart boundary
  } else if (body !== undefined) {
    opts.headers['Content-Type'] = 'application/json';
    opts.body = JSON.stringify(body);
  }

  const res = await fetch(`${BASE}${path}`, opts);

  if (res.status === 401 && retry && !path.startsWith('/api/auth/')) {
    const fresh = await refreshToken();
    if (fresh) return api(path, { method, body, headers, raw, retry: false });
    setAccessToken(null);
  }

  if (res.status === 204) return null;

  const payload = await res.json().catch(() => ({}));
  if (!res.ok) throw new ApiError(res.status, payload);
  return raw ? payload : payload.data;
}

export const apiGet = (p) => api(p);
export const apiPost = (p, body) => api(p, { method: 'POST', body });
export const apiPatch = (p, body) => api(p, { method: 'PATCH', body });
export const apiDelete = (p) => api(p, { method: 'DELETE' });

/** Formats paise-free rupees the way an Indian hotel would print them. */
export const inr = (n) =>
  new Intl.NumberFormat('en-IN', { style: 'currency', currency: 'INR', maximumFractionDigits: 0 })
    .format(Number(n) || 0);

export const pct = (n) => `${(Number(n || 0) * 100).toFixed(1)}%`;
