import { Link } from 'react-router-dom';

export default function NotFound() {
  return (
    <div className="container narrow card">
      <h1>Page not found</h1>
      <p className="muted">That page does not exist.</p>
      <Link className="btn btn-primary" to="/">Back to the properties</Link>
    </div>
  );
}
