import { describe, it, beforeAll, afterAll } from 'vitest';
import { expect } from 'vitest';
import puppeteer from 'puppeteer-core';

const LAUNCH_OPTIONS = {
  executablePath: process.env.CHROME_BIN || '/usr/bin/chromium-browser',
  args: ['--no-sandbox', '--disable-setuid-sandbox', '--disable-gpu', '--headless', '--disable-dev-shm-usage'],
};

let browser;

beforeAll(async () => {
  browser = await puppeteer.launch(LAUNCH_OPTIONS);
}, 30_000);

afterAll(async () => {
  await browser?.close();
});

describe('Puppeteer integration', () => {
  it('renders HTML and reads content', async () => {
    const page = await browser.newPage();
    await page.setContent('<h1>Hello Docker Puppeteer</h1>');
    const text = await page.evaluate(() => document.querySelector('h1').textContent);
    expect(text).toBe('Hello Docker Puppeteer');
    await page.close();
  });

  it('takes a screenshot (valid PNG)', async () => {
    const page = await browser.newPage();
    await page.setContent('<h1>Screenshot Test</h1>');
    const screenshot = await page.screenshot();
    // PNG magic bytes: 0x89 0x50 0x4E 0x47
    expect(screenshot.length).toBeGreaterThan(0);
    expect(screenshot[0]).toBe(0x89);
    expect(screenshot[1]).toBe(0x50); // P
    expect(screenshot[2]).toBe(0x4e); // N
    expect(screenshot[3]).toBe(0x47); // G
    await page.close();
  });
});

describe('PDF generation (core use case)', () => {
  it('generates a valid PDF from HTML', async () => {
    const page = await browser.newPage();
    await page.setContent(`
      <html>
        <head><style>body { font-family: DejaVu Sans, sans-serif; }</style></head>
        <body>
          <h1>Invoice #12345</h1>
          <p>Date: 2024-01-01</p>
          <table border="1" cellpadding="5">
            <tr><th>Item</th><th>Qty</th><th>Price</th></tr>
            <tr><td>Widget</td><td>10</td><td>$99.90</td></tr>
            <tr><td>Gadget</td><td>5</td><td>$49.95</td></tr>
          </table>
          <p><strong>Total: $149.85</strong></p>
        </body>
      </html>
    `);
    const pdf = await page.pdf({ format: 'A4', printBackground: true });
    const header = Buffer.from(pdf).subarray(0, 5).toString();

    expect(pdf.length).toBeGreaterThan(0);
    expect(header).toBe('%PDF-');
    await page.close();
  });

  it('generates a PDF with CJK characters and emoji', async () => {
    const page = await browser.newPage();
    await page.setContent(`
      <html>
        <body>
          <h1>CJK Font Test</h1>
          <p>Japanese: こんにちは世界</p>
          <p>Chinese: 你好世界</p>
          <p>Korean: 안녕하세요 세계</p>
          <p>Emoji: 🎉🚀✅</p>
        </body>
      </html>
    `);
    const pdf = await page.pdf({ format: 'A4' });

    expect(pdf.length).toBeGreaterThan(0);
    await page.close();
  });
});
