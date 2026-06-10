# Backend Setup

The app uses Express and MongoDB for products, customers, and purchase history.

## Run locally

1. Start MongoDB.
2. Run `npm install`.
3. Run `npm start`.
4. Open `http://localhost:3000`.

The site must be opened through the Express server at `http://localhost:3000`.
Do not use VS Code Live Server (commonly `http://localhost:5500`) or open
`index.html` directly. Static preview servers cannot handle `/api` login,
customer, product, or purchase requests and will return `404` or `405`.

Without an `.env` file, the server connects to:

```text
mongodb://127.0.0.1:27017/forbo_product
```

To use MongoDB Atlas or another database, copy `.env.example` to `.env` and set:

```text
MONGODB_URI=your-mongodb-connection-string
PORT=3000
```

The browser synchronizes the full product catalog when the app loads. Saving an
advanced quote updates the customer record and creates a purchase-history entry.

## Restart after backend changes

If the server was already running when `server.js` changed, stop it with
`Ctrl+C`, run `npm start` again, and refresh `http://localhost:3000`.
