



# 🗄️🤖 SQL & GenAI Course
**🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost**

## 📖 Module 2 Quiz – Solutions

This document contains the answers and explanations for the **Module 2 Quiz**. Use it to check your work and deepen your understanding.

---

## 🌌 SQLVerse Check-In

<div style="border-left: 4px solid #9c27b0; background-color: #f3e5f5; padding: 15px; margin: 20px 0; border-radius: 0 8px 8px 0;">

**The laws of the SQLVerse are no longer mysteries to you. You have the keys.** You've journeyed across Education Planet, mastered E-Commerce Planet, and now stand at the gateway to Module 3.

**The difference between a coder and an Artisan is discipline.**

</div>

---
### 📍 Your Current Stage

```mermaid
flowchart LR
    Quiz["✅ Quiz Complete<br/>📝 Module 2 Quiz"] --> Ex1
    Ex1["✅ COMPLETED<br/>📖 Exercise 1 Solutions<br/>Basic SELECT"] --> Ex2
    Ex2["✅ COMPLETED<br/>📖 Exercise 2 Solutions<br/>WHERE Clause"] --> Ex3
    Ex3["✅ COMPLETED<br/>📖 Exercise 3 Solutions<br/>Logical & IN/BETWEEN"] --> Ex4
    Ex4["✅ COMPLETED<br/>📖 Exercise 4 Solutions<br/>LIKE & NULL"] --> Ex5
    Ex5["✅ COMPLETED<br/>📖 Exercise 5 Solutions<br/>Mixed Practice"] --> QuizAns
    QuizAns["📍 YOU ARE HERE<br/>📖 Quiz Answers"] --> Complete
    Complete["🎉 MODULE 2 COMPLETE<br/>Ready for Module 3"] --> Guide
    Guide["🔄 Return to Module 2 Guide<br/>for Reflection & Begin Module 3"]
    
    style Quiz fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style Ex1 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex2 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex3 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex4 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex5 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style QuizAns fill:#fff8e1,stroke:#ff9800,stroke-width:4px
    style Complete fill:#a5d6a7,stroke:#2e7d32,stroke-width:2px
    style Guide fill:#fff8e1,stroke:#ff9800,stroke-width:2px
```

You are currently reviewing the **Quiz Answers**. This is the final step before completing Module 2!

---

## 🎉 CONGRATULATIONS! MODULE 2 IS COMPLETE

<div style="border: 3px solid #4caf50; border-radius: 10px; padding: 25px; margin: 30px 0; background: linear-gradient(135deg, #e8f5e8, #c8e6c9);">

### 🏆 **You've Done It, Artisan!**

You have successfully completed **all seven concept files**, **five practice exercises**, and the **Module 2 Quiz**. You've written queries that:

| Exercise | What You Mastered |
|----------|-------------------|
| **1** | Basic SELECT and column selection |
| **2** | Filtering with WHERE and comparison operators |
| **3** | Logical operators, IN, and BETWEEN |
| **4** | Pattern matching with LIKE and NULL handling |
| **5** | All concepts combined in complex scenarios |

### 🎯 **Your New Skill Sigils**

| Skill Area | Verified Competency |
|------------|---------------------|
| **Basic Retrieval** | `SELECT`, `FROM`, column selection |
| **Filtering** | `WHERE`, comparison operators, logical operators |
| **Clean Filters** | `IN`, `BETWEEN` |
| **Pattern Matching** | `LIKE`, wildcards (`%`, `_`) |
| **NULL Handling** | `IS NULL`, `IS NOT NULL` |
| **Presentation** | `DISTINCT`, aliases (`AS`) |
| **Portfolio Ready** | Completed CEO Report in File 7 |

### 🌌 **Granted the Title of:**
# **SQLVERSE NAVIGATOR**

*"You have journeyed across Education, E-Commerce, HR, and Fintech planets. The laws of the SQLVerse are now yours to command."*

### 🚀 **What's Next?**

| Step | Action |
|------|--------|
| **1** | ✅ Review your quiz answers below |
| **2** | ✅ Celebrate your achievement |
| **3** | 🔄 Return to the Module 2 Guide for final reflection |
| **4** | 🚀 Begin Module 3: Sorting, Aggregation & Grouping |

**The SQLVerse is yours. Go forth and explore every planet you come across.**

</div>

---

## 📋 Part 1: Multiple Choice – Answers

| # | Answer | Explanation |
|---|--------|-------------|
| **1** | **c) `WHERE`** | The `WHERE` clause is specifically designed to filter rows based on conditions. |
| **2** | **b) `WHERE column IS NULL`** | `NULL` is not a value, so it cannot be compared with `=`. Always use `IS NULL` or `IS NOT NULL`. |
| **3** | **c) `WHERE price BETWEEN 50 AND 100`** | `BETWEEN` is inclusive and the cleanest way to express ranges. |
| **4** | **b) Zero or more characters** | `%` matches any number of characters (including zero). `_` matches exactly one. |
| **5** | **b) `SELECT * FROM customers WHERE city IN ('New York', 'Chicago')`** | `IN` is the cleanest way to match any value in a list. Option a is missing the second column reference. |
| **6** | **b) The `WHERE` clause executes before `SELECT`, so the alias doesn't exist yet** | This is the key insight about execution order – aliases are created in `SELECT`, which runs after `WHERE`. |
| **7** | **a) It removes duplicate rows based on all selected columns** | `DISTINCT` looks at the combination of all selected columns to determine uniqueness. |
| **8** | **b) All products not in the Electronics category** | `<>` means "not equal to." It excludes Electronics but keeps everything else. |
| **9** | **c) `YYYY-MM-DD`** | This is the ISO standard date format and works reliably across all SQL databases. |
| **10** | **c) `NOT`** | `NOT` has the highest precedence, followed by `AND`, then `OR`. Use parentheses to be safe! |

---

## 📝 Part 2: Write the Query – Solutions

**11. Unique cities**

```sql
SELECT DISTINCT city
FROM customers;
```

**12. Affordable Electronics**

```sql
SELECT product_name, price
FROM products
WHERE category = 'Electronics' AND price < 200;
```

**13. Customers missing phone numbers**

```sql
SELECT name, email, city
FROM customers
WHERE phone IS NULL;
```

**14. Orders in October 2025**

```sql
SELECT order_id, customer_id, order_date
FROM orders
WHERE order_date BETWEEN '2025-10-01' AND '2025-10-31';
```

**15. Names starting with 'A' or ending with 'e'**

```sql
SELECT 
    name AS "Customer Name",
    email AS "Email Address"
FROM customers
WHERE name LIKE 'A%' OR name LIKE '%e';
```

---

## 🧠 Part 3: Conceptual Questions – Sample Answers

**16. Difference between `=` and `LIKE`**

`=` requires an exact, complete match – every character must be identical. `LIKE` allows pattern matching using wildcards (`%` and `_`). Use `=` when you know the exact value (e.g., `city = 'Chicago'`). Use `LIKE` when you only know part of the value (e.g., `email LIKE '%gmail.com'` to find all Gmail addresses).

---

**17. Why can't you use `= NULL`?**

`NULL` means "unknown" or "missing." You cannot compare something to an unknown – the result is also unknown (not true or false). In SQL, this unknown result is treated as false in `WHERE` clauses, so no rows would be returned. The correct way is to use `IS NULL` or `IS NOT NULL`, which are special operators designed to check for the presence or absence of a value.

---

**18. Order of execution and aliases**

The order of execution is: `FROM` → `WHERE` → `SELECT` → `DISTINCT` → `ORDER BY`. This matters because aliases are created in the `SELECT` step. Since `WHERE` runs before `SELECT`, the alias doesn't exist yet – that's why you can't use aliases in `WHERE`. However, `ORDER BY` runs after `SELECT`, so aliases work perfectly there.

---

**19. When to use `IN` vs multiple `OR`**

Use `IN` when checking against a list of values – it's cleaner, more readable, and often performs better. For example:
- `WHERE city IN ('New York', 'Chicago', 'Boston')` is much cleaner than:
- `WHERE city = 'New York' OR city = 'Chicago' OR city = 'Boston'`

The only time to prefer `OR` is when the conditions involve different columns, like `WHERE city = 'New York' OR category = 'Electronics'`.

---

**20. What it means to be a Data Artisan**

A coder writes syntax that works. A Data Artisan writes code that communicates intent, handles edge cases gracefully, and presents results with clarity. This mindset shaped my learning by pushing me to understand *why* things work, not just *how* to make them work. I've learned to ask "What would this query do with NULLs?" and "Will the CEO understand this report?" – questions that separate professionals from beginners.

---

### 🧭 EVALUATE Navigation

```mermaid
flowchart LR
    Quiz["✅ Quiz Complete<br/>📝 Module 2 Quiz"] --> Ex1
    Ex1["✅ COMPLETED<br/>📖 Exercise 1 Solutions<br/>Basic SELECT"] --> Ex2
    Ex2["✅ COMPLETED<br/>📖 Exercise 2 Solutions<br/>WHERE Clause"] --> Ex3
    Ex3["✅ COMPLETED<br/>📖 Exercise 3 Solutions<br/>Logical & IN/BETWEEN"] --> Ex4
    Ex4["✅ COMPLETED<br/>📖 Exercise 4 Solutions<br/>LIKE & NULL"] --> Ex5
    Ex5["✅ COMPLETED<br/>📖 Exercise 5 Solutions<br/>Mixed Practice"] --> QuizAns
    QuizAns["✅ COMPLETED<br/>📖 Quiz Answers"] --> Complete
    Complete["🎉 MODULE 2 COMPLETE<br/>Ready for Module 3"] --> Guide
    Guide["🔄 Return to Module 2 Guide<br/>for Reflection & Begin Module 3"]
    
    style Quiz fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style Ex1 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex2 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex3 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex4 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex5 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style QuizAns fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Complete fill:#a5d6a7,stroke:#2e7d32,stroke-width:2px
    style Guide fill:#fff8e1,stroke:#ff9800,stroke-width:2px
```

| Previous Step | Next Step |
|:---:|:---:|
| [← Back to Exercise 5 Solutions](./5-mixed-practice-solutions.md) | [Return to Module 2 Guide →](../MODULE2_GUIDE.md) |

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

**Level 1 | Module 2 | Quiz Answers | Next: [Return to Module 2 Guide](../MODULE2_GUIDE.md)**



