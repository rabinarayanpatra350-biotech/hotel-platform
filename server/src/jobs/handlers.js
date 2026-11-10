import { sendMail } from '../lib/mailer.js';
import {
  bookingConfirmation, staffBookingAlert, enquiryAcknowledgement,
} from '../lib/emailTemplates.js';
import logger from '../lib/logger.js';

/**
 * The job type registry. A worker only ever dispatches to a function named here,
 * so an unknown job type fails loudly instead of being silently skipped.
 */
export const handlers = {
  /** Sends one email. The only job type that talks to the outside world. */
  async send_email(payload, job) {
    const { to, subject, text, html, template } = payload;
    if (!to || !subject) throw new Error('send_email requires "to" and "subject"');
    const out = await sendMail({ to, subject, text, html, template, jobId: job.id });
    return { to, template, providerId: out.providerId };
  },

  /** Composes and sends the guest's booking confirmation. */
  async booking_confirmation(payload) {
    const { subject, text, html } = bookingConfirmation(payload.booking);
    const out = await sendMail({
      to: payload.booking.guestEmail, subject, text, html,
      template: 'booking_confirmation', jobId: payload.jobId || null,
    });
    return { to: payload.booking.guestEmail, providerId: out.providerId };
  },

  /** Tells the front desk a booking came in. */
  async staff_booking_alert(payload) {
    const { subject, text, html } = staffBookingAlert(payload.booking);
    const out = await sendMail({
      to: payload.to, subject, text, html, template: 'staff_booking_alert', jobId: payload.jobId || null,
    });
    return { to: payload.to, providerId: out.providerId };
  },

  /** Acknowledges an enquiry. */
  async enquiry_acknowledgement(payload) {
    const { subject, text, html } = enquiryAcknowledgement(payload.enquiry);
    const out = await sendMail({
      to: payload.enquiry.email, subject, text, html,
      template: 'enquiry_acknowledgement', jobId: payload.jobId || null,
    });
    return { to: payload.enquiry.email, providerId: out.providerId };
  },

  /**
   * Stands in for the genuinely slow tasks this queue exists to absorb — a
   * nightly occupancy roll-up, a review digest, a rate sync with an OTA. It is
   * registered here so the queue is exercised by something other than email,
   * which is the point: the queue is not an email queue that happens to be
   * general, it is a general queue that happens to carry email.
   */
  async nightly_occupancy_rollup(payload) {
    logger.info({ payload }, 'occupancy rollup (placeholder handler)');
    return { rolledUp: true, from: payload.from, to: payload.to };
  },
};

export function getHandler(type) {
  const fn = handlers[type];
  if (!fn) throw new Error(`No handler registered for job type "${type}"`);
  return fn;
}
