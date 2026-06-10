const path = require("path");
const crypto = require("crypto");
const express = require("express");
const mongoose = require("mongoose");
require("dotenv").config();

const app = express();
const port = Number(process.env.PORT) || 3000;
const mongoUri = process.env.MONGODB_URI || "mongodb://127.0.0.1:27017/forbo_product";
const sessionSecret = process.env.SESSION_SECRET || "development-only-change-this-secret";
const sessionHours = Number(process.env.SESSION_HOURS) || 8;
const isProduction = process.env.NODE_ENV === "production";
const loginAttempts = new Map();

function configuredSalesReps() {
  try {
    const reps = JSON.parse(process.env.SALES_REPS_JSON || "[]");
    if (Array.isArray(reps) && reps.length) return reps;
  } catch (error) {
    console.error(`SALES_REPS_JSON could not be parsed: ${error.message}`);
  }

  if (!isProduction) {
    return [{
      name: "Demo Sales Representative",
      email: "sales@forbo.local",
      phone: "+1 704 948 0800",
      password: "ForboDemo123!"
    }];
  }
  return [];
}

const salesReps = configuredSalesReps();

app.use(express.json({ limit: "5mb" }));

const productSchema = new mongoose.Schema({
  catalogId: { type: String, required: true, unique: true, index: true },
  seriesId: { type: String, index: true },
  title: { type: String, required: true, index: true },
  category: String,
  opening: String,
  bestFit: String,
  description: String,
  materials: String,
  temperature: String,
  notes: String,
  page: mongoose.Schema.Types.Mixed,
  image: String,
  sourceImage: String,
  tags: [String],
  traits: {
    materials: [String],
    colors: [String],
    sizes: [String]
  }
}, { timestamps: true });

const customerSchema = new mongoose.Schema({
  company: { type: String, required: true, trim: true, index: true },
  normalizedCompany: { type: String, required: true, index: true },
  rep: String,
  phone: String,
  email: { type: String, trim: true, lowercase: true, index: true },
  address: String,
  application: String,
  customerNumber: String,
  lastPurchaseAt: Date
}, { timestamps: true });

customerSchema.index({ normalizedCompany: 1, email: 1 });

const purchaseSchema = new mongoose.Schema({
  customer: { type: mongoose.Schema.Types.ObjectId, ref: "Customer", required: true, index: true },
  salesperson: {
    name: String,
    phone: String,
    email: String
  },
  project: String,
  requestedDate: String,
  desiredDelivery: String,
  products: [{
    productId: String,
    product: String,
    category: String,
    configuration: String,
    quantity: String,
    notes: String,
    source: String
  }],
  quote: mongoose.Schema.Types.Mixed,
  sourceWorkbook: String
}, { timestamps: true });

const Product = mongoose.model("Product", productSchema);
const Customer = mongoose.model("Customer", customerSchema);
const Purchase = mongoose.model("Purchase", purchaseSchema);

function databaseReady(req, res, next) {
  if (mongoose.connection.readyState === 1) return next();
  return res.status(503).json({
    error: "MongoDB is not connected. Set MONGODB_URI in .env and restart the server."
  });
}

function normalizeCompany(value) {
  return String(value || "").trim().toLowerCase().replace(/\s+/g, " ");
}

function parseCookies(req) {
  return String(req.headers.cookie || "").split(";").reduce((cookies, pair) => {
    const index = pair.indexOf("=");
    if (index === -1) return cookies;
    cookies[pair.slice(0, index).trim()] = decodeURIComponent(pair.slice(index + 1).trim());
    return cookies;
  }, {});
}

function safeEqual(left, right) {
  const leftBuffer = Buffer.from(String(left));
  const rightBuffer = Buffer.from(String(right));
  return leftBuffer.length === rightBuffer.length && crypto.timingSafeEqual(leftBuffer, rightBuffer);
}

function signSession(rep) {
  const payload = Buffer.from(JSON.stringify({
    name: rep.name,
    email: rep.email,
    phone: rep.phone || "",
    exp: Date.now() + sessionHours * 60 * 60 * 1000
  })).toString("base64url");
  const signature = crypto.createHmac("sha256", sessionSecret).update(payload).digest("base64url");
  return `${payload}.${signature}`;
}

function readSession(req) {
  const token = parseCookies(req).forbo_session;
  if (!token) return null;
  const [payload, signature] = token.split(".");
  if (!payload || !signature) return null;
  const expected = crypto.createHmac("sha256", sessionSecret).update(payload).digest("base64url");
  if (!safeEqual(signature, expected)) return null;
  try {
    const session = JSON.parse(Buffer.from(payload, "base64url").toString("utf8"));
    return session.exp > Date.now() ? session : null;
  } catch {
    return null;
  }
}

function requireAuth(req, res, next) {
  const session = readSession(req);
  if (!session) return res.status(401).json({ error: "Your sales session has expired. Please sign in again." });
  req.salesRep = session;
  next();
}

app.post("/api/auth/login", (req, res) => {
  const key = req.ip || "unknown";
  const attempt = loginAttempts.get(key) || { count: 0, resetAt: Date.now() + 15 * 60 * 1000 };
  if (Date.now() > attempt.resetAt) {
    attempt.count = 0;
    attempt.resetAt = Date.now() + 15 * 60 * 1000;
  }
  if (attempt.count >= 8) {
    return res.status(429).json({ error: "Too many sign-in attempts. Please wait 15 minutes and try again." });
  }

  const email = String(req.body.email || "").trim().toLowerCase();
  const password = String(req.body.password || "");
  const rep = salesReps.find((candidate) => String(candidate.email).toLowerCase() === email);
  if (!rep || !safeEqual(password, rep.password)) {
    attempt.count += 1;
    loginAttempts.set(key, attempt);
    return res.status(401).json({ error: "The email or password is incorrect." });
  }

  loginAttempts.delete(key);
  res.cookie("forbo_session", signSession(rep), {
    httpOnly: true,
    sameSite: "strict",
    secure: isProduction,
    maxAge: sessionHours * 60 * 60 * 1000,
    path: "/"
  });
  res.json({ rep: { name: rep.name, email: rep.email, phone: rep.phone || "" } });
});

app.get("/api/auth/me", requireAuth, (req, res) => {
  res.json({ rep: req.salesRep });
});

app.post("/api/auth/logout", (req, res) => {
  res.clearCookie("forbo_session", { httpOnly: true, sameSite: "strict", secure: isProduction, path: "/" });
  res.status(204).end();
});

app.get("/api/health", (req, res) => {
  res.json({
    ok: true,
    database: mongoose.connection.readyState === 1 ? "connected" : "disconnected"
  });
});

app.get("/api/products", requireAuth, databaseReady, async (req, res, next) => {
  try {
    const products = await Product.find().sort({ seriesId: 1, category: 1, title: 1 }).lean();
    res.json(products);
  } catch (error) {
    next(error);
  }
});

app.post("/api/products/sync", requireAuth, databaseReady, async (req, res, next) => {
  try {
    const catalog = Array.isArray(req.body.products) ? req.body.products : [];
    if (!catalog.length) return res.status(400).json({ error: "No products supplied." });

    const operations = catalog
      .filter((product) => product.id && product.title)
      .map((product) => ({
        updateOne: {
          filter: { catalogId: product.id },
          update: {
            $set: {
              catalogId: product.id,
              seriesId: product.seriesId,
              title: product.title,
              category: product.category,
              opening: product.opening,
              bestFit: product.bestFit,
              description: product.description,
              materials: product.materials,
              temperature: product.temperature,
              notes: product.notes,
              page: product.page,
              image: product.image,
              sourceImage: product.sourceImage,
              tags: product.tags || [],
              traits: product.traits || {}
            }
          },
          upsert: true
        }
      }));

    const result = await Product.bulkWrite(operations, { ordered: false });
    res.json({
      total: operations.length,
      inserted: result.upsertedCount,
      updated: result.modifiedCount
    });
  } catch (error) {
    next(error);
  }
});

app.get("/api/customers/search", requireAuth, databaseReady, async (req, res, next) => {
  try {
    const company = normalizeCompany(req.query.company);
    const email = String(req.query.email || "").trim().toLowerCase();
    if (!company && !email) {
      return res.status(400).json({ error: "Enter a company or email." });
    }

    const filters = [];
    if (company) filters.push({ normalizedCompany: company });
    if (email) filters.push({ email });
    const customer = await Customer.findOne({ $or: filters }).lean();
    if (!customer) return res.json({ customer: null, purchases: [] });

    const purchases = await Purchase.find({ customer: customer._id })
      .sort({ createdAt: -1 })
      .limit(20)
      .lean();
    res.json({ customer, purchases });
  } catch (error) {
    next(error);
  }
});

app.post("/api/purchases", requireAuth, databaseReady, async (req, res, next) => {
  try {
    const data = req.body;
    const company = String(data.customer?.company || "").trim();
    const email = String(data.customer?.email || "").trim().toLowerCase();
    if (!company) return res.status(400).json({ error: "Customer company is required." });
    if (!Array.isArray(data.configuredProducts) || !data.configuredProducts.length) {
      return res.status(400).json({ error: "Configure at least one product before saving." });
    }

    const normalizedCompany = normalizeCompany(company);
    const lookup = email ? { normalizedCompany, email } : { normalizedCompany, email: { $in: ["", null] } };
    let customer = await Customer.findOne(lookup);
    if (!customer) {
      customer = new Customer({ company, normalizedCompany, email });
    }

    Object.assign(customer, {
      company,
      normalizedCompany,
      rep: data.customer.rep,
      phone: data.customer.phone,
      email,
      address: data.customer.address,
      application: data.customer.application,
      customerNumber: data.customer.number,
      lastPurchaseAt: new Date()
    });
    await customer.save();

    const purchase = await Purchase.create({
      customer: customer._id,
      salesperson: {
        name: req.salesRep.name,
        phone: req.salesRep.phone,
        email: req.salesRep.email
      },
      project: data.quote?.project,
      requestedDate: data.quote?.requestedDate,
      desiredDelivery: data.quote?.desiredDelivery,
      products: data.configuredProducts,
      quote: data.quote || {},
      sourceWorkbook: data.sourceWorkbook
    });

    res.status(201).json({
      customerId: customer._id,
      purchaseId: purchase._id,
      savedAt: purchase.createdAt
    });
  } catch (error) {
    next(error);
  }
});

app.use(express.static(__dirname));

app.use((error, req, res, next) => {
  console.error(error);
  if (res.headersSent) return next(error);
  res.status(error.name === "ValidationError" ? 400 : 500).json({
    error: error.message || "The request could not be completed."
  });
});

async function start() {
  if (isProduction && sessionSecret === "development-only-change-this-secret") {
    throw new Error("SESSION_SECRET must be set in production.");
  }
  if (!salesReps.length) {
    throw new Error("No sales representatives are configured. Set SALES_REPS_JSON.");
  }
  if (!isProduction && !process.env.SALES_REPS_JSON) {
    console.warn("Using the local demo login: sales@forbo.local / ForboDemo123!");
  }
  try {
    await mongoose.connect(mongoUri);
    console.log("MongoDB connected.");
  } catch (error) {
    console.error(`MongoDB connection failed: ${error.message}`);
  }

  app.listen(port, () => {
    console.log(`Forbo catalog running at http://localhost:${port}`);
  });
}

start();
