/**
 * Email bodies, as functions of their data.
 *
 * Kept as plain functions rather than a template engine: there are three of
 * them, they are short, and a dependency that renders HTML from user-supplied
 * strings is a bigger risk than the duplication it saves. Everything
 * interpolated here is escaped, because a guest's name is user input.
 */

const esc = (s) => String(s ?? '')
  .replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
  .replace(/"/g, '&quot;').replace(/'/g, '&#39;');

const inr = (n) => `INR ${Number(n || 0).toLocaleString('en-IN')}`;

const wrap = (title, bodyHtml) => `<!doctype html>
<html><body style="font-family:system-ui,-apple-system,Segoe UI,Roboto,sans-serif;color:#17202a;line-height:1.55">
  <div style="max-width:560px;margin:0 auto;padding:24px">
    <div style="border-bottom:3px solid #14532d;padding-bottom:12px;margin-bottom:20px">
      <strong style="font-size:18px;color:#14532d">Mumbai Boutique Hotels</strong>
    </div>
    <h1 style="font-size:20px;margin:0 0 12px">${title}</h1>
    ${bodyHtml}
    <p style="margin-top:28px;font-size:12px;color:#6b7a88">
      This is a portfolio project. No real booking has been made.
    </p>
  </div>
</body></html>`;

const plain = (lines) => lines.join('\n');

export function bookingConfirmation(b) {
  const subject = `Your booking is confirmed — ${b.reference}`;
  const text = plain([
    `Dear ${b.guestName},`, '',
    `Thank you for booking ${b.propertyName}.`, '',
    `Reference:  ${b.reference}`,
    `Check-in:   ${b.checkIn}`,
    `Check-out:  ${b.checkOut}`,
    `Nights:     ${b.nights}`,
    `Rooms:      ${b.roomsBooked}`,
    `Total:      ${inr(b.rateInr)}`, '',
    'We look forward to welcoming you.', '',
    'Mumbai Boutique Hotels',
  ]);
  const html = wrap('Your booking is confirmed', `
    <p>Dear ${esc(b.guestName)},</p>
    <p>Thank you for booking <strong>${esc(b.propertyName)}</strong>.</p>
    <table style="border-collapse:collapse;margin:16px 0">
      ${[['Reference', esc(b.reference)], ['Check-in', esc(b.checkIn)], ['Check-out', esc(b.checkOut)],
         ['Nights', esc(b.nights)], ['Rooms', esc(b.roomsBooked)], ['Total', inr(b.rateInr)]]
        .map(([k, v]) => `<tr><td style="padding:4px 16px 4px 0;color:#6b7a88">${k}</td><td><strong>${v}</strong></td></tr>`)
        .join('')}
    </table>
    <p>We look forward to welcoming you.</p>`);
  return { subject, text, html };
}

export function staffBookingAlert(b) {
  const subject = `New booking — ${b.propertyName} (${b.reference})`;
  const text = plain([
    'A new booking has been received.', '',
    `Property:  ${b.propertyName}`,
    `Reference: ${b.reference}`,
    `Guest:     ${b.guestName} <${b.guestEmail}>`,
    `Dates:     ${b.checkIn} to ${b.checkOut} (${b.nights} nights)`,
    `Rooms:     ${b.roomsBooked}`,
    `Total:     ${inr(b.rateInr)}`,
    `Source:    ${b.source}`,
  ]);
  const html = wrap('New booking received', `
    <p><strong>${esc(b.propertyName)}</strong> — ${esc(b.reference)}</p>
    <p>${esc(b.guestName)} &lt;${esc(b.guestEmail)}&gt;<br>
    ${esc(b.checkIn)} to ${esc(b.checkOut)} (${esc(b.nights)} nights), ${esc(b.roomsBooked)} room(s)<br>
    ${inr(b.rateInr)} · source ${esc(b.source)}</p>`);
  return { subject, text, html };
}

export function enquiryAcknowledgement(e) {
  const subject = 'We have received your enquiry';
  const text = plain([
    `Dear ${e.name},`, '',
    'Thank you for getting in touch. Our front desk will reply within one working day.', '',
    `Your message: "${e.message}"`, '',
    'Mumbai Boutique Hotels',
  ]);
  const html = wrap('We have received your enquiry', `
    <p>Dear ${esc(e.name)},</p>
    <p>Thank you for getting in touch. Our front desk will reply within one working day.</p>
    <blockquote style="border-left:3px solid #e2e8ee;margin:16px 0;padding-left:12px;color:#4a5a68">
      ${esc(e.message)}</blockquote>`);
  return { subject, text, html };
}
