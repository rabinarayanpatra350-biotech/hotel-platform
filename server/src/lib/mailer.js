import { query } from '../db/pool.js';
import logger from './logger.js';
import config from '../config/index.js';

/**
 * Email delivery, with three transports.
 *
 *   console  — development. Writes the email to the log so you can see exactly
 *              what a guest would receive without a mail server.
 *   record   — tests. Records the email and sends nothing.
 *   smtp     — production. Real delivery via nodemailer.
 *
 * The transport is chosen by configuration, never by a code change, and every
 * attempt is written to `email_log` whatever the outcome — so "we told this
 * guest" is a queryable fact rather than an assumption.
 */

let smtpTransport = null;

async function getSmtpTransport() {
  if (smtpTransport) return smtpTransport;
  const nodemailer = (await import('nodemailer')).default;
  smtpTransport = nodemailer.createTransport({
    host: config.mail.host,
    port: config.mail.port,
    secure: config.mail.secure,
    auth: config.mail.user ? { user: config.mail.user, pass: config.mail.password } : undefined,
  });
  return smtpTransport;
}

export function transportName() {
  return config.mail.transport;
}

export async function sendMail({ to, subject, text, html, template = 'generic', jobId = null }) {
  const transport = transportName();
  let providerId = null;
  let error = null;

  try {
    if (transport === 'smtp') {
      const tx = await getSmtpTransport();
      const info = await tx.sendMail({ from: config.mail.from, to, subject, text, html });
      providerId = info.messageId || null;
    } else if (transport === 'console') {
      logger.info({ to, subject, template }, 'email (console transport)');
      // eslint-disable-next-line no-console
      console.log(`\n─── email to ${to} ───\nSubject: ${subject}\n\n${text}\n──────────────────────\n`);
    }
    // 'record' does nothing: the log row below is the record.
  } catch (err) {
    error = err;
  }

  await query(
    `INSERT INTO email_log (job_id, to_address, subject, template, status, provider, provider_id, error)
     VALUES ($1,$2,$3,$4,$5,$6,$7,$8)`,
    [jobId, to, subject, template, error ? 'failed' : 'sent', transport, providerId,
      error ? String(error.message).slice(0, 500) : null],
  );

  if (error) throw error;
  return { providerId, transport };
}
