# Forbo Movement Systems Sales Portal

An internal sales workspace for selecting Forbo Movement Systems products, reviewing customer purchase history, configuring conveyor components, and preparing quote request data.

The interface is visually aligned with the Forbo Movement Systems website through its red, charcoal, white, and light-gray palette; strong editorial typography; clean industrial layout; and restrained use of product imagery. This repository is an independent internal application and does not copy the public website's source code.

## Purpose

The portal gives a sales representative one place to:

- Authenticate before accessing customer or commercial information.
- Start a record for a new customer.
- Look up an existing customer by exact company name or email.
- Autofill stored company, contact, address, application, and customer-number details.
- Review recent purchase and quote history.
- Browse and compare Siegling Prolink product series.
- Configure products, dimensions, materials, colors, quantities, and notes.
- Prepare Fullsan quote data and run a pull-force estimate.
- Save purchases to MongoDB.
- Print or export a quote packet as JSON.
- Open the included product-range and engineering reference files.

## User Flow

1. Open the portal and sign in as an authorized sales representative.
2. Choose **New customer** or **Lookup customer**.
3. For a lookup, enter the exact stored company name or email.
4. Continue to the product and quote workspace.
5. Complete or verify customer requirements.
6. Select a belt series, application needs, and suitable products.
7. Configure selected products.
8. Open **Configure Advanced Quote** to complete quote and engineering fields.
9. Save the customer purchase, print it, or download the JSON record.
10. Sign out when finished.

## Technology

- Node.js
- Express 5
- MongoDB with Mongoose
- Vanilla HTML, CSS, and JavaScript
- Cookie-based, HMAC-signed sales sessions

No frontend build step is required.

## Requirements

- Node.js 20 or newer
- npm
- MongoDB Community Server or MongoDB Atlas

## Local Setup

1. Install dependencies:

   ```powershell
   npm install
   ```

2. Copy `.env.example` to `.env`:

   ```powershell
   Copy-Item .env.example .env
   ```

3. Edit `.env` with a MongoDB connection, a strong session secret, and one or more sales-representative accounts.

4. Start MongoDB if using a local database.

5. Run the application:

   ```powershell
   npm start
   ```

6. Open `http://localhost:3000`.

Always open the application through `http://localhost:3000`. VS Code Live
Server and other static preview extensions cannot serve the authentication API
and will return `404` or `405` during login.

For automatic server restarts while editing:

```powershell
npm run dev
```

## Environment Variables

| Variable | Required | Description |
| --- | --- | --- |
| `MONGODB_URI` | Production | MongoDB connection string. Defaults to `mongodb://127.0.0.1:27017/forbo_product` locally. |
| `PORT` | No | HTTP port. Defaults to `3000`. |
| `NODE_ENV` | Production | Set to `production` in a deployed environment. |
| `SESSION_SECRET` | Production | Long random value used to sign session cookies. |
| `SESSION_HOURS` | No | Session lifetime in hours. Defaults to `8`. |
| `SALES_REPS_JSON` | Production | JSON array of authorized representative records. |

Example:

```dotenv
MONGODB_URI=mongodb://127.0.0.1:27017/forbo_product
PORT=3000
NODE_ENV=development
SESSION_SECRET=replace-with-at-least-32-random-characters
SESSION_HOURS=8
SALES_REPS_JSON=[{"name":"Jordan Lee","email":"jordan.lee@example.com","phone":"+1 555 010 1000","password":"replace-this-password"}]
```

`SALES_REPS_JSON` must remain valid JSON on one line.

### Local Demo Login

When `NODE_ENV` is not `production` and `SALES_REPS_JSON` is not set, the server provides a local-only demonstration account:

```text
Email: sales@forbo.local
Password: ForboDemo123!
```

Do not use the demonstration account in a deployed environment.

## Authentication and Security

- Login responses set an `HttpOnly` session cookie.
- Cookies use `SameSite=Strict`.
- Production cookies use the `Secure` flag.
- Sessions expire after the configured number of hours.
- API routes for products, customers, and purchases require authentication.
- Login attempts are limited per IP address.
- Purchase records use the authenticated representative identity supplied by the server, not editable browser data.
- Production startup fails if no representatives are configured or the default development session secret is still in use.

The current account configuration is appropriate for a small internal deployment. A larger rollout should replace environment-stored passwords with company SSO or an identity provider, hashed credentials, centralized rate limiting, audit logging, and managed secrets.

## Customer Lookup

Customer records are stored in MongoDB and can be retrieved using:

- Exact normalized company name, or
- Exact lowercase email address.

A successful lookup fills:

- Company
- Customer contact
- Phone
- Email
- Address
- Application
- Customer number

The workspace also displays up to 20 recent purchases, with the five newest summarized in the customer panel.

## Data Model

### Products

Catalog products include series, category, application fit, materials, temperature limits, brochure references, images, and configurable traits. The browser synchronizes the bundled catalog to MongoDB after a representative signs in.

### Customers

Customers include company and normalized company names, contact information, address, application, customer number, and latest purchase date.

### Purchases

Purchases link a customer to the authenticated salesperson, project information, requested delivery details, configured products, quote fields, and source workbook.

## API Summary

| Method | Route | Purpose |
| --- | --- | --- |
| `POST` | `/api/auth/login` | Authenticate a sales representative. |
| `GET` | `/api/auth/me` | Restore the current session. |
| `POST` | `/api/auth/logout` | Clear the current session. |
| `GET` | `/api/health` | Report server and database status. |
| `GET` | `/api/products` | Return synchronized products. |
| `POST` | `/api/products/sync` | Synchronize the bundled catalog. |
| `GET` | `/api/customers/search` | Find a customer and recent purchases. |
| `POST` | `/api/purchases` | Create or update a customer and save a purchase. |

Except for health and authentication endpoints, API routes require a valid session.

## Reference and Generated Files

- `engineering-data.js` contains generated engineering product data.
- `scripts/generate_engineering_data.py` regenerates engineering data from source material.
- `scripts/extract_brochure_assets.py` extracts brochure imagery.
- `scripts/extract_excel_quote.py` extracts workbook structures and VBA references.
- `assets/` contains product, range, page, and engineering-manual images.
- The included PDF and workbook files are source references for product and quote workflows.
- `CATALOG_NOTES.md` and `EXCEL_CALC_VERIFICATION.md` describe catalog and calculation work.

Generated files should only be regenerated from trusted source documents and reviewed before committing.

## Testing

Run JavaScript syntax checks:

```powershell
npm test
```

Recommended manual smoke test:

1. Verify a bad password is rejected.
2. Sign in with a configured account.
3. Confirm both customer options are visible.
4. Start a new customer and verify blank customer fields.
5. Save a configured purchase with MongoDB connected.
6. Return to customer lookup and verify the saved record autofills.
7. Confirm the purchase history appears.
8. Sign out and verify protected API calls return `401`.
9. Check desktop and mobile layouts.

## Deployment

1. Provision a persistent MongoDB database.
2. Set all production environment variables.
3. Use HTTPS through the hosting platform or reverse proxy.
4. Run `npm install --omit=dev`.
5. Start with `npm start`.
6. Restrict access to the intended company network or identity layer.
7. Back up MongoDB and monitor authentication failures and server errors.

The server currently stores rate-limit counters in memory. Multi-instance production deployments should use a shared rate-limit store.

## Troubleshooting

### MongoDB is disconnected

Confirm MongoDB is running and `MONGODB_URI` is correct. The login can still load, but catalog synchronization, customer lookup, and purchase saving return `503` until the database connects.

### No representatives are configured

Set a valid `SALES_REPS_JSON` value. Production mode intentionally refuses to start without it.

### Login works locally but not after deployment

Confirm the site uses HTTPS, `NODE_ENV=production`, `SESSION_SECRET` is set, and the browser accepts the secure cookie.

### Login returns 404 or 405

The page is being served by an old Node process or a static preview server.
Stop and restart the backend with `npm start`, then open
`http://localhost:3000` rather than a Live Server URL such as
`http://localhost:5500`.

### Customer lookup returns no result

Lookup currently expects the exact company name or email stored on the customer record. Check spelling, spacing, and the saved email.

## Repository Hygiene

The repository ignores:

- `node_modules/`
- `.env`
- npm debug logs

Never commit real passwords, session secrets, MongoDB credentials, customer exports, or other confidential business data.

## Brand and Legal Note

Forbo, Siegling, Fullsan, and associated product names and materials belong to their respective owners. Confirm authorization and brand-guideline compliance before public distribution. The public Forbo website was used only as a visual reference for this internal portal.

## License

The package currently declares the ISC license. Confirm the intended organizational license before external distribution.
