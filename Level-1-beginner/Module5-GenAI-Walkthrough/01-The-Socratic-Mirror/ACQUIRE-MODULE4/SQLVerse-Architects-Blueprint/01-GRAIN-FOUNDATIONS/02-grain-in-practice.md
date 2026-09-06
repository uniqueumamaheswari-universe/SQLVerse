
# 🗄️🤖 SQL & GenAI Course

**🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost**

# 02 — Grain in Practice

## Table Grain vs. Query Grain & Fan-Out/Join Risks

**Document Type:** Grain Foundations — Part 2 of 3  
**Version:** 1.0  
**Status:** FROZEN  
**Location:** `SQLVerse-Architects-Blueprint/01-GRAIN-FOUNDATIONS/`  
**Governing Standard:** `SQLVERSE-ARCH-FW-001`

---

## 🔗 From the Architect's Blueprint

In **ACQUIRE Files 2 & 3**, you learned how tables stay connected through Foreign Keys and how relationships are classified (1:1, 1:N, M:N). You built junction tables like `order_items` and `LoanApplications` to resolve many-to-many relationships.

**You learned:**

- Foreign Keys tell you that tables are connected.
- Relationships tell you what kind of connection exists (1:1, 1:N, M:N).
- The Refactoring Lab showed you how to build and join a normalized structure.

You know **how** tables are connected. Now we examine **what happens when connected tables operate at different grains**.

* A `customers` row represents **One Customer**.
* An `orders` row represents **One Order**.
* An `order_items` row represents **One Line Item in an Order**.

**Now we ask a deeper question:**

> **What happens when connected tables represent different grains?**

---

## 📌 Purpose

This is the second of three foundational documents on **Grain**.

In **Grain 01**, you learned what table grain is and how to identify it.

**This document bridges data modeling theory and SQL execution mechanics.**

Now you will learn:

- The difference between **Table Grain** (physical storage) and **Query Grain** (the result of a `GROUP BY`).
- Why **Required Grain** and **Available Grain** are the key to analytical correctness.
- What happens when tables with different grains are joined — and how to prevent **fan‑out** (row multiplication).
- Why **SQL can run perfectly and still produce a wrong answer.**

---

## 🧠 Two Kinds of Grain

### From Grain Basics to Query Grain

In **01 — Grain Basics**, you learned that every table in a database has a **Table Grain** — a real-world business definition of what a single row represents.

Now we transition from static schemas to active execution.

When you write a `SELECT` statement—especially one containing `JOIN`s, `GROUP BY` clauses, or aggregate functions—you construct a new, temporary table in memory. That query result **also has a grain**.

```text
TABLE GRAIN
│
└── What does ONE row in this table represent?
│
│
QUERY GRAIN
│
└── What does ONE row in the query result represent?
```

**Table Grain** is fixed. It is defined by the schema.

**Query Grain** is dynamic. It is defined by your `SELECT`, `GROUP BY`, and `JOIN`.

**Table Grain**  ──▶  The level of detail stored in a physical base table
**Query Grain**  ──▶  The level of detail produced by an executed SQL statement

>⚠️ **The Critical Law of Analytical Correctness:**
>
>If the **Query Grain** does not match the **Business Question Grain**, the query's answer is mathematically wrong—even if the SQL syntax executes without errors.

---

### Table Grain — Physical Storage

```text
customers
→ one row = one customer

orders
→ one row = one order

order_items
→ one row = one order line

products
→ one row = one product
```

You can change the Query Grain, but you can never change the Table Grain.

```text
You can GROUP BY customer_id to get one row per customer.
You can GROUP BY order_id to get one row per order.
You cannot disaggregate a summary row back into individual order items.
```

---

### Query Grain — The Analytical Result

```sql
SELECT customer_id, SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id;
```

**Query Grain:** One row = one customer with their total spend.

```sql
SELECT order_date, COUNT(*) AS daily_orders
FROM orders
GROUP BY order_date;
```

**Query Grain:** One row = one day with its order count.

**The Rule:**
> **Table Grain is physical. Query Grain is analytical.**
>
> **You can aggregate upward. You cannot disaggregate downward.**

---

## 🔍 Required Grain vs. Available Grain

This is one of the most important diagnostic questions you will ever ask.

When a business request arrives, an **SQLVerse Artisan** evaluates two states:

| State | Definition |
|-------|------------|
| **Available Grain** | The level of detail your tables actually store. |
| **Required Grain** | The level of detail the business analysis needs. |

When these don't line up, you either can't answer the question directly, or you risk wrong numbers — especially after joins.

---

### 🧠 Core Idea in One Line

- **Required Grain** = *"What should one row in my result represent?"*
- **Available Grain** = *"What does one row in each source table represent today?"*

You must consciously align them before aggregating or joining.

---

### 📊 The Diagnostic Framework

```text
REQUIRED GRAIN
      │
      └── What grain does the business question demand?
      │
      │
AVAILABLE GRAIN
      │
      └── What grain does the table actually store?
```

| Condition | Outcome |
|-----------|---------|
| Required Grain is **finer** than Available Grain | ❌ **The model cannot answer the question** |
| Required Grain is **coarser** than Available Grain | ⚙️ **We need to aggregate** |

---

## Example: The Restaurant Chain

### Business context

You have a restaurant chain **“SpiceRoute”** with multiple branches in Chennai:

- Branches: `SR-Anna Nagar`, `SR-T Nagar`, `SR-Adyar`, etc.
- Each branch takes many **bills** per day.
- Each bill has multiple **line items** (dishes, drinks, etc.).

You want to answer questions like:

> “What was the **total sales per branch per month**?”  
> “What was the **average bill value per branch per day**?”  
> “Which **menu items** are most popular at each branch?”

***

## Step 1: Define the required grain (what the business needs)

### Example question 1

> “Show me **total sales per branch per month** for the last year.”

**Required grain**:

> **One row = one branch in one month**  
> Keys: `(branch_id, month)`  
> Measure: `total_sales`

### Example question 2

> “Show me **total sales and number of bills per branch per day**.”

**Required grain**:

> **One row = one branch on one date**  
> Keys: `(branch_id, sale_date)`  
> Measures: `total_sales`, `bill_count`

### Example question 3

> “Show me **sales per menu item per branch per month**.”

**Required grain**:

> **One row = one menu item at one branch in one month**  
> Keys: `(branch_id, menu_item_id, month)`  
> Measure: `total_quantity_sold`, `total_sales`

Each question implies a different required grain.

***

## Step 2: What data do we actually have? (available grain)

Assume these tables in your database:

### 1. `bills` table  
Grain: **one row = one bill**

| bill_id | branch_id | bill_time           | total_amount |
|--------:|----------:|---------------------|-------------:|
| 5001    | B01       | 2026-09-01 12:15:00 | 850          |
| 5002    | B01       | 2026-09-01 12:40:00 | 620          |
| 5003    | B02       | 2026-09-01 13:05:00 | 1100         |
| 5004    | B01       | 2026-09-02 19:10:00 | 940          |

**Available grain**: one row per bill.

***

### 2. `bill_items` table  
Grain: **one row = one line item in a bill**

| bill_id | item_id | menu_item_id | quantity | unit_price |
|--------:|--------:|-------------:|---------:|-----------:|
| 5001    | 1       | M10          | 2        | 200        |
| 5001    | 2       | M25          | 1        | 250        |
| 5001    | 3       | M30          | 2        | 100        |
| 5002    | 1       | M10          | 1        | 200        |
| 5002    | 2       | M40          | 2        | 210        |
| 5003    | 1       | M25          | 3        | 250        |
| 5004    | 1       | M10          | 1        | 200        |
| 5004    | 2       | M30          | 3        | 100        |
| 5004    | 3       | M50          | 1        | 240        |

**Available grain**: one row per bill line item (finer than bills).

***

### 3. `branches` table  
Grain: **one row = one branch**

| branch_id | branch_name   | city    |
|----------:|--------------:|--------:|
| B01       | SR-Anna Nagar | Chennai |
| B02       | SR-T Nagar    | Chennai |
| B03       | SR-Adyar      | Chennai |

***

## Case A: Required grain is coarser than available grain (safe, just aggregate)

### Question: “Total sales per branch per month”

- **Required grain**: one row per `(branch_id, month)`
- **Available grain**: one row per `bill` (or per `bill_item`)

This is fine—you just **roll up** from bills to branch‑month.

From `bills`:

```sql
SELECT
    branch_id,
    strftime('%Y-%m', bill_time) AS month,
    SUM(total_amount) AS total_sales
FROM bills
GROUP BY
    branch_id,
    strftime('%Y-%m', bill_time);
```

Result example:

| branch_id | month      | total_sales |
|----------:|-----------:|------------:|
| B01       | 2026-09-01 | 45000       |
| B02       | 2026-09-01 | 38000       |
| B03       | 2026-09-01 | 52000       |

Here:

- Required grain: branch‑month ✅  
- Available grain: bill → aggregated to branch‑month ✅  
- No problem; you just used `GROUP BY` to change grain.

You could also start from `bill_items` and aggregate twice (item → bill → branch‑month), but conceptually it’s the same: **finer available grain → aggregate to coarser required grain**.

***

## Case B: Grain mismatch in joins (where mistakes happen)

Now suppose you want:

> “For each **bill**, show branch name and total amount.”

- **Required grain for result**: one row per `bill_id`
- `bills` available grain: one row per `bill_id` ✅
- `bill_items` available grain: many rows per `bill_id` ❌ (finer)
- `branches` available grain: one row per `branch_id` ✅

### Wrong pattern: joining bills to bill_items and then summing bill totals

Imagine you write:

```sql
-- WRONG if you later SUM total_amount per branch
SELECT
    b.bill_id,
    br.branch_name,
    b.total_amount,
    bi.menu_item_id,
    bi.quantity
FROM bills b
JOIN branches br
  ON b.branch_id = br.branch_id
JOIN bill_items bi
  ON b.bill_id = bi.bill_id;
```

Now each bill appears multiple times (once per item). Example for `bill_id = 5001`:

| bill_id | branch_name     | total_amount | menu_item_id | quantity |
|--------:|-----------------|-------------:|-------------:|---------:|
| 5001    | SR-Anna Nagar   | 850          | M10          | 2        |
| 5001    | SR-Anna Nagar   | 850          | M25          | 1        |
| 5001    | SR-Anna Nagar   | 850          | M30          | 2        |

If you now do:

```sql
SELECT
    br.branch_name,
    SUM(b.total_amount) AS total_sales   -- inflated!
FROM bills b
JOIN branches br
  ON b.branch_id = br.branch_id
JOIN bill_items bi
  ON b.bill_id = bi.bill_id
GROUP BY br.branch_name;
```

`total_amount` for each bill is counted **as many times as there are items** in that bill. So branch sales are **overstated**.

Why? Because:

- **Required grain for sales**: one row per bill (or per branch, but each bill counted once).
- **Available grain after join**: one row per bill item.
- You changed the grain without adjusting your aggregation → double counting. 

***

## Correct pattern: align grains before aggregating

### Option 1: Don’t join to the finer table if you only need bill‑level totals

If you only need **branch‑level sales**, just use `bills` + `branches`:

```sql
SELECT
    br.branch_name,
    strftime('%Y-%m', b.bill_time) AS month,
    SUM(b.total_amount) AS total_sales
FROM bills b
JOIN branches br
  ON b.branch_id = br.branch_id
GROUP BY
    br.branch_name,
    strftime('%Y-%m', b.bill_time);
```

No `bill_items` involved → grain stays at **one row per bill**, then aggregated to **branch‑month**.

***

### Option 2: If you need item details, decide the result grain carefully

Suppose the business now asks:

> “For each **branch and menu item**, show total quantity sold and total sales per month.”

- **Required grain**: one row per `(branch_id, menu_item_id, month)`
- You *must* use `bill_items` (finer grain), but you must aggregate correctly.

Correct query:

```sql
SELECT
    b.branch_id,
    bi.menu_item_id,
    strftime('%Y-%m', b.bill_time) AS month,
    SUM(bi.quantity) AS total_quantity,
    SUM(bi.quantity * bi.unit_price) AS total_sales
FROM bill_items bi
JOIN bills b
  ON bi.bill_id = b.bill_id
GROUP BY
    b.branch_id,
    bi.menu_item_id,
   strftime('%Y-%m', b.bill_time);
```

Now:

- Input grain: one row per bill item.
- Output grain: one row per `(branch, menu_item, month)` → matches required grain.
- Sales are computed at the item level and aggregated correctly; no double counting.

***

## Mapping this back to “required vs available grain”

For the restaurant chain:

### Example 1: Branch‑month sales

- **Required grain**: one row per `(branch_id, month)`
- **Available grain**:
  - `bills`: one row per bill
  - `bill_items`: one row per bill item
- Action: aggregate `bills` (or `bill_items` → bills → branch‑month) to match required grain.

### Example 2: Bill‑level report with item details

- **Required grain**: one row per `(bill_id, menu_item_id)` if you want itemized view.
- **Available grain**:
  - `bills`: one row per bill
  - `bill_items`: one row per bill item
- Here, `bill_items` already matches the required grain for an itemized bill view; you can join `bills` for extra fields, but you must **not** sum `total_amount` at that grain as if it were per bill.

### Example 3: Branch‑item‑month sales

- **Required grain**: one row per `(branch_id, menu_item_id, month)`
- **Available grain**: `bill_items` (per item) + `bills` (per bill)
- Action: join `bill_items` to `bills`, then `GROUP BY` branch, item, month.

***

## Practical checklist for your restaurant data

Before writing a query:

1. **Write the required grain in one sentence**  
   - “One row per branch per month.”  
   - “One row per bill.”  
   - “One row per branch, menu item, and month.”

2. **Write each table’s available grain**  
   - `bills`: one row per bill.  
   - `bill_items`: one row per bill line item.  
   - `branches`: one row per branch.

3. **Check joins**  
   - If you join a coarser table (bills) to a finer table (bill_items), the result grain becomes finer.  
   - If your metric (like `total_amount`) is defined at the coarser grain, don’t sum it after fanning out to the finer grain.

4. **Validate with counts**  
   - Count bills per branch per month from `bills` alone.  
   - Count again after joins; if the number of “bill equivalents” changes, your grain has shifted—adjust your aggregation.



**The Lesson:**

```text
FINE GRAIN
(Line Items)
      │
      ▼
  Aggregated Upward
      │
      ▼
COARSE GRAIN
(Daily Store Summary)

❌ Cannot go back down
```

This is why **understanding grain is not optional**. If you lose detail, you lose the ability to answer certain questions.

---

## 🔗 Revisiting the Refactoring Lab

In the Refactoring Lab, you transformed this:

```text
products
-------------------------------
product_id | product_name | category | price
```

into this:

```text
products
-------------------------------
product_id | product_name | category_id | price

categories
-------------------------------
category_id | category_name
```

Now ask:

| Table | Grain |
|-------|-------|
| `products` | One row = one product |
| `categories` | One row = one category |

Then you wrote your first `JOIN`:

```sql
SELECT p.product_name, c.category_name
FROM products p
JOIN categories c ON p.category_id = c.category_id;
```

**Query Grain:** One row = one product with its category.

This is a **safe JOIN** because:
- Each product belongs to one category.
- One row in `products` matches exactly one row in `categories`.
- No row multiplication occurs.

But not all joins are this safe.

---

## ⚠️ The Danger: Different Grains Meet

Consider this common business question:

> *"Show me each order with the total value of its items."*

You have:

```text
orders
→ one row = one order

order_items
→ one row = one order line
```

**The Relationship:**

```text
orders (1) ──── (N) order_items
```

If you join without understanding the grain:

```sql
SELECT o.order_id, o.order_date, oi.quantity * oi.price AS item_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id;
```

**Query Grain:** One row = one order line with its order details.

This is **not wrong**. It is a valid query.

But if you then try to sum item values and assume you are summing per order:

```sql
SELECT o.order_id, SUM(oi.quantity * oi.price) AS total_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id;
```

**Query Grain:** One row = one order with its total value.

This is also correct.

**The danger is when you assume a grain that is not actually there.**

---

### The Fan‑Out Trap

```text
orders
   │
   │ 1
   ▼
order_items
   │
   │ many
   ▼
multiple rows
```

If an order has 3 items, a `JOIN` will produce 3 rows.

If another table at the order grain is joined:

```sql
SELECT o.order_id, oi.quantity * oi.price AS item_value, s.shipping_fee
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN shipping s ON o.order_id = s.order_id;
```

If `shipping_fee = 100` and the order has 3 items:

```text
Item 1 → 100
Item 2 → 100
Item 3 → 100

SUM(shipping_fee) = 300 ❌ (should be 100)
```

**This is fan‑out: row multiplication that distorts the result.**

---

### Why This Happens

The `shipping` table is at the **order grain** (one row = one order).

The `order_items` table is at the **order-line grain** (one row = one item).

When joined, the order‑grain fact is repeated for every order line.

```text
order_grain → repeated for each order line
```

**The Golden Rule:**
> **When joining tables at different grains, aggregate the many‑side table to the grain of the one‑side table before joining.**

---

### The Fix — Aggregating to the Correct Grain

```sql
SELECT o.order_id, oi_total.total_value, s.shipping_fee
FROM orders o
JOIN (
    SELECT order_id, SUM(quantity * price) AS total_value
    FROM order_items
    GROUP BY order_id
) oi_total ON o.order_id = oi_total.order_id
JOIN shipping s ON o.order_id = s.order_id;
```

**Now:**
- `order_items` is aggregated to the order grain first.
- The `JOIN` is between tables at the same grain.
- No row multiplication occurs.
- `SUM(shipping_fee)` = 100 ✅

---

### 🧠 The Diagnostic Question

Before writing a `JOIN`, always ask:

```text
What is the grain of Table A?
What is the grain of Table B?
Are they the same?
If not, which table must be aggregated first?
```

If you cannot answer these questions, you are not ready to write the `JOIN`.

---

## 🔍 The Refactoring Lab — A Controlled First JOIN

The Refactoring Lab gave you a controlled first `JOIN`:

```text
products (product grain)
   │
   │ JOIN
   ▼
categories (category grain)
```

**Why is this safe?**

- Each product belongs to exactly one category.
- One row in `products` matches exactly one row in `categories`.
- No row multiplication occurs.

The grain of the query result is the same as the grain of the primary table:

```text
One row = one product with its category.
```

---

## ⚠️ What About Aggregations?

Aggregations can also change query grain.

```sql
SELECT category_name, COUNT(*) AS product_count
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY category_name;
```

**Query Grain:** One row = one category with its product count.

This is **safe**, even though `GROUP BY` changed the query grain from product to category.

The important distinction is:

```text
Joining at different grains → dangerous unless you aggregate first.

GROUP BY → always changes query grain, but it is explicit and controlled.
```

---

## 🏛️ The Artisan's Guardrail

```text
BEFORE YOU JOIN, KNOW THE GRAIN.
```

| Question | Why It Matters |
|----------|----------------|
| What does one row in Table A represent? | This is Table Grain A. |
| What does one row in Table B represent? | This is Table Grain B. |
| Are they the same grain? | If not, aggregation may be required. |
| What is the grain of the result? | This is Query Grain — is it meaningful? |

**The Golden Rule of Joins:**
> **If grains differ, aggregate the many side to the grain of the one side before joining.**

---

## 🧠 Self-Assessment

After reading this document, test yourself on the following scenarios:

| Scenario | Question |
|----------|----------|
| `orders` (order grain) + `order_items` (order-line grain) | What happens when you join them directly? How do you fix it? |
| `students` (student grain) + `enrollments` (enrollment grain) | What is the grain of a query that joins these? How do you aggregate safely? |
| `products` (product grain) + `categories` (category grain) | Why is this join safe without aggregation? |
| `daily_sales` (day grain) + `hourly_sales` (hour grain) | Can you join these safely without aggregation? |

**Answers:**

| Scenario | Answer |
|----------|--------|
| `orders` + `order_items` | Direct join produces multiple rows per order. Aggregate `order_items` to `order_id` first, then join. |
| `students` + `enrollments` | Query grain = one enrollment per row. To get student‑level results, aggregate `enrollments` first. |
| `products` + `categories` | Safe because each product belongs to one category — no row multiplication. |
| `daily_sales` + `hourly_sales` | You can aggregate `hourly_sales` to the day grain before joining, or join directly at the hour grain — but understand the result. |

---

## 🔁 Bridge to File 3

You now understand how grain behaves in practice: the difference between table grain and query grain, the concept of required vs available grain, and the fan‑out trap.

**Next: `03-advanced-grain-evolution-with-joins.md`** — where you will apply these principles to the freshly evolved schemas and explore disaggregation limits, temporal grain, and history preservation.

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

**SQLVerse | Architecture | Grain Foundations | 02 — Grain in Practice**