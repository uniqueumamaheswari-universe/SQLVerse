


# 🗄️🤖 SQL & GenAI Course
**🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost**

## 📖 Exercise 3 Solutions: Logical Operators & IN/BETWEEN

This document contains the solutions for all challenges in **Exercise 3: Logical Operators & IN/BETWEEN**. Use it to check your work, understand alternative approaches, and reinforce your learning.

---

## 🌌 SQLVerse Check-In

<div style="border-left: 4px solid #9c27b0; background-color: #f3e5f5; padding: 15px; margin: 20px 0; border-radius: 0 8px 8px 0;">

**The laws of the SQLVerse are no longer mysteries to you. You have the keys.** You've mastered logical operators and ranges on E-Commerce Planet. Now check your solutions and see the Artisan's approach.

**The difference between a coder and an Artisan is discipline.**

</div>

---
### 📍 Your Current Stage


```mermaid
flowchart LR
    Quiz["✅ Quiz Complete<br/>📝 Module 2 Quiz"] --> Ex1
    Ex1["✅ COMPLETED<br/>📖 Exercise 1 Solutions<br/>Basic SELECT"] --> Ex2
    Ex2["✅ COMPLETED<br/>📖 Exercise 2 Solutions<br/>WHERE Clause"] --> Ex3
    Ex3["📍 YOU ARE HERE<br/>📖 Exercise 3 Solutions<br/>Logical & IN/BETWEEN"] --> Ex4
    Ex4["⏳ Exercise 4 Solutions<br/>LIKE & NULL"] --> Ex5
    Ex5["⏳ Exercise 5 Solutions<br/>Mixed Practice"] --> QuizAns
    QuizAns["⏳ Quiz Answers<br/>module2-sql-quiz-answers.md"] --> Complete
    Complete["🎉 MODULE 2 COMPLETE<br/>Ready for Module 3"] --> Guide
    Guide["🔄 Return to Module 2 Guide<br/>for Reflection & Begin Module 3"]
    
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

You are currently reviewing **Exercise 3 Solutions**. After this, you'll work through Exercises 4-5 solutions, then check your quiz answers, and finally complete Module 2.

---

## 📝 Challenge Solutions

### Challenge 1: Affordable Electronics

**Question:** Find products that are in the 'Electronics' category **and** have a price less than 200.

**Solution:**
```sql
SELECT product_name, category, price
FROM products
WHERE category = 'Electronics' AND price < 200;
```

**Expected Result:** Headphones (150).  
**Row Count:** 1 row

| product_name | category | price |
|--------------|----------|-------|
| Headphones | Electronics | 150.00 |

**What you're seeing:** The `AND` operator requires **both** conditions to be true. Headphones are Electronics (✓) and price < 200 (150 < 200 ✓). Laptop is Electronics but price 1200 is not < 200, so it's excluded.

---

### Challenge 2: Customers in NY or Chicago

**Question:** List customers who live in 'New York' or 'Chicago'.

**Solution using `OR`:**
```sql
SELECT name, city
FROM customers
WHERE city = 'New York' OR city = 'Chicago';
```

**Solution using `IN` (cleaner):**
```sql
SELECT name, city
FROM customers
WHERE city IN ('New York', 'Chicago');
```

**Expected Result:** Alice Smith (NY), Bob Johnson (Chicago), Charlie Lee (NY), Eva Gomez (Chicago).  
**Row Count:** 4 rows

| name | city |
|------|------|
| Alice Smith | New York |
| Bob Johnson | Chicago |
| Charlie Lee | New York |
| Eva Gomez | Chicago |

**What you're seeing:** The `OR` operator returns rows that satisfy **at least one** condition. The `IN` version is cleaner and more readable – the Artisan's choice when checking against a list.

**Artisan's Insight:** `IN` is like giving the database a shopping list: "Give me any of these cities." It's more elegant than chaining multiple `OR`s.

---

### Challenge 3: Mid-Range Products

**Question:** Find products with prices between 50 and 100 (inclusive).

**Solution:**
```sql
SELECT product_name, price
FROM products
WHERE price BETWEEN 50 AND 100;
```

**Expected Result:** Coffee Maker (80), Blender (60).  
**Row Count:** 2 rows

| product_name | price |
|--------------|-------|
| Coffee Maker | 80.00 |
| Blender | 60.00 |

**What you're seeing:** `BETWEEN` is **inclusive** – it includes both the lower and upper bounds. A product priced at exactly 50 or exactly 100 would be included (if any existed).

---

### Challenge 4: Orders in Q4 2025

**Question:** Find all orders placed between October 1, 2025 and December 31, 2025 (inclusive).

**Solution:**
```sql
SELECT order_id, customer_id, order_date
FROM orders
WHERE order_date BETWEEN '2025-10-01' AND '2025-12-31';
```

**Expected Result:** All orders in Oct–Dec 2025 (all 5 orders).  
**Row Count:** 5 rows

| order_id | customer_id | order_date |
|----------|-------------|------------|
| 1 | 1 | 2025-10-01 |
| 2 | 2 | 2025-10-01 |
| 3 | 1 | 2025-10-03 |
| 4 | 4 | 2025-10-04 |
| 5 | 5 | 2025-10-05 |

**What you're seeing:** `BETWEEN` works beautifully with dates. All October dates are included because they fall within the range. Remember: dates must be in ISO format with quotes.

---

### Challenge 5: Bulk Orders

**Question:** Find order items where the quantity is between 2 and 5 (inclusive).

**Solution:**
```sql
SELECT order_id, product_id, quantity
FROM order_items
WHERE quantity BETWEEN 2 AND 5;
```

**Expected Result:** The order item with quantity 2.  
**Row Count:** 1 row

| order_id | product_id | quantity |
|----------|------------|----------|
| 3 | 4 | 2 |

**What you're seeing:** `BETWEEN` works with any numeric data type. Even though our maximum quantity is 2, the query correctly returns it. If there were items with quantities 3, 4, or 5, they'd also appear.

---

### Challenge 6: Products Not in Electronics or Appliances

**Question:** Find products whose category is **not** 'Electronics' and **not** 'Appliances'.

**Solution using `NOT IN`:**
```sql
SELECT product_name, category
FROM products
WHERE category NOT IN ('Electronics', 'Appliances');
```

**Solution using `AND` with `<>`:**
```sql
SELECT product_name, category
FROM products
WHERE category <> 'Electronics' AND category <> 'Appliances';
```

**Expected Result:** SQL Essentials Book (Books category only).  
**Row Count:** 1 row

| product_name | category |
|--------------|----------|
| SQL Essentials Book | Books |

**What you're seeing:** `NOT IN` excludes any row matching the list. The book is the only product that's neither Electronics nor Appliances. The `AND` version is more verbose but achieves the same result.

---

### Challenge 7: Books or Cheap Electronics

**Question:** Find products that are either in the 'Books' category **or** are electronics with a price less than 200.

**Solution:**
```sql
SELECT product_name, category, price
FROM products
WHERE category = 'Books' 
   OR (category = 'Electronics' AND price < 200);
```

**Expected Result:**
- SQL Essentials Book (Books)
- Headphones (Electronics, price 150 < 200)

**Row Count:** 2 rows

| product_name | category | price |
|--------------|----------|-------|
| SQL Essentials Book | Books | 45.00 |
| Headphones | Electronics | 150.00 |

**What you're seeing:** This is where parentheses become critical. The query says: "Give me products that are either in Books, **or** (Electronics that are cheap)." Without parentheses, the logic would be different due to operator precedence.

**Artisan's Insight:** When mixing `AND` and `OR`, **always use parentheses**. They cost nothing and save hours of debugging. The database follows a precedence order (`NOT` > `AND` > `OR`), but why rely on memory when parentheses make your intent crystal clear?

---

## 🎯 Key Takeaways from Exercise 3

| Concept | Takeaway |
|---------|----------|
| **AND** | Both conditions must be true – narrows results |
| **OR** | At least one condition must be true – broadens results |
| **IN / NOT IN** | Cleaner than multiple ORs for list matching |
| **BETWEEN** | Inclusive range for numbers and dates |
| **Parentheses** | Essential when mixing AND and OR |
| **Operator precedence** | `NOT` > `AND` > `OR` – but use parentheses anyway! |

---

## 💡 Artisan's Reflection

After completing these exercises, ask yourself:

- [ ] Can I write queries using `AND` and `OR` correctly?
- [ ] Do I understand when to use `IN` instead of multiple `OR`s?
- [ ] Can I use `BETWEEN` for both numbers and dates?
- [ ] Do I always use parentheses when mixing `AND` and `OR`?
- [ ] Can I explain the difference between `IN` and `NOT IN`?

**If yes, you're ready for Exercise 4: LIKE & NULL!**

---


### 🧭 EVALUATE Navigation

```mermaid
flowchart LR
    Quiz["✅ Quiz Complete<br/>📝 Module 2 Quiz"] --> Ex1
    Ex1["✅ COMPLETED<br/>📖 Exercise 1 Solutions<br/>Basic SELECT"] --> Ex2
    Ex2["✅ COMPLETED<br/>📖 Exercise 2 Solutions<br/>WHERE Clause"] --> Ex3
    Ex3["✅ COMPLETED<br/>📖 Exercise 3 Solutions<br/>Logical & IN/BETWEEN"] --> Ex4
    Ex4["⏳ Exercise 4 Solutions<br/>LIKE & NULL"] --> Ex5
    Ex5["⏳ Exercise 5 Solutions<br/>Mixed Practice"] --> QuizAns
    QuizAns["⏳ Quiz Answers<br/>module2-sql-quiz-answers.md"] --> Complete
    Complete["🎉 MODULE 2 COMPLETE<br/>Ready for Module 3"] --> Guide
    Guide["🔄 Return to Module 2 Guide<br/>for Reflection & Begin Module 3"]
    
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
| [← Back to Exercise 2 Solutions](./2-where-operators-solutions.md) | [Continue to Exercise 4 Solutions →](./4-like-and-null-solutions.md) |

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

**Level 1 | Module 2 | Exercise 3 Solutions | Next: [LIKE & NULL Solutions](./4-like-and-null-solutions.md)**

---

**Exercise 3 Solutions complete and perfectly aligned!** 🚀