import { describe, it, expect } from 'vitest';
import {
  bookingConfirmation, staffBookingAlert, enquiryAcknowledgement,
} from '../../src/lib/emailTemplates.js';

const booking = {
  reference: 'MUM-ABC123-XY',
  propertyName: 'Juhu Sands',
  guestName: 'Asha Rao',
  guestEmail: 'asha@example.com',
  checkIn: '2027-06-01',
  checkOut: '2027-06-04',
  nights: 3,
  roomsBooked: 2,
  rateInr: 51000,
  source: 'website',
};

describe('bookingConfirmation', () => {
  it('puts the reference, property and total in the subject and body', () => {
    const { subject, text, html } = bookingConfirmation(booking);
    expect(subject).toContain('MUM-ABC123-XY');
    expect(text).toContain('Juhu Sands');
    expect(text).toContain('Asha Rao');
    expect(html).toContain('MUM-ABC123-XY');
  });

  it('formats money the Indian way', () => {
    const { text } = bookingConfirmation(booking);
    // 51000 must render with a lakh-style grouping, not "51,000" the US way —
    // here it is the same, but 150000 must be 1,50,000.
    expect(text).toContain('51,000');
    const big = bookingConfirmation({ ...booking, rateInr: 150000 });
    expect(big.text).toContain('1,50,000');
  });

  it('escapes a guest name that contains HTML', () => {
    const { html } = bookingConfirmation({ ...booking, guestName: '<script>alert(1)</script>' });
    expect(html).not.toContain('<script>');
    expect(html).toContain('&lt;script&gt;');
  });
});

describe('staffBookingAlert', () => {
  it('includes the guest contact details the front desk needs', () => {
    const { subject, text } = staffBookingAlert(booking);
    expect(subject).toContain('Juhu Sands');
    expect(text).toContain('asha@example.com');
    expect(text).toContain('website');
  });
});

describe('enquiryAcknowledgement', () => {
  it('quotes the guest message back, escaped', () => {
    const { text, html } = enquiryAcknowledgement({
      name: 'Ravi', email: 'ravi@example.com', message: 'Do you have parking?',
    });
    expect(text).toContain('Do you have parking?');
    const xss = enquiryAcknowledgement({ name: 'R', email: 'r@e.com', message: '<img onerror=x>' });
    expect(xss.html).not.toContain('<img');
  });

  it('never renders an undefined into the body', () => {
    const { text } = enquiryAcknowledgement({ name: 'Ravi', email: 'r@e.com', message: 'Hi there' });
    expect(text).not.toContain('undefined');
  });
});
