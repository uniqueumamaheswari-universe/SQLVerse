


# 🗄️🤖 SQL & GenAI Course
**🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost**

## 🧠 Exercise 4: HAVING Practice – The Gatekeeper of Buckets

You’ve learned to create buckets with `GROUP BY`. Now it's time to **filter** those buckets – to focus only on the groups that meet your criteria. In this exercise, you'll answer business questions like *“Which product categories have more than 2 products?”* and *“Which customers have placed more than one order?”* by using **`HAVING`**.

---

## 🌌 SQLVerse Check-In

<div style="border-left: 4px solid #9c27b0; background-color: #f3e5f5; padding: 15px; margin: 20px 0; border-radius: 0 8px 8px 0;">

**You are now on E‑Commerce Planet.** You’ve mastered `GROUP BY`. But the CEO doesn’t want to see *every* bucket – they want to see the ones that **matter**. That’s where `HAVING` comes in.

Welcome to the **“Gatekeeper of Buckets”** phase! If Exercise 3 was about being an **Architect of Insights**, **Exercise 4** is about being a **Curator** – you decide which insights are worth showing.

### 🔍 SQLVerse Artisan's Objective

In this exercise, you will learn to **filter groups** using `HAVING`. You'll find categories with more than a certain number of products, customers who are highly active, and products that sell exceptionally well. You'll also combine `WHERE` (row filters) with `HAVING` (group filters) to create precise, powerful reports.

**Objective:** Turn bucket lists into **curated, actionable insights**.

### 💡 The Conceptual Bridge

The **Artisan's Distinction** between `WHERE` and `HAVING`:

- **`WHERE`** filters **Individual Rows** *before* they are put into buckets.
- **`HAVING`** filters **The Buckets** *after* the math is done.

> **Example:** You use `WHERE` to find “Customers from India.”  
> You use `HAVING` to find “Cities with more than 10 customers.”

Now, you will learn to be the **Gatekeeper**. You will write queries that only show the “interesting” groups—the ones that meet specific business thresholds.

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
    F["✅ Exercise 3<br/>GROUP BY Practice"] --> G
    G["📍 YOU ARE HERE<br/>🧠 Exercise 4<br/>HAVING Practice"] --> H
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

You've completed Exercises 1–3. Now it's time to filter those groups with `HAVING`.

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

## 💡 Artisan's Pro‑Tips for HAVING

1. **The Sequence:** The database follows a strict "Choreography":  
   `FROM` → `WHERE` → `GROUP BY` → `HAVING` → `SELECT` → `ORDER BY`.  
   `HAVING` runs after grouping, which is why it can use aggregate functions.

2. **The "Aggregate Only" Filter:** If your filter uses an aggregate function like `COUNT(*)`, `SUM()`, or `AVG()`, it belongs in `HAVING` – never in `WHERE`.

3. **Alias Portability:** In SQLite, you can use column aliases in `HAVING`. In other databases (like PostgreSQL, MySQL, SQL Server), you must repeat the full expression (e.g., `HAVING SUM(quantity) > 10`). Test your queries in your environment.

4. **Combine `WHERE` and `HAVING`:** Use `WHERE` to filter rows before grouping, then `HAVING` to filter the resulting groups. This makes your queries faster and more precise.

5. **`HAVING` without `GROUP BY`** treats the whole table as one group – rarely useful, but valid.

6. **Sorting:** `HAVING` does not sort results. Use `ORDER BY` if you need a specific order.

---

## 🧪 Challenges

For each challenge, use the **Artisan's Query Rhythm**:
- **The Question** – read the business request.
- **The Query** – write your SQL.
- **Expected Result** – predict what you should see.
- **Try it now** – run it in Tab 2.
- **Reflect & Learn** – compare actual with expectation.

---

### 📦 Group A: High-Value Segments
*Focusing only on the "Big Fish" in our inventory.*

**Challenge 1:** Show categories that have **more than 2 products**.

```sql
-- Your query here
-- Save as: 4-1-populous-categories.sql
```

**Expected Result:** [Write your prediction here before running the query]  
**What this teaches:** `HAVING COUNT(*) > 2`.

---

**Challenge 2:** Which categories have an **average product price greater than $100**?

```sql
-- Your query here
-- Save as: 4-2-premium-categories.sql
```

**Expected Result:** [Write your prediction here before running the query]  
**What this teaches:** `HAVING AVG(price) > 100`.

---

### 👥 Group B: Top-Tier Customers
*Identifying our most loyal and high-spending users.*

**Challenge 3:** Find `customer_id`s who have placed **more than 1 order**.

```sql
-- Your query here
-- Save as: 4-3-repeat-customers.sql
```

**Expected Result:** [Write your prediction here before running the query]  
**What this teaches:** `HAVING COUNT(*) > 1`.

---

**Challenge 4:** Find cities that have **exactly 1 customer**. (Great for identifying where we need to improve local marketing!)

```sql
-- Your query here
-- Save as: 4-4-low-density-cities.sql
```

**Expected Result:** [Write your prediction here before running the query]  
**What this teaches:** `HAVING COUNT(*) = 1`.

---

### 📈 Group C: Performance Thresholds
*Filtering based on volume and totals.*

**Challenge 5:** Looking at `order_items`, show `product_id`s that have a **total quantity sold of more than 5**.

```sql
-- Your query here
-- Save as: 4-5-best-selling-products.sql
```

**Expected Result:** [Write your prediction here before running the query]  
**What this teaches:** `HAVING SUM(quantity) > 5`.

---

**Challenge 6:** Which products (by `product_id`) have an **average quantity per order item greater than 1**?

```sql
-- Your query here
-- Save as: 4-6-bulk-products.sql
```

**Expected Result:** [Write your prediction here before running the query]  
**What this teaches:** `HAVING AVG(quantity) > 1`.

---

### 🔧 Group D: Combined Filters
*Putting it all together – multiple conditions in `HAVING`.*

**Challenge 7:** Which product categories have **both** an average price above $100 **and** more than 2 products?

```sql
-- Your query here
-- Save as: 4-7-categories-multi-condition.sql
```

**Expected Result:** [Write your prediction here before running the query]  
**What this teaches:** Multiple conditions in `HAVING` with `AND`.

---

### 🏙️ Group E: Advanced Scenarios
*Combining `WHERE` and `HAVING` to answer nuanced questions.*

**Challenge 8:** Find cities that have **at least 2 customers** and whose names **start with 'N'**.
*Hint: Use `WHERE` to filter cities by name, then `HAVING` to count.*

```sql
-- Your query here
-- Save as: 4-8-ny-crowd.sql
```

**Expected Result:** [Write your prediction here before running the query]  
**What this teaches:** Combining `WHERE` and `HAVING`.

---

**Challenge 9:** Which orders have **total quantity greater than 2**? (Use `order_items` table.)

```sql
-- Your query here
-- Save as: 4-9-large-orders.sql
```

**Expected Result:** [Write your prediction here before running the query]  
**What this teaches:** `HAVING` with `SUM` on a different table.

---

## 🎯 Your Progress Tracker

| Challenge | Status (✅/⏳) | Confidence (1‑5) |
|-----------|---------------|------------------|
| A1: Categories > 2 products | | |
| A2: Categories avg price > 100 | | |
| B3: Customers > 1 order | | |
| B4: Cities with exactly 1 customer | | |
| C5: Products sold > 5 quantity | | |
| C6: Products avg quantity > 1 | | |
| D7: Categories multi‑condition | | |
| E8: NY cities with crowd | | |
| E9: Orders with quantity > 2 | | |

---

## 🌍 Real‑World Application: What You Just Built

- **Category Thresholds** – Helps product managers focus on categories that are large enough or valuable enough to merit attention.
- **Customer Activity** – Identifies loyal customers for rewards programs.
- **Product Popularity** – Highlights best‑sellers for inventory focus.
- **Geographic Clusters** – Targets marketing efforts on cities with enough customers.
- **Advanced Group Filtering** – Combines multiple business rules to pinpoint exactly what matters.

You’ve moved from creating groups to **curating** them. This is the mindset of a data analyst who doesn’t just report everything, but filters out the noise to deliver **actionable insights**.

---

## ✅ When You're Done

- [ ] I successfully ran all 9 queries (or made a solid attempt).
- [ ] I saved each query in my Vault with the correct filename.
- [ ] I understand the difference between `WHERE` and `HAVING`.
- [ ] I can use multiple conditions in `HAVING` with `AND`/`OR`.
- [ ] I can combine `WHERE` and `HAVING` in a single query.
- [ ] I feel ready for Exercise 5: Mixed Practice.

---

<div style="border-left: 4px solid #ff9800; background-color: #fff8e1; padding: 15px; margin: 20px 0; border-radius: 0 8px 8px 0;">

## 🔮 A Look Ahead: From Groups to Full Queries

You’ve now practiced the core tools of Module 3: sorting, aggregating, grouping, and filtering groups. In the final exercise, **Mixed Practice**, you’ll combine **all** of these skills in complex, realistic business scenarios. You’ll be asked to:

- Sort results with `ORDER BY`.
- Limit with `LIMIT`.
- Calculate totals, averages, counts.
- Group by one or more columns.
- Filter groups with `HAVING`.
- Chain it all together in a single query.

This is where you become a **Data Artisan** – someone who can craft precise, powerful queries from scratch to answer any business question.

---

### 🏆 The Final Boss: Exercise 5

You have mastered the individual tools:

- **The Compass** (`ORDER BY`, `LIMIT`)
- **The Scale** (Aggregates)
- **The Buckets** (`GROUP BY`)
- **The Gatekeeper** (`HAVING`)

#### The Master Craftsman’s Test
**The Challenge of Exercise 5:**  
In the previous exercises, I told you which tool to use. In **Exercise 5: Mixed Practice**, I will only give you the **Business Question**. It will be up to you to decide the order, the grouping, and the filtering.

**Example of a Mixed Challenge:**  
*“Find the top 3 cities with at least 5 customers, sorted by the city name in reverse alphabetical order.”*  
To solve this, you’ll need to chain almost every skill you’ve learned in Module 3 into a single, elegant block of code.

---

### 🧠 The Artisan's Truth

> *“`WHERE` filters the noise before you group; `HAVING` filters the groups after you’ve measured them.”*

> *“A `GROUP BY` without an `ORDER BY` is a pile; adding the `ORDER BY` makes it a Rank.”*

> *“The Artisan doesn’t just build buckets – they decide which buckets are worth showing.”*

> *“A query is a story. `SELECT` is the ending, but `WHERE`, `GROUP BY`, and `HAVING` are the plot twists that make the ending meaningful.”*

> *“Complexity is not the goal; Clarity is. If you can answer a hard question with a short query, you are an Artisan.”*
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
    G["✅ Exercise 4<br/>HAVING Practice"] --> H
    H["⏳ Exercise 5<br/>Mixed Practice"] --> I
    I["✅ PRACTICE COMPLETE<br/>Ready for Quiz"]
    
    style A fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style B fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style C fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style D fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style E fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style F fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style G fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style H fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style I fill:#fff8e1,stroke:#ff9800,stroke-width:4px
```

| Previous Step | Next Step |
|:---:|:---:|
| [← Back to Exercise 3: GROUP BY Practice](./3-group-by-practice.md) | [Continue to Exercise 5: Mixed Practice →](./5-mixed-practice.md) |

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

**Level 1 | Module 3 | Practice Exercise 4 | Next: [Mixed Practice](./5-mixed-practice.md)**