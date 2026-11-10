import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  server: {
    port: 5173,
    // In development the API runs separately; proxying keeps the browser on one
    // origin so cookies and CORS behave exactly as they will in production.
    proxy: { '/api': { target: process.env.VITE_API_URL || 'http://localhost:4000', changeOrigin: true } },
  },
  build: { outDir: 'dist', sourcemap: false },
});
