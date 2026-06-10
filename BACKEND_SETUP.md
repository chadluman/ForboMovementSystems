# Backend Setup

The app uses Express and MongoDB for products, customers, and purchase history.

## Run locally

1. Start MongoDB.
2. Run `npm install`.
3. Run `npm start`.
4. Open `http://localhost:3000`.

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
