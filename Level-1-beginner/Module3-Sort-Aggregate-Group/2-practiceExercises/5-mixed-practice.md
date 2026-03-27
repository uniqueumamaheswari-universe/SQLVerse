


# 🗄️🤖 SQL & GenAI Course
**🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost**

## 🧠 Exercise 5: Mixed Practice – The Master Craftsman’s Test

You’ve mastered sorting, measuring, grouping, and filtering groups. Now it’s time to **combine** all these skills in realistic business scenarios. In this final practice exercise, you’ll be given a **Business question** – not a hint about which SQL clause to use. You’ll need to decide the order, the grouping, and the filtering on your own.

---

## 🌌 SQLVerse Check-In

<div style="border-left: 4px solid #9c27b0; background-color: #f3e5f5; padding: 15px; margin: 20px 0; border-radius: 0 8px 8px 0;">

**You are now on E‑Commerce Planet.** You’ve learned each tool separately. Now you’ll forge them into a single blade.

Welcome to the **Master Craftsman’s Test**!  Here, the **"training wheels"** come off. In this exercise, I won’t tell you which clause to use. You’ll receive a business question, and you’ll need to decide whether to sort, limit, group, or filter groups – and in what order.  You must **craft** the full query for the given **Business need.**

### 🔍 SQLVerse Artisan's Objective

In this exercise, you will **synthesize** everything you’ve learned in Module 3. You’ll write queries that combine sorting, aggregation, grouping, and group filtering to answer real‑world business questions. By the end, you’ll be able to craft complex, elegant queries from a blank editor.

**The Final Descent:** You are now a fully equipped **Data Artisan**. You have the compass, the scale, the buckets, and the gatekeeper's key.

In this exercise, we simulate the "**Chaos of the Inbox.**" Requests will come in fast, and they will be messy. You must translate human language into perfect **SQL logic**.

**Objective:** Prove you can wield the full power of SQL to answer any business question.

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
    G["✅ Exercise 4<br/>HAVING Practice"] --> H
    H["📍 YOU ARE HERE<br/>🧠 Exercise 5<br/>Mixed Practice"] --> I
    I["✅ PRACTICE COMPLETE"] --> J
    J["🔄 RETURN TO MODULE GUIDE<br/>TO BEGIN EVALUATE"]
    
    style A fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style B fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style C fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style D fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style E fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style F fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style G fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style H fill:#fff8e1,stroke:#ff9800,stroke-width:4px
    style I fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style J fill:#e8f5e8,stroke:#4caf50,stroke-width:2px
```

You’ve completed Exercises 1–4. Now it’s time to put it all together.

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

You’ll work with the same tables as before. Here are quick reminders.

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

## 💡 Artisan's Pro‑Tips for Mixed Queries

1. **Think in Steps:** Read the question and break it down: *“What table(s) do I need? Do I need to group? Do I need to filter before or after grouping? Should I sort? Should I limit?”*

2. **Start Simple:** Write a basic query (e.g., just the `SELECT` and `FROM`), then add one clause at a time. Test after each addition.

3. **Remember the Choreography:** `WHERE` before `GROUP BY`, `HAVING` after `GROUP BY`, `ORDER BY` and `LIMIT` last.

4. **Aliases in `ORDER BY`** are fine, but don’t rely on them in `WHERE` or `HAVING` unless you’re sure your database supports it (SQLite does; be cautious elsewhere).

5. **Test with a `SELECT *` first** to see the raw data, then add your filters and aggregates.

---
### 🛠️ Data Enrichment: Expanding Your E‑Store Dataset

*Before diving into mixed queries, let’s add more data to make our analysis richer. You already added three products in the CTO Report (Laptop, Smartphone, Tablet). Now we’ll add new customers, more products, and some orders with their items.*

For **simple tables** (`customers`, `products`), you’ll write the `INSERT` statements yourself – this builds on your bulk‑insert skills. For **tables with foreign keys** (`orders`, `order_items`), we provide the statements to avoid errors while you still learn how they connect. You’ll retrieve the necessary IDs and plug them in.

---

#### A. New Customers (Bulk Insert – You Write)

Add the following customers to the `customers` table. Write a single `INSERT` statement to add all three.

| name | email | city |
|------|-------|------|
| Diana Prince | diana@email.com | Metropolis |
| Bruce Wayne | bruce@email.com | Gotham |
| Clark Kent | clark@email.com | Smallville |

> 💡 *The `customer_id` is auto‑incremented, so you don’t need to specify it. Use the correct column order: `name`, `email`, `city`.*

After inserting, run this query to see the IDs of your new customers. **Note them down for the next steps:**

```sql
SELECT customer_id, name FROM customers WHERE name IN ('Diana Prince', 'Bruce Wayne', 'Clark Kent');
```

---

#### B. New Products (Bulk Insert – You Write)

Add the following products to the `products` table. Write a single `INSERT` statement to add all three.

| product_name | category | price |
|--------------|----------|-------|
| Wireless Mouse | Electronics | 25.00 |
| Desk Lamp | Home | 35.00 |
| Monitor | Electronics | 250.00 |

> 💡 *The `product_id` is auto‑incremented.*

After inserting, run this query to see the IDs of your new products. **Note them down for the next steps:**

```sql
SELECT product_id, product_name FROM products WHERE product_name IN ('Wireless Mouse', 'Desk Lamp', 'Monitor');
```

---

#### C. New Orders (Provided Statements)

Use the **customer IDs** you noted from step A to place orders. Replace `[id_diana]`, `[id_bruce]`, `[id_clark]` with the actual numbers.

```sql
INSERT INTO orders (customer_id, order_date) VALUES
([id_diana], '2025-11-01'),
([id_bruce], '2025-11-02'),
([id_clark], '2025-11-03');
```

After inserting, run this query to get the new order IDs. **Note them down:**

```sql
SELECT order_id, customer_id FROM orders WHERE order_date >= '2025-11-01';
```

---

#### D. New Order Items (Provided Statements)

Use the **order IDs** from step C and the **product IDs** from step B to add items.

Replace `[order_diana]`, `[order_bruce]`, `[order_clark]`, `[mouse_id]`, `[lamp_id]`, `[monitor_id]` with the actual numbers.

```sql
-- Items for Diana's order
INSERT INTO order_items (order_id, product_id, quantity) VALUES
([order_diana], [mouse_id], 2),
([order_diana], [monitor_id], 1);

-- Item for Bruce's order
INSERT INTO order_items (order_id, product_id, quantity) VALUES
([order_bruce], [lamp_id], 1);

-- Item for Clark's order
INSERT INTO order_items (order_id, product_id, quantity) VALUES
([order_clark], [mouse_id], 1);
```

---

#### E. Precision Practice: Targeted Updates

After you’ve enriched the dataset, test your `UPDATE` skills with these precise changes. Use the IDs you noted earlier.

1. **Price Adjustment:** Increase the price of ‘Wireless Mouse’ to $29.99.  
   *Use the product ID you noted for Wireless Mouse.*

2. **City Correction:** Clark Kent moved to Metropolis. Update his city to ‘Metropolis’.  
   *Use his customer ID.*

3. **Order Item Update:** Diana’s order included 2 Wireless Mice. Add one more Wireless Mouse to her order (increase the quantity by 1).  
   *Use the order ID for Diana and the product ID for Wireless Mouse.*

```sql
-- Example for #3 (replace with your actual IDs):
UPDATE order_items
SET quantity = quantity + 1
WHERE order_id = [order_diana] AND product_id = [mouse_id];
```
---

## 🧪 Mixed Practice Challenges

For each challenge, use the **Artisan's Query Rhythm**:
- **The Question** – read the business request.
- **The Query** – write your SQL.
- **Expected Result** – predict what you should see.
- **Try it now** – run it in Tab 2.
- **Reflect & Learn** – compare actual with expectation.

---

### 🥇 Challenge 1: The “High‑Velocity” Report
*Marketing needs to find the top 3 cities with the most customers, but only for cities that have at least 2 customers.*

```sql
-- Your query here
-- Save as: 5-1-top-cities.sql
```

---

### 🥈 Challenge 2: The “Inventory Audit”
*The Warehouse Manager wants a list of categories where the most expensive item is over $500, but they want the list sorted alphabetically by category name.*

```sql
-- Your query here
-- Save as: 5-2-categories-over-500.sql
```

---

### 🥉 Challenge 3: The “Sales Performance” Snapshot
*Identify products (by `product_id`) that have sold a total quantity of more than 3 units. (Use the `order_items` table only.)*

```sql
-- Your query here
-- Save as: 5-3-popular-products.sql
```

---

### 📦 Challenge 4: The “Premium Shelf” Analysis
*Which product categories have an average price greater than $100 **and** at least 2 products? Show category, average price, and product count.*

```sql
-- Your query here
-- Save as: 5-4-premium-categories.sql
```

---

### 🧾 Challenge 5: The “Loyalty” Report (Customer‑ID Edition)
*Which customers (by `customer_id`) have placed more than 1 order? Show `customer_id` and the number of orders, sorted by number of orders descending. (Use the `orders` table only.)*

> 💡 **Preview Note:** In Module 4, you’ll learn to join this result with the `customers` table to show actual customer names.

```sql
-- Your query here
-- Save as: 5-5-loyal-customers.sql
```

---

### 🏙️ Challenge 6: The “Regional Density” Scorecard
*Find cities that have at least 2 customers. Show city and customer count, sorted by count descending. (Use the `customers` table only.)*

```sql
-- Your query here
-- Save as: 5-6-regional-density.sql
```

---

### 🗓️ Challenge 7: The “Peak Season” Analysis
*Find the month (as ‘YYYY‑MM’) with the most orders. Show month and order count. (Use the `orders` table only.)*

```sql
-- Your query here
-- Save as: 5-7-peak-season.sql
```

---

### 🛒 Challenge 8: The “Top Seller” Dashboard (Product Edition)
*What is the product ID that has sold the most total quantity? Show `product_id` and total quantity, sorted descending, and limit to 1. (Use `order_items` table only.)*

```sql
-- Your query here
-- Save as: 5-8-top-seller-product.sql
```

---

### 👑 Challenge 9: The “VIP” Leaderboard (Customer‑ID Edition)
*Which customer (by `customer_id`) has placed the most orders? Show `customer_id` and order count, sorted descending, and limit to 1. (Use the `orders` table only.)*

> 💡 **Preview Note:** In Module 4, you’ll learn to join this result with the `customers` table to discover the name of your VIP customer.

```sql
-- Your query here
-- Save as: 5-9-vip-customer-id.sql
```

### 🏆 Challenge 10: The “Category Leaderboard”
*Which product categories have the most products? Show the top 3 categories by number of products, sorted from highest to lowest.*

```sql
-- Your query here
-- Save as: 5-10-category-leaderboard.sql
```

> 💡 **Preview Note:** In Module 4, you’ll join this with sales data to see which popular categories also generate the most revenue.

---

## 🎯 Your Progress Tracker

| Challenge | Status (✅/⏳) | Confidence (1‑5) |
|-----------|---------------|------------------|
| 1: High‑Velocity (Cities) | | |
| 2: Inventory Audit | | |
| 3: Sales Performance | | |
| 4: Premium Shelf | | |
| 5: Loyalty (Customer ID) | | |
| 6: Regional Density | | |
| 7: Peak Season | | |
| 8: Top Seller (Product ID) | | |
| 9: VIP (Customer ID) | | |
| 10: Category Leaderboard | | |

---

## 🌍 Real‑World Application: What You Just Built

- **Top Cities** – Marketing and sales teams use this to target high‑density areas.
- **Average Order Size by City** – Helps regional managers understand customer behavior.
- **Product Popularity** – Inventory managers rely on this to stock best‑sellers.
- **High‑Value Categories** – Strategic planners focus resources on premium categories.
- **Repeat Customers** – Loyalty programs are designed around frequent buyers.
- **Profitable Orders** – Helps identify high‑value transactions for discounts or follow‑up.
- **City‑Level Performance** – Regional performance dashboards.
- **Top Categories by Revenue** – Executive summaries highlight key business drivers.

You’ve just simulated the work of a real data analyst: taking vague business questions and translating them into precise SQL that delivers actionable insights.

---

## ✅ When You're Done

- [ ] I successfully ran all 10 challenges (or made a solid attempt on each).
- [ ] I saved each query in my Vault with the correct filename.
- [ ] I can independently decide which SQL clauses to use for a given business question.
- [ ] I understand the choreography of a complex query.
- [ ] I feel ready for the Module 3 Quiz.

---
## 🌟 Words of Encouragement

<div style="border: 3px solid #9c27b0; border-radius: 10px; padding: 20px; margin: 25px 0; background: linear-gradient(135deg, #f3e5f5 0%, #e1bee7 100%);">

### *You've Reached the Summit of Module 3*

You've just completed the **Master Craftsman's Test** – the final practice exercise where you blended sorting, aggregation, grouping, and group filtering into a single, powerful query. This is no small achievement.

Remember back to File 1, when `ORDER BY` felt like magic. Now you're chaining `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`, and `LIMIT` without hesitation. You've moved from collecting data to orchestrating it.

Along the way, you built two professional portfolio pieces:

- **📊 CEO Report** – E‑Commerce Analytics Dashboard, proving you can turn business questions into actionable insights.
- **💻 CTO Report** – Methodology & Discipline, demonstrating your rigorous process and technical hygiene.

These reports are not just exercises – they are **evidence of your Artisan status**.

**The SQLVerse is richer because of the Artisan you're becoming.**

Take a moment to appreciate your journey. Then, return to your Module 3 Guide, reflect on what you've built, and step confidently into the **EVALUATE** stage.

**Your portfolio is now two reports stronger. Your skills are ready for the next planet.**

</div>

---

<div style="border-left: 4px solid #ff9800; background-color: #fff8e1; padding: 15px; margin: 20px 0; border-radius: 0 8px 8px 0;">

## 🔮 A Look Ahead: Module 4 – Joining Tables

You’ve mastered querying single tables. But real‑world data lives in **many tables** connected by keys. In Module 4, you’ll learn to **join** tables, combining customers with their orders, orders with products, and more. You’ll be able to answer questions like:

- *“What are the names of customers who bought the most expensive product?”*
- *“Which product categories generate the highest revenue?”*

The skills you’ve built here – sorting, aggregating, grouping, filtering – will be the foundation for those powerful multi‑table queries.

---

### 🧠 The Artisan's Truth

> *“A single table is a sketch. Joins turn it into a masterpiece.”*

> *“The Artisan doesn’t just query data – they connect it.”*

> *“Complexity is often just simple tools used in a specific sequence. Once you master the sequence, the complexity disappears.”*
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
    H["✅ Exercise 5<br/>Mixed Practice"] --> I
    I["✅ PRACTICE COMPLETE"] --> J
    J["🔄 RETURN TO MODULE GUIDE<br/>TO BEGIN EVALUATE"]
    
    style A fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style B fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style C fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style D fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style E fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style F fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style G fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style H fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style I fill:#c8e6c9,stroke:#4caf50,stroke-width:2px
    style J fill:#e8f5e8,stroke:#4caf50,stroke-width:2px
```

| Previous Step | Next Step |
|:---:|:---:|
| [← Back to Exercise 4: HAVING Practice](./4-having-practice.md) | [Return to Module 3 Guide →](../MODULE3_GUIDE.md) |

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

**Level 1 | Module 3 | Practice Exercise 5 | Next: Module 3 Guide**