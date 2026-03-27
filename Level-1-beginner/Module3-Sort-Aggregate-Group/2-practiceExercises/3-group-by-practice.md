


# 🗄️🤖 SQL & GenAI Course
**🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost**

## 🧠 Exercise 3: GROUP BY Practice – The Art of Bucketing

You’ve **mastered** the Big 5 Aggregates. Now it's time to **group** it – to create buckets and see patterns emerge. In this exercise, you'll answer business questions like *“How many products are in each category?”* and *“Which customers have placed more than one order?”* by using **`GROUP BY`**.

Now, instead of calculating one number for the whole table, you will learn to **slice** the table into **categories** and calculate math for each **"bucket"** simultaneously.

---

## 🌌 SQLVerse Check-In

<div style="border-left: 4px solid #9c27b0; background-color: #f3e5f5; padding: 15px; margin: 20px 0; border-radius: 0 8px 8px 0;">

**You are now on E‑Commerce Planet.** You’ve learned to sort and to measure. Now it’s time to **categorize**. `GROUP BY` is your sorting hat – it places each row into a bucket, and then you can count, sum, or average within each bucket.

Welcome to the **"Bucket & Slice"** phase! If Exercise 2 was about being a **Calculator**, **Exercise 3** is about being an **Architect of Insights**. In the real world, the CEO rarely asks for a single total. They ask for a **breakdown**. This is where `GROUP BY` turns you from someone who **"queries data"** into someone who "analyzes business."

**The Manual Labor Crisis:** Imagine you have 50 categories. To find the average price for each using only what you learned in Exercise 2, you would have to write 50 separate queries with 50 different `WHERE` clauses.

**The Artisan’s Solution:** `GROUP BY` does all 50 in **one single query**. It instructs the database to “Organize by Category, then do the math.” This is the move from Data Entry to **Data Engineering**.

*Remember the Leap from Exercise 2:*  
> *“I don’t want the total quantity for the whole store; I want the total quantity for each category separately.”*  
That’s exactly what you’re about to master – turning **one question** into **one query** that returns all the answers at once.


### 🔍 SQLVerse Artisan's Objective

In this exercise, you will learn to **slice** your data into meaningful categories. You'll group products by category, orders by customer, and even create sub‑segments using multiple columns. These are the tools that turn raw tables into insightful reports.

**Objective:** Transform single-row summaries into multi-row **analytical reports.**

**The difference between a coder and an Artisan is discipline.**

</div>

---

### 📍 Your Current Stage – PRACTICE Journey

```mermaid
flowchart LR
    A["✅ PREPARE Complete<br/>📘 Files 1-5"] --> B
    B["✅ CEO Report"] --> C
    C["✅ CTO Report"] --> D
    D["✅ Exercise 1<br/>Sorting Basics"] --> E
    E["✅ Exercise 2<br/>Aggregate Basics"] --> F
    F["📍 YOU ARE HERE<br/>🧠 Exercise 3<br/>GROUP BY Practice"] --> G
    G["⏳ Exercise 4<br/>HAVING Practice"] --> H
    H["⏳ Exercise 5<br/>Mixed Practice"] --> I
    I["✅ PRACTICE COMPLETE<br/>Ready for Quiz"]
    
    style A fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style B fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style C fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style D fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style E fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style F fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style G fill:#fff8e1,stroke:#ff9800,stroke-width:4px
    style H fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style I fill:#a5d6a7,stroke:#2e7d32,stroke-width:2px
```

You've completed Exercises 1 and 2. Now it's time to apply `GROUP BY`.

---

## 🔧 Enhanced Browser Office for PRACTICE

**🚀 Kickstart: Any Computer, Any Browser, Anytime.**  
**🌍 Destination: Any country, Any city, Any Platform.**

| Tab | Purpose | What to Do |
| :--- | :--- | :--- |
| **1: The Map** | Reference materials | • Keep your **[Module 3 Reference Guide](./module3-reference.md)** handy.<br>• Complete the challenges below. |
| **2: The Factory** | Run queries | Switch to the **E‑Store database**: **[`level1_estore_basic.db`](../../../Resources/sample_databases/level1_estore_basic.db)**. Run every query. |
| **3: The Consultant** | Conceptual Q&A | If stuck, follow the **3‑Attempt Rule**. Ask for conceptual hints, not code. Configure with **[Student Mode Prompt](../../../STUDENT_MODE_PROMPT_LEVEL1.md)**. |
| **4: The Vault** | Save your work | Save each successful query in your Vault at: `Learning/Level-1-beginner/Level1-1-ACQUIRE/Module3-Sort-Aggregate-Group/2-practiceExercises/` |

---

### 🛠️ Module 3 Toolkit

🚀 Foundation First, AI Next, Projects Last.  
💎 Gemstone by Gemstone, Skill by Skill.

| | | | |
|---|---|---|---|
| **Browser Office** | 🔧 [Troubleshooting Common Issues](../../../Setup/STEP1_COMMISSION_BROWSER_OFFICE.md) | 🔄 [Browser Office Workflow](../../../Setup/STEP2_ESTABLISH_LEARNING_RITUAL.md) | ⌨️ [Tab Operations & Shortcuts](../../../Setup/STEP3_MASTER_TAB_OPERATIONS.md) |
| **ACQUIRE Section** | 🗄️ [Database Ecosystem](../../Guides/Section1-ACQUIRE/2_Database_Ecosystem.md) | 📚 [Knowledge Base (Vault)](../../Guides/Section1-ACQUIRE/3_Knowledge_Base.md) | 🧠 [Mindset Tuning](../../Guides/Section1-ACQUIRE/4_Mindset.md) |

---

## 🏛️ Your Data Playground – E‑Store Database

You'll work with the same tables as before. Here are quick reminders.

### `customers` Table (first 3 rows)
| customer_id | name | email | city |
|-------------|------|-------|------|
| 1 | Alice Smith | alice@email.com | New York |
| 2 | Bob Johnson | bob@email.com | Chicago |
| 3 | Charlie Lee | charlie@email.com | New York |

### `products` Table (first 3 rows)
| product_id | product_name | category | price |
|------------|--------------|----------|-------|
| 1 | Laptop | Electronics | 1200.00 |
| 2 | Coffee Maker | Appliances | 80.00 |
| 3 | SQL Essentials Book | Books | 45.00 |

### `orders` Table (first 3 rows)
| order_id | customer_id | order_date |
|----------|-------------|------------|
| 1 | 1 | 2025-10-01 |
| 2 | 2 | 2025-10-01 |
| 3 | 1 | 2025-10-03 |

### `order_items` Table (first 3 rows)
| order_item_id | order_id | product_id | quantity |
|---------------|----------|------------|----------|
| 1 | 1 | 1 | 1 |
| 2 | 1 | 3 | 1 |
| 3 | 2 | 2 | 1 |

> 💡 **View the full datasets:** Run `SELECT * FROM customers;`, `SELECT * FROM products;`, `SELECT * FROM orders;`, `SELECT * FROM order_items;` in your Factory to see all rows.

---

## 💡 Artisan's Pro‑Tips for GROUP BY

1. **The "Golden Rule":** Every column in your `SELECT` list must either be **inside an aggregate function** (like `SUM` or `COUNT`) **or** be **listed in the `GROUP BY` clause**. If it’s not in a bucket, the database won’t know where to put it!

2. **Read it Backwards:** To understand a `GROUP BY` query, read it as: *“For each [Grouped Column], give me the [Aggregate Calculation].”*

3. **The Invisible Step:** Between `WHERE` and `SELECT`, the database is secretly sorting your rows into piles.

4. **You can group by multiple columns** to create sub‑segments (e.g., category and price tier).

5. **You can group by expressions** like `CASE` statements or `strftime` (date parts) – the database groups by the result of the expression.

6. **If a column contains NULLs, all NULLs form their own group.** This can be useful for finding missing data.

7. **`GROUP BY` does not sort automatically.** Use `ORDER BY` if you need a specific order.

---

## 🧪 Challenges

For each challenge, use the **Artisan's Query Rhythm**:
- **The Question** – read the business request.
- **The Query** – write your SQL.
- **Expected Result** – predict what you should see.
- **Try it now** – run it in Tab 2.
- **Reflect & Learn** – compare actual with expectation.

---

### 📦 Group A: Category Insights
*The product manager wants to understand how our catalog is organized.*

**Challenge 1:** How many products are in each category? Show `category` and the count of products.

```sql
-- Your query here
-- Save as: 3-1-products-per-category.sql
```

**Expected Result:** [Write your prediction here before running the query]  
**What this teaches:** Grouping by a single column (`category`) with `COUNT(*)`.

---

**Challenge 2:** What is the average price of products in each category? Show `category` and `AVG(price)`.

```sql
-- Your query here
-- Save as: 3-2-avg-price-per-category.sql
```

**Expected Result:** [Write your prediction here before running the query]  
**What this teaches:** Using `AVG` with `GROUP BY`.

---

**Challenge 3:** For each category, find the cheapest and the most expensive product price. Show `category`, `MIN(price)`, and `MAX(price)`.

```sql
-- Your query here
-- Save as: 3-3-price-range-per-category.sql
```

**Expected Result:** [Write your prediction here before running the query]  
**What this teaches:** Multiple aggregates with `GROUP BY`.

---

### 👥 Group B: Customer Activity
*The CEO wants to see how engaged our customers are.*

**Challenge 4:** How many orders has each customer placed? Show `customer_id` and the order count.

```sql
-- Your query here
-- Save as: 3-4-orders-per-customer.sql
```

**Expected Result:** [Write your prediction here before running the query]  
**What this teaches:** Grouping by a foreign key column (`customer_id`).

---

**Challenge 5:** Which customers have placed more than 1 order? Use `GROUP BY` and `HAVING` (you learned `HAVING` in File 4 – this is a preview). Show `customer_id` and order count, then filter groups with `HAVING COUNT(*) > 1`.

```sql
-- Your query here
-- Save as: 3-5-active-customers.sql
```

**Expected Result:** [Write your prediction here before running the query]  
**What this teaches:** Filtering groups with `HAVING` (preview of next exercise).

---

### 📊 Group C: Product Performance
*The warehouse manager needs to know which products sell best.*

**Challenge 6:** What is the total quantity sold for each product? Use `order_items` to group by `product_id` and sum the `quantity`. Show `product_id` and `SUM(quantity)`.

```sql
-- Your query here
-- Save as: 3-6-quantity-per-product.sql
```

**Expected Result:** [Write your prediction here before running the query]  
**What this teaches:** Grouping by a product identifier.

---

**Challenge 7:** For each product, find the average quantity per order item (i.e., average of `quantity`). Show `product_id` and `AVG(quantity)`.

```sql
-- Your query here
-- Save as: 3-7-avg-quantity-per-product.sql
```

**Expected Result:** [Write your prediction here before running the query]  
**What this teaches:** Another aggregate with `GROUP BY`.

---

### 🔧 Group D: Advanced Grouping (Sub‑segments)
*The CFO wants to see a more detailed breakdown.*

**Challenge 8:** Create price tiers for products:  
- **Low** – price < 100  
- **Medium** – price between 100 and 500  
- **High** – price > 500  

Use a `CASE` expression to create the tier, then count how many products fall into each tier. Show `price_tier` and the count.

```sql
-- Your query here
-- Save as: 3-8-products-by-price-tier.sql
```

**Expected Result:** [Write your prediction here before running the query]  
**What this teaches:** Grouping by a derived column (`CASE` expression).

---

**Challenge 9:** Now combine **category** and **price tier**. For each category, show how many products fall into each price tier.  
*Hint: You'll need to `GROUP BY` two columns: `category` and the `CASE` expression.*

```sql
-- Your query here
-- Save as: 3-9-category-tier-subsegment.sql
```

**Expected Result:** [Write your prediction here before running the query]  
**What this teaches:** Multi‑column grouping (sub‑segments).

---
### 📈 Group E: Regional Insights
*The Marketing Team wants to know where our customers live.*

**Challenge 10:** How many customers do we have in **each city**?

```sql
-- Your query here
-- Save as: 3-10-customers-per-city.sql
```

**Expected Result:** [Write your prediction here before running the query]  
**What this teaches:** Grouping by a text column (`city`).

---

**Challenge 11:** List each city and the **name of the customer** who lives there… *Wait!* Can you do this? Why or why not? (Hint: See the "Golden Rule" above.)

```sql
-- Try it: SELECT city, name FROM customers GROUP BY city;
```

**Expected Result:** You'll get an error.  
**What this teaches:** The Golden Rule in action – you can’t select a non‑aggregated column (`name`) that isn’t in `GROUP BY`. The database doesn’t know which name to show when multiple customers share a city.

**Reflect:** Write down why the database is confused.

---

### 🛍️ Group F: Order‑Level Analysis
*The CFO is looking for the largest order.*

**Challenge 12:** Which `order_id` has the **most items**? Group by `order_id` and count the number of rows (`COUNT(*)`) in `order_items`. Then sort by the count descending and show only the top 1.

```sql
-- Your query here
-- Save as: 3-12-items-per-order.sql
```

**Expected Result:** [Write your prediction here before running the query]  
**What this teaches:** Grouping by `order_id` to count line items, then sorting and limiting to find the largest order.

---

## 🎯 Your Progress Tracker

| Challenge | Status (✅/⏳) | Confidence (1‑5) |
|-----------|---------------|------------------|
| A1: Products per Category | | |
| A2: Avg Price per Category | | |
| A3: Price Range per Category | | |
| B4: Orders per Customer | | |
| B5: Active Customers (HAVING) | | |
| C6: Quantity per Product | | |
| C7: Avg Quantity per Product | | |
| D8: Products by Price Tier | | |
| D9: Category × Price Tier | | |
| E10: Customers per City | | |
| E11: The Golden Rule Trap | | |
| F12: Largest Order | | |
---

## 🌍 Real‑World Application: What You Just Built

- **Category Insights** – Every retail dashboard starts with category breakdowns: how many products, price ranges, average prices.
- **Customer Activity** – Understanding which customers are most engaged is key to loyalty programs and retention.
- **Product Performance** – Knowing which products sell the most helps with inventory management and promotions.
- **Advanced Grouping** – Sub‑segments (e.g., price tiers within categories) give deeper insight into your product mix.
- **Regional Insights** – Understanding where customers live helps target marketing.
- **Order-Level Analysis** – Identifying the largest order highlights high‑value transactions”.

You're no longer looking at the whole table as one number. You're now **slicing** your data into meaningful categories and measuring each one. This is the heart of data analysis.

---

## ✅ When You're Done

- [ ] I successfully ran all 12 queries (or made a solid attempt).
- [ ] I saved each query in my Vault with the correct filename.
- [ ] I understand that every non‑aggregate column in `SELECT` must be in `GROUP BY`.
- [ ] I can group by a single column and by multiple columns.
- [ ] I can use `CASE` to create custom groups.
- [ ] I can explain the "Golden Rule" of `GROUP BY` to a peer.
- [ ] I feel ready for Exercise 4: HAVING Practice.

---

<div style="border-left: 4px solid #ff9800; background-color: #fff8e1; padding: 15px; margin: 20px 0; border-radius: 0 8px 8px 0;">


## 🔮 A Look Ahead: From Buckets to Filtered Buckets

In this exercise, you created **buckets** (groups) and measured them. But what if you only want to see buckets that meet a certain condition – for example, only categories with more than 2 products, or only customers who have placed more than 1 order?

### 🔮 The Threshold of "Actionable" Data

You have just mastered the ability to condense a table of 1,000 rows into a summary of 5 rows. But here is the next business dilemma:

**The "Noise" Problem:**  
In Exercise 3, you saw *every* city and *every* category. But what if the CEO says: *“I don’t care about cities with only 1 customer. I only want to see cities where we have a **crowd** (3 or more) so we can plan a local event.”*

**The Leap to Exercise 4:**  
You cannot use `WHERE` to filter these results because `WHERE` only looks at individual rows. You need a filter that looks at the **Buckets** themselves.

You already got a taste of that with **Challenge 5** using `HAVING`. In the next exercise, you'll master `HAVING` – the tool that lets you **filter groups** after they've been formed, answering exactly those kinds of questions.

You're moving from a **Categorizer** to a **Curator** – someone who knows not just how to group data, but how to select the groups that truly matter.

In **Exercise 4: HAVING Practice**, you will learn to be the **Gatekeeper of the Buckets**. You will learn to say: *"Show me the groups, but only the ones that are big enough, expensive enough, or active enough to matter."*

---

### 🧠 The Artisan's Truth

> *“Grouping without filtering gives you the full picture. Grouping with `HAVING` gives you the **actionable picture**.”*

> *“A million rows becomes ten categories. Ten categories become three that deserve attention. That’s the power of `GROUP BY` followed by `HAVING`.”*

> *"A `GROUP BY` without an `ORDER BY` is a pile; adding the `ORDER BY` makes it a Rank."*

</div>

---

## 🧭 Practice Navigation

```mermaid
flowchart LR
    A["✅ PREPARE Complete<br/>📘 Files 1-5"] --> B
    B["✅ CEO Report"] --> C
    C["✅ CTO Report"] --> D
    D["✅ Exercise 1<br/>Sorting Basics"] --> E
    E["✅ Exercise 2<br/>Aggregate Basics"] --> F
    F["✅ Exercise 3<br/>GROUP BY Practice"] --> G
    G["⏳ Exercise 4<br/>HAVING Practice"] --> H
    H["⏳ Exercise 5<br/>Mixed Practice"] --> I
    I["✅ PRACTICE COMPLETE<br/>Ready for Quiz"]
    
    style A fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style B fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style C fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style D fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style E fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style F fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style G fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style H fill:#fff8e1,stroke:#ff9800,stroke-width:4px
    style I fill:#a5d6a7,stroke:#2e7d32,stroke-width:2px
```

| Previous Step | Next Step |
|:---:|:---:|
| [← Back to Exercise 2: Aggregate Basics](./2-aggregate-basics.md) | [Continue to Exercise 4: HAVING Practice →](./4-having-practice.md) |

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

**Level 1 | Module 3 | Practice Exercise 3 | Next: [HAVING Practice](./4-having-practice.md)**