


# 🗄️🤖 SQL & GenAI Course
**🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost**

---

## 📋 1-MODULE4-CTO-REPORT-SOLUTIONS – Intelligent Transportation Planet

This document contains **two different approaches** to the CTO Report. Use them to compare techniques, understand trade-offs, and deepen your mastery.

---

## 🌌 SQLVerse Check-In

<div style="border-left: 4px solid #9c27b0; background-color: #f3e5f5; padding: 15px; margin: 20px 0; border-radius: 0 8px 8px 0;">

**The laws of reverse engineering are no longer mysteries to you. You have the keys.** Two paths lead to the same destination – a normalized, future-proof schema. Choose the one that fits your context.

**The difference between a coder and an Artisan is discipline.**

</div>

---

### 📍 Your Current Stage

```mermaid
flowchart LR
    Ex0["✅ Ex0 Solutions"] --> Ex1["✅ Ex1 Solutions"]
    Ex1 --> Ex2["✅ Ex2 Solutions"]
    Ex2 --> Ex3["✅ Ex3 Solutions"]
    Ex3 --> Ex4["✅ Ex4 Solutions"]
    Ex4 --> Ex5["✅ Ex5 Solutions"]
    Ex5 --> CTO["📍 CTO SOLUTIONS<br/>1-MODULE4-CTO-REPORT-SOLUTIONS<br/>YOU ARE HERE"]
    CTO --> CEO["⏳ CEO SOLUTIONS<br/>2-MODULE4-CEO-REPORT-SOLUTIONS"]
    CEO --> CFO["⏳ CFO SOLUTIONS<br/>3-MODULE4-CFO-REPORT-SOLUTIONS"]
    CFO --> Quiz["⏳ Quiz Answers<br/>module4-quiz-answers.md"]
    Quiz --> Complete["🎉 MODULE 4 COMPLETE"]
    
    style Ex0 fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style Ex1 fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style Ex2 fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style Ex3 fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style Ex4 fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style Ex5 fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style CTO fill:#fff8e1,stroke:#ff9800,stroke-width:4px
    style CEO fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style CFO fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style Quiz fill:#e8f5e8,stroke:#4caf50,stroke-width:2px
    style Complete fill:#a5d6a7,stroke:#2e7d32,stroke-width:2px
```

---

## 🧭 The Artisan's Reverse Engineering Framework

Before diving into the two solution approaches, understand the **methodology** that powers both.

```mermaid
flowchart LR
    A["📄 DISCOVERY<br/>Steps 1-3"] --> B["🧩 STRUCTURE<br/>Steps 4-6"]
    B --> C["🧼 NORMALIZE<br/>Steps 7-9"]
    C --> D["✅ VALIDATE<br/>Steps 10-11"]
    
    style A fill:#e1f5fe,stroke:#2196f3
    style B fill:#fff8e1,stroke:#ff9800
    style C fill:#e8f5e8,stroke:#4caf50
    style D fill:#f3e5f5,stroke:#9c27b0
```

### 11 Steps to Derive a Schema from Reports

| Step | Action | Key Question |
|------|--------|--------------|
| **1** | 📄 **Inventory the Reports** | What is the purpose, granularity, and filters of each report? |
| **2** | 🧩 **Extract All Fields** | What columns exist? What are the data types and sample values? |
| **3** | 🔁 **Identify Common Fields** | Which columns link across reports? (e.g., license plate) |
| **4** | 🧱 **Group into Entities** | What "things" do these fields describe? (Customer, Order, Product) |
| **5** | 🔗 **Identify Relationships** | Is it 1:N or M:N? Where do foreign keys belong? |
| **6** | 📊 **Determine Granularity** | Is this per transaction, per customer, per day? Don't mix levels. |
| **7** | 🧮 **Identify Derived vs Stored** | Totals, averages, KPIs → derived. Don't store them. |
| **8** | 🧼 **Normalize the Schema** | Aim for 3NF – remove duplicates, split repeating groups |
| **9** | 🧱 **Define Keys & Constraints** | PK, FK, unique constraints for each table |
| **10** | 🧪 **Validate Against Reports** | Can your schema reproduce all 5 reports? |
| **11** | 🧾 **Create Final ER Diagram** | Visualize entities, relationships, cardinality |

---

### 💡 The Artisan's Mental Model

> **Reports** = “What business wants to see”  
> **Schema** = “What the system needs to store”

Your job is to **reconstruct the underlying transactional truth** – not just copy the report structure.

---

### ⚠️ Common Mistakes to Avoid

| Mistake | Why It's Wrong |
|---------|----------------|
| Treating report columns as final schema | Reports are aggregated; schema must be atomic |
| Ignoring granularity differences | Mixing levels creates anomalies |
| Storing calculated fields | Totals and averages belong in queries, not tables |
| Over-normalizing too early | Start with entities, then refine |

---

## Approach 1: The Minimalist Schema (Normalized, 5 Tables)

**Philosophy:** Keep it simple. Each table represents one core entity. License plate is the golden key.

### Key Decisions
- One `vehicles` table as the master reference
- No separate `locations` table – store location as text
- `transactions` table handles all revenue streams via `type` column
- Simpler JOINs at query time

### Schema

```sql
-- Master vehicles table (the golden key)
CREATE TABLE vehicles (
    license_plate TEXT PRIMARY KEY,
    vehicle_class TEXT,
    first_seen_date DATE
);

-- Unified transactions table (all revenue streams)
CREATE TABLE transactions (
    transaction_id INTEGER PRIMARY KEY,
    license_plate TEXT,
    transaction_type TEXT, -- 'toll', 'cafe', 'fuel', 'repair'
    transaction_date DATETIME,
    amount REAL,
    metadata TEXT, -- JSON or pipe-delimited for type-specific data
    FOREIGN KEY (license_plate) REFERENCES vehicles(license_plate)
);

-- Repair-specific details (only for repair transactions)
CREATE TABLE repair_details (
    repair_id INTEGER PRIMARY KEY,
    transaction_id INTEGER,
    service_type TEXT,
    labor_cost REAL,
    parts_cost REAL,
    status TEXT,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id)
);

-- Stores (convenience store – no license plate link)
CREATE TABLE stores (
    store_id INTEGER PRIMARY KEY,
    sku TEXT,
    item_description TEXT,
    quantity_sold INTEGER,
    unit_price REAL,
    sale_date DATE
);

-- Date dimension (for time-series analysis)
CREATE TABLE date_dim (
    date_id INTEGER PRIMARY KEY,
    full_date DATE,
    year INTEGER,
    month INTEGER,
    quarter INTEGER,
    week INTEGER
);
```

### Key Queries

**Revenue Leak Query (Maintenance Bypass):**

```sql
SELECT r.license_plate
FROM repair_details rd
JOIN transactions r ON rd.transaction_id = r.transaction_id
LEFT JOIN transactions t ON r.license_plate = t.license_plate 
    AND t.transaction_type = 'toll'
    AND DATE(t.transaction_date) = DATE(r.transaction_date)
WHERE t.transaction_id IS NULL;
```

**Wallet Share Query:**

```sql
SELECT 
    v.license_plate,
    SUM(t.amount) AS total_spend
FROM vehicles v
JOIN transactions t ON v.license_plate = t.license_plate
WHERE t.transaction_type IN ('toll', 'repair')
GROUP BY v.license_plate
ORDER BY total_spend DESC;
```

### Trade-Offs

| Strength | Weakness |
|----------|----------|
| Fewer tables – easier to understand | Mixed transaction types require careful filtering |
| Unified transaction view simplifies reporting | Metadata column can become messy |
| License plate as master key is elegant | Repair-specific fields need separate table |
| Simple JOINs for cross-domain queries | Cannot enforce type-specific constraints |

### Best For
- Small to medium datasets
- Teams that prefer fewer tables
- Rapid prototyping and MVPs

---

## Approach 2: The Enterprise Schema (Domain-Driven, 8 Tables)

**Philosophy:** Model the domain explicitly. Each revenue stream gets its own table. No generic columns. Foreign keys enforce integrity.

### Key Decisions
- Separate tables for each revenue stream (toll, cafe, fuel, repair)
- Normalized to 3NF with clear foreign keys
- Store table remains separate (no license plate)
- Robust referential integrity

### Schema

```sql
-- Vehicles master table
CREATE TABLE vehicles (
    vehicle_id INTEGER PRIMARY KEY,
    license_plate TEXT UNIQUE NOT NULL,
    vehicle_class TEXT NOT NULL
);

-- Toll transactions
CREATE TABLE toll_transactions (
    toll_id INTEGER PRIMARY KEY,
    vehicle_id INTEGER NOT NULL,
    timestamp DATETIME NOT NULL,
    lane_id TEXT NOT NULL,
    gate_num TEXT NOT NULL,
    fee_collected REAL NOT NULL,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);

-- Cafe orders
CREATE TABLE cafe_orders (
    order_id INTEGER PRIMARY KEY,
    vehicle_id INTEGER NOT NULL,
    timestamp DATETIME NOT NULL,
    item_name TEXT NOT NULL,
    category TEXT NOT NULL,
    amount REAL NOT NULL,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);

-- Repair tickets
CREATE TABLE repair_tickets (
    ticket_id INTEGER PRIMARY KEY,
    vehicle_id INTEGER NOT NULL,
    timestamp DATETIME NOT NULL,
    service_type TEXT NOT NULL,
    labor_cost REAL NOT NULL,
    parts_cost REAL NOT NULL,
    status TEXT NOT NULL,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);

-- Fuel transactions
CREATE TABLE fuel_transactions (
    fuel_id INTEGER PRIMARY KEY,
    vehicle_id INTEGER NOT NULL,
    timestamp DATETIME NOT NULL,
    pump_id TEXT NOT NULL,
    fuel_type TEXT NOT NULL,
    liters REAL NOT NULL,
    price_per_liter REAL NOT NULL,
    total_value REAL NOT NULL,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);

-- Convenience store (no vehicle link)
CREATE TABLE store_sales (
    sale_id INTEGER PRIMARY KEY,
    sale_date DATE NOT NULL,
    sku TEXT NOT NULL,
    item_description TEXT NOT NULL,
    quantity_sold INTEGER NOT NULL,
    unit_price REAL NOT NULL,
    total_revenue REAL NOT NULL
);

-- Date dimension (for time-series)
CREATE TABLE date_dim (
    date_id INTEGER PRIMARY KEY,
    full_date DATE NOT NULL,
    year INTEGER NOT NULL,
    month INTEGER NOT NULL,
    quarter INTEGER NOT NULL
);
```

### Key Queries

**Revenue Leak Query (Maintenance Bypass):**

```sql
SELECT v.license_plate
FROM repair_tickets rt
JOIN vehicles v ON rt.vehicle_id = v.vehicle_id
LEFT JOIN toll_transactions tt ON v.vehicle_id = tt.vehicle_id 
    AND DATE(rt.timestamp) = DATE(tt.timestamp)
WHERE tt.toll_id IS NULL;
```

**Wallet Share Query:**

```sql
SELECT 
    v.license_plate,
    COALESCE(tt.total_toll, 0) + COALESCE(rt.total_repair, 0) AS total_spend
FROM vehicles v
LEFT JOIN (
    SELECT vehicle_id, SUM(fee_collected) AS total_toll
    FROM toll_transactions
    GROUP BY vehicle_id
) tt ON v.vehicle_id = tt.vehicle_id
LEFT JOIN (
    SELECT vehicle_id, SUM(labor_cost + parts_cost) AS total_repair
    FROM repair_tickets
    GROUP BY vehicle_id
) rt ON v.vehicle_id = rt.vehicle_id
WHERE COALESCE(tt.total_toll, 0) + COALESCE(rt.total_repair, 0) > 0
ORDER BY total_spend DESC;
```

### Trade-Offs

| Strength | Weakness |
|----------|----------|
| Clear domain separation – each table has a single purpose | More tables – steeper learning curve |
| Strong referential integrity | Cross-domain queries require multiple JOINs |
| No generic columns – type safety | More complex aggregation queries |
| Easier to add new revenue streams (new table) | Subqueries or CTEs needed for wallet share |

### Best For
- Enterprise systems with strict data governance
- Teams that prioritize clarity of intent
- Scenarios where each domain has unique attributes

---

## Comparison Table

| Criteria | Approach 1 (Minimalist) | Approach 2 (Enterprise) |
|----------|------------------------|-------------------------|
| **Number of Tables** | 5 | 8 |
| **Schema Complexity** | Low | Medium-High |
| **Query Complexity** | Low (unified view) | Medium (multiple JOINs) |
| **Add New Revenue Stream** | Add row to `transactions` | Add new table |
| **Referential Integrity** | Basic | Strong (FK constraints) |
| **Type Safety** | Low (metadata JSON) | High (dedicated columns) |
| **Performance for Cross-Domain** | Excellent (single table) | Moderate (multiple JOINs) |
| **Audit Trails** | Basic | Detailed per domain |
| **Best For** | MVPs, small data, rapid dev | Enterprise, large scale, strict governance |

---

## 💎 DESIGNER'S PERIGON

### *The Art of Reverse Engineering*


You didn't start with a clean schema. You started with **messy reports** – receipts, logs, meter readings, service tickets. You looked at the outputs and methodically arrived at the inputs.

Reverse Engineering is an essential skill you have to master to build a career with databases. Without this skill, you will struggle the moment you leave clean textbook datasets and face real-world data.

Here's why reverse-engineering a schema from reports is genuinely important in data analytics:

---

### 🎯 1. Real-world data is messy, not structured

In courses, you usually get:
- Clean tables
- Clear relationships
- Proper keys

In reality, you often get:
- Excel reports
- PDFs
- Dashboards

👉 Reverse engineering teaches you to **reconstruct structure from chaos**.

---

### 🧠 2. It builds true data understanding (not just tool usage)

Anyone can learn:
- SQL
- Power BI
- Python

But this skill forces you to ask:
- What does this column *actually mean*?
- What is the **grain** of this data?
- Is this value stored or calculated?

👉 That's the difference between a **tool user** ❌ and a **data thinker** ✅.

---

### 🔗 3. Helps you understand relationships (core of analytics)

Analytics depends on:
- Joins
- Aggregations
- Filters

Reverse engineering trains you to see:
- Customer → Orders → Products
- One-to-many, many-to-many relationships

👉 Without this, joins become guesswork.

---

### 📊 4. Essential for building dashboards correctly

Most dashboards are built from:
- Pre-existing reports
- Business requirements

If you don't understand underlying structure:
- You double-count data
- You mix granularities
- KPIs become wrong

👉 This skill prevents **silent data errors** (the worst kind).

---

### 🧮 5. Teaches granularity (one of the hardest concepts)

Example:
- Report A → daily sales
- Report B → monthly summary

If combined wrongly → wrong insights

👉 Reverse engineering forces you to identify: *"What level is this data at?"*

This is a **core analytics skill**.

---

### 🏢 6. Very common in real jobs

In companies, you'll rarely get:
- Documentation
- Data dictionaries

Instead, you'll hear:

> *"This is the report we use—can you build something better?"*

👉 Your job = decode it.

---

### 🔍 7. Builds problem-solving mindset

You start thinking like:
- A detective 🕵️
- A system designer 🧱

Instead of *"Run this query"*, you think: *"What system would produce this report?"*

---

### 💼 8. Strong interview and career advantage

If a student can explain:
- How they derived schema from reports
- How they identified entities and relationships

👉 That signals **real analytical maturity**.

Most candidates cannot do this.

---

### ⚠️ Reality Check

A lot of beginners think:

> *"Data analytics = charts and tools"*

That's incomplete.

👉 Actual analytics = **Understanding data structure + business logic + correctness**

---

### 🚀 Simple Analogy

- **Reports** = Final exam answers
- **Schema** = Step-by-step solution

👉 Reverse engineering = figuring out the **method**, not just the result

---

### 🧩 Final Thought

This skill sits at the intersection of:
- Data analysis
- Data engineering
- Business understanding

👉 That's why it's so powerful – it makes you **job-ready, not just course-ready**.

---
## 💎 6-STEP METHODOLOGY: EMBEDDED DNA

The 6-Step Problem Solving Framework you applied in this mission:

| # | Step | Your Application |
|---|------|------------------|
| 1️⃣ | **ROOT** | Siloed systems → No unified wallet share |
| 2️⃣ | **WHY** | Geetha's revenue leaks + Raj's monetization |
| 3️⃣ | **FACTS** | License plate connects 80% of streams |
| 4️⃣ | **BRAINSTORM** | Loyalty cards bridge data gaps |
| 5️⃣ | **TEST** | Phase iterations → Zero regressions |
| 6️⃣ | **ENHANCE** | Pharmacy / EV / Car Wash ready |

---

## 🏛️ SOLID DESIGN PRINCIPLES: VERIFIED

| Principle | Your Application |
|-----------|------------------|
| **S** (Single Responsibility) | Each table = 1 domain (tolls / cafe / repairs / fuel / store) |
| **O** (Open-Closed) | Extensions via new tables, no PK/FK rewrite |
| **L** (Liskov) | Vehicle inheritance (Passenger / Truck subtypes possible) |
| **I** (Interface Segregation) | Queries specific to lens (CTO / CEO / CFO) |
| **D** (Dependency Inversion) | Abstractions (date_dimension) over concretions |

> *"Unforeseen add-ons" = SOLID immortality.*

**Pharmacy example proves: Design scales to ANY revenue stream.**

---

## 🎯 FUTURE-PROOF EXTENSIONS: PHARMACY DEPLOYED

| Revenue Stream | Current | Future Extension | Open-Closed Link |
|----------------|---------|------------------|------------------|
| Convenience Store | Timestamp-only | `loyalty_cards.card_id` | ✅ New table |
| Pharmacy Store | N/A | `pharmacy_sales.card_id` → `loyalty_cards` → `vehicles.license_plate` | ✅ Unforeseen add-on |
| Car Wash | N/A | `car_wash.license_plate` | ✅ Direct plate |
| EV Charging | N/A | `ev_charging.license_plate` | ✅ Direct plate |

> *"Medicine sales table → License_Plate" = Clairvoyance proven.*

---

**The SQLVerse expands. Go build and conquer the world.** 🚀


---

## 🧭 EVALUATE Navigation

```mermaid
flowchart LR
    Ex0["✅ Ex0 Solutions"] --> Ex1["✅ Ex1 Solutions"]
    Ex1 --> Ex2["✅ Ex2 Solutions"]
    Ex2 --> Ex3["✅ Ex3 Solutions"]
    Ex3 --> Ex4["✅ Ex4 Solutions"]
    Ex4 --> Ex5["✅ Ex5 Solutions"]
    Ex5 --> CTO["✅ CTO SOLUTIONS<br/>1-MODULE4-CTO-REPORT-SOLUTIONS<br/>COMPLETE"]
    CTO --> CEO["📍 CEO SOLUTIONS<br/>2-MODULE4-CEO-REPORT-SOLUTIONS<br/>NEXT"]
    CEO --> CFO["⏳ CFO SOLUTIONS<br/>3-MODULE4-CFO-REPORT-SOLUTIONS"]
    CFO --> Quiz["⏳ Quiz Answers<br/>module4-quiz-answers.md"]
    Quiz --> Complete["🎉 MODULE 4 COMPLETE"]
    
    style Ex0 fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style Ex1 fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style Ex2 fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style Ex3 fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style Ex4 fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style Ex5 fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style CTO fill:#c8e6c9,stroke:#2e7d32,stroke-width:4px
    style CEO fill:#fff8e1,stroke:#ff9800,stroke-width:4px
    style CFO fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style Quiz fill:#e8f5e8,stroke:#4caf50,stroke-width:2px
    style Complete fill:#a5d6a7,stroke:#2e7d32,stroke-width:2px
```

| Previous Step | Next Step |
|:---:|:---:|
| [← Back to Exercise 5 Solutions](../5-mixed-joins-practice-solutions.md) | [Continue to CEO Report Solutions →](./2-MODULE4-CEO-REPORT-SOLUTIONS.md) |

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

**Level 1 | Module 4 | CTO Report Solutions | Next: [CEO Report Solutions](./2-MODULE4-CEO-REPORT-SOLUTIONS.md)**