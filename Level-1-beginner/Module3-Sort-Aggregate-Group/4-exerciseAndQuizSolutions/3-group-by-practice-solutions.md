


# 🗄️🤖 SQL & GenAI Course
**🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost**

## 🧠 Exercise 3: GROUP BY Practice – Solutions

This document contains the solutions for all challenges in **Exercise 3: GROUP BY Practice**. Use it to check your work, understand alternative approaches, and reinforce your learning.

---

## 🌌 SQLVerse Check-In

<div style="border-left: 4px solid #9c27b0; background-color: #f3e5f5; padding: 15px; margin: 20px 0; border-radius: 0 8px 8px 0;">

**The laws of the SQLVerse are no longer mysteries to you. You have the keys.** You've mastered grouping on E‑Commerce Planet. Now check your solutions and see the Artisan's approach.

**The difference between a coder and an Artisan is discipline.**

</div>

---

### 📍 Your Current Stage

```mermaid
flowchart LR
    Quiz["✅ Quiz Complete<br/>📝 Module 3 Quiz"] --> Ex1
    Ex1["✅ Exercise 1 Solutions<br/>Sorting Basics"] --> Ex2
    Ex2["✅ Exercise 2 Solutions<br/>Aggregate Basics"] --> Ex3
    Ex3["📍 YOU ARE HERE<br/>📖 Exercise 3 Solutions<br/>GROUP BY Practice"] --> Ex4
    Ex4["⏳ Exercise 4 Solutions<br/>HAVING Practice"] --> Ex5
    Ex5["⏳ Exercise 5 Solutions<br/>Mixed Practice"] --> QuizAns
    QuizAns["⏳ Quiz Answers<br/>module3-quiz-answers.md"] --> Complete
    Complete["🎉 MODULE 3 COMPLETE<br/>Ready for Module 4"] --> Guide
    Guide["🔄 Return to Module 3 Guide<br/>for Reflection & Begin Module 4"]
    
    style Quiz fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style Ex1 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex2 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex3 fill:#fff8e1,stroke:#ff9800,stroke-width:4px
    style Ex4 fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style Ex5 fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style QuizAns fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style Complete fill:#a5d6a7,stroke:#2e7d32,stroke-width:2px
    style Guide fill:#fff8e1,stroke:#ff9800,stroke-width:2px
```

---


### A1: Products per Category
```sql
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category;
```
**Explanation:** Groups rows by `category` and counts the number of products in each group.

---

### A2: Avg Price per Category
```sql
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category;
```
**Explanation:** Groups by category and computes the average price for each.

---

### A3: Price Range per Category
```sql
SELECT category, MIN(price) AS cheapest, MAX(price) AS most_expensive
FROM products
GROUP BY category;
```
**Explanation:** For each category, finds the minimum and maximum price.

---

### B4: Orders per Customer
```sql
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id;
```
**Explanation:** Counts how many orders each customer placed.

---

### B5: Active Customers (HAVING)
```sql
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;
```
**Explanation:** Groups by customer, counts orders, then filters to keep only those with more than 1 order.

---

### C6: Quantity per Product
```sql
SELECT product_id, SUM(quantity) AS total_quantity
FROM order_items
GROUP BY product_id;
```
**Explanation:** Sums the quantity for each product ID.

---

### C7: Avg Quantity per Product
```sql
SELECT product_id, AVG(quantity) AS avg_quantity
FROM order_items
GROUP BY product_id;
```
**Explanation:** Averages the quantity per order item for each product.

---

### D8: Products by Price Tier
```sql
SELECT
    CASE
        WHEN price < 100 THEN 'Low'
        WHEN price BETWEEN 100 AND 500 THEN 'Medium'
        ELSE 'High'
    END AS price_tier,
    COUNT(*) AS product_count
FROM products
GROUP BY price_tier;
```
**Explanation:** Creates a price tier using a `CASE` expression, then groups by that derived column and counts.

---

### D9: Category × Price Tier
```sql
SELECT
    category,
    CASE
        WHEN price < 100 THEN 'Low'
        WHEN price BETWEEN 100 AND 500 THEN 'Medium'
        ELSE 'High'
    END AS price_tier,
    COUNT(*) AS product_count
FROM products
GROUP BY category, price_tier;
```
**Explanation:** Groups by both category and the derived price tier, showing the count for each combination (sub‑segments).

---

### E10: Customers per City
```sql
SELECT city, COUNT(*) AS customer_count
FROM customers
GROUP BY city;
```
**Explanation:** Counts how many customers live in each city.

---

### E11: The Golden Rule Trap
```sql
-- This query will fail:
SELECT city, name FROM customers GROUP BY city;
```
**Explanation:** The `name` column is not in `GROUP BY` and is not an aggregate. The database doesn't know which name to show when multiple customers share a city. This demonstrates the Golden Rule.

---

### F12: Largest Order
```sql
SELECT order_id, COUNT(*) AS item_count
FROM order_items
GROUP BY order_id
ORDER BY item_count DESC
LIMIT 1;
```
**Explanation:** Groups by order ID, counts the number of items in each order, sorts descending, and keeps the top result.

---
### 🧭 EVALUATE Navigation

```mermaid
flowchart LR
    Quiz["✅ Quiz Complete<br/>📝 Module 3 Quiz"] --> Ex1
    Ex1["✅ COMPLETED<br/>📖 Exercise 1 Solutions<br/>Sorting Basics"] --> Ex2
    Ex2["✅ COMPLETED<br/>📖 Exercise 2 Solutions<br/>Aggregate Basics"] --> Ex3
    Ex3["✅ COMPLETED<br/>📖 Exercise 3 Solutions<br/>GROUP BY Practice"] --> Ex4
    Ex4["⏳ Exercise 4 Solutions<br/>HAVING Practice"] --> Ex5
    Ex5["⏳ Exercise 5 Solutions<br/>Mixed Practice"] --> QuizAns
    QuizAns["⏳ Quiz Answers<br/>module3-quiz-answers.md"] --> Complete
    Complete["🎉 MODULE 3 COMPLETE<br/>Ready for Module 4"] --> Guide
    Guide["🔄 Return to Module 3 Guide<br/>for Reflection & Begin Module 4"]
    
    style Quiz fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style Ex1 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex2 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex3 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex4 fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style Ex5 fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style QuizAns fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style Complete fill:#a5d6a7,stroke:#2e7d32,stroke-width:2px
    style Guide fill:#fff8e1,stroke:#ff9800,stroke-width:2px
```

| Previous Step | Next Step |
|:---:|:---:|
| [← Back to Exercise 2 Solutions](./2-aggregate-basics-solutions.md) | [Continue to Exercise 4 Solutions →](./4-having-practice-solutions.md) |

