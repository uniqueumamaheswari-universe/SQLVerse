


# 🗄️🤖 SQL & GenAI Course
**🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost**

## 📖 Exercise 5 Solutions: Mixed Practice – The Grand Finale

This document contains the solutions for all challenges in **Exercise 5: Mixed Practice**. Use it to check your work, understand alternative approaches, and reinforce your learning. This exercise combines **every concept** from Module 2 – your final rehearsal before the CEO Report.

---

## 🌌 SQLVerse Check-In

<div style="border-left: 4px solid #9c27b0; background-color: #f3e5f5; padding: 15px; margin: 20px 0; border-radius: 0 8px 8px 0;">

**The laws of the SQLVerse are no longer mysteries to you. You have the keys.** You've completed your final mission on E-Commerce Planet. Now check your solutions and see how far you've come.

The CEO Report in **File 7** isn't just another exercise – it's your first professional portfolio piece, now safely stored in your Vault. What you've accomplished in this exercise is **comparable to that**. The queries you wrote here are built from the same cloth, the same logic, the same Artisan mindset.

You can ace any CEO Report from now on.

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
    Ex5["📍 YOU ARE HERE<br/>📖 Exercise 5 Solutions<br/>Mixed Practice"] --> QuizAns
    QuizAns["⏳ Quiz Answers<br/>module2-sql-quiz-answers.md"] --> Complete
    Complete["🎉 MODULE 2 COMPLETE<br/>Ready for Module 3"] --> Guide
    Guide["🔄 Return to Module 2 Guide<br/>for Reflection & Begin Module 3"]
    
    style Quiz fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style Ex1 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex2 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex3 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex4 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex5 fill:#fff8e1,stroke:#ff9800,stroke-width:4px
    style QuizAns fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style Complete fill:#a5d6a7,stroke:#2e7d32,stroke-width:2px
    style Guide fill:#fff8e1,stroke:#ff9800,stroke-width:2px
```

You are currently reviewing **Exercise 5 Solutions** – the final exercise. After this, you'll check your quiz answers and complete Module 2.

---

## 📝 Challenge Solutions

### Challenge 1: Unique Customer Cities

**Question:** What are all the unique cities where our customers live? Display the results alphabetically.

**Solution:**
```sql
SELECT DISTINCT city
FROM customers
ORDER BY city;
```

**Expected Result:** Austin, Boston, Chicago, Miami, New York, San Francisco, Seattle.  
**Row Count:** 7 rows

| city |
|------|
| Austin |
| Boston |
| Chicago |
| Miami |
| New York |
| San Francisco |
| Seattle |

**What you're seeing:** `DISTINCT` removes duplicate city names. Even though multiple customers live in New York and Chicago, each city appears only once. `ORDER BY` sorts alphabetically (preview of Module 3).

**Artisan's Insight:** This query answers a common business question: "Where are our customers located?" Marketing teams use this for targeted campaigns.

---

### Challenge 2: Customers with Complete Contact Info

**Question:** Find customers who have BOTH an email and a phone number. Display their name, email, and phone with user-friendly column aliases.

**Solution:**
```sql
SELECT 
    name AS "Customer Name",
    email AS "Email Address",
    phone AS "Phone Number"
FROM customers
WHERE email IS NOT NULL AND phone IS NOT NULL;
```

**Expected Result:** Customers with both email and phone.  
**Row Count:** 4 rows (Alice, Bob, Eva, Ivy)

| Customer Name | Email Address | Phone Number |
|---------------|---------------|--------------|
| Alice Smith | alice@email.com | 555-0101 |
| Bob Johnson | bob@email.com | 555-0102 |
| Eva Gomez | eva@email.com | 555-0105 |
| Ivy Patel | ivy@email.com | 555-0201 |

**What you're seeing:** This query combines:
- `IS NOT NULL` checks for both columns
- Aliases (`AS`) make column names readable
- The result is a clean contact list ready for a manager

---

### Challenge 3: Big Ticket or Bulk Items

**Question:** Find either:
- Products with a price greater than 100, OR
- Order items with quantity greater than 1

Display product name, price, and quantity (where applicable).

**Solution (two separate queries):**

```sql
-- Query 1: Big ticket products
SELECT 
    product_name AS "Product",
    price AS "Price",
    NULL AS "Quantity"  -- No quantity for products
FROM products
WHERE price > 100

UNION ALL

-- Query 2: Bulk order items
SELECT 
    p.product_name AS "Product",
    NULL AS "Price",    -- No price for order items
    oi.quantity AS "Quantity"
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
WHERE oi.quantity > 1;
```

**Expected Result:** 
- Products: Laptop (1200), Headphones (150)
- Order items: Headphones (quantity 2)

**What you're seeing:** This advanced query introduces:
- `UNION ALL` to combine results from two tables (preview of Module 4)
- `JOIN` to connect order_items with products
- `NULL` placeholders for columns that don't exist in each table

**Note for Module 2:** This is a preview of concepts you'll master in Modules 3 and 4. For now, focus on understanding the logic – each individual query uses only Module 2 concepts.

---

### Challenge 4: Electronics or Books Under $100

**Question:** Find products that are in the 'Electronics' or 'Books' category AND have a price less than 100.

**Solution:**
```sql
SELECT product_name, category, price
FROM products
WHERE (category = 'Electronics' OR category = 'Books')
  AND price < 100;
```

**Expected Result:** SQL Essentials Book (45) only.  
**Row Count:** 1 row

| product_name | category | price |
|--------------|----------|-------|
| SQL Essentials Book | Books | 45.00 |

**What you're seeing:** Parentheses are **critical** here. Without them, `AND` would bind more tightly than `OR`, completely changing the logic. The parentheses ensure the `OR` is evaluated first, then the `AND` applies to that result.

**Artisan's Insight:** When mixing `AND` and `OR`, **always use parentheses**. They cost nothing and save hours of debugging.

---

### Challenge 5: Missing Phone Numbers in Specific Cities

**Question:** Find customers who are missing phone numbers (NULL) and live in either 'New York' or 'Chicago'.

**Solution:**
```sql
SELECT name, city, phone
FROM customers
WHERE phone IS NULL 
  AND city IN ('New York', 'Chicago');
```

**Expected Result:** Charlie Lee (New York).  
**Row Count:** 1 row

| name | city | phone |
|------|------|-------|
| Charlie Lee | New York | NULL |

**What you're seeing:** This combines:
- `IS NULL` to find missing phones
- `IN` to check multiple cities
- `AND` to require both conditions

David Kim is in San Francisco, so excluded. Frank, Grace, Henry are in other cities, so excluded.

---

### Challenge 6: Product Category Summary

**Question:** List all unique product categories, and for each category, show an example product name. Use aliases to make the output read like a report.

**Solution (requires creative thinking):**

```sql
-- Approach 1: Using GROUP BY (preview of Module 3)
SELECT 
    category AS "Product Category",
    MIN(product_name) AS "Example Product"  -- Just picks one alphabetically
FROM products
GROUP BY category
ORDER BY category;

-- Approach 2: Using DISTINCT with a subquery (preview of Module 4)
-- For Module 2, focus on the concept rather than the exact syntax
```

**Expected Result:** 
| Product Category | Example Product |
|------------------|-----------------|
| Appliances | Blender (or Coffee Maker) |
| Books | SQL Essentials Book |
| Electronics | Headphones (or Laptop) |

**What you're seeing:** This challenge reveals a limitation of basic SQL. To get one example per category, you need aggregation (`GROUP BY`) or subqueries – both coming in later modules.

**Artisan's Insight:** Sometimes the best solution requires concepts you haven't learned yet. That's okay! The Artisan knows that learning is a journey. For now, focus on the `DISTINCT` part – getting unique categories – which you can do with:

```sql
SELECT DISTINCT category AS "Product Category"
FROM products
ORDER BY category;
```

---

### Challenge 7: The "All or Nothing" Query

**Question:** Find customers who either:
- Have a phone number AND live in a city starting with 'S', OR
- Have an email ending with 'email.com' AND are missing a phone number

**Solution:**
```sql
SELECT name, city, phone, email
FROM customers
WHERE (phone IS NOT NULL AND city LIKE 'S%')
   OR (email LIKE '%email.com' AND phone IS NULL);
```

**Expected Result:** Grace Chen (Seattle, NULL phone, email ends with email.com)  
**Row Count:** 1 row

| name | city | phone | email |
|------|------|-------|-------|
| Grace Chen | Seattle | NULL | grace@email.com |

**What you're seeing:** This complex query combines:
- Condition A: `phone IS NOT NULL AND city LIKE 'S%'` (customers with phones in S-cities)
- Condition B: `email LIKE '%email.com' AND phone IS NULL` (customers missing phones but with valid emails)
- `OR` between them (either condition can be true)

Let's break down why Grace qualifies:
- She doesn't satisfy Condition A (phone is NULL, not NOT NULL)
- But she **does** satisfy Condition B: 
  - `email LIKE '%email.com'` ✓ (grace@email.com)
  - `phone IS NULL` ✓ (Grace has no phone)

**Artisan's Insight:** Complex business logic often requires breaking the problem into smaller pieces, then combining them with `AND`/`OR`. This query mirrors real-world scenarios like "priority customers who either have complete contact info in certain cities, or have a valid email but missing phone."

---

### Challenge 8: The CEO Preview

**Question:** Write a query that could be part of the CEO Report. Find all customers in 'New York' or 'Chicago' who have provided a phone number, and display their name, city, and phone with professional aliases.

**Solution:**
```sql
SELECT 
    name AS "Customer Name",
    city AS "City",
    phone AS "Contact Number"
FROM customers
WHERE city IN ('New York', 'Chicago')
  AND phone IS NOT NULL;
```

**Expected Result:** 
| Customer Name | City | Contact Number |
|---------------|------|----------------|
| Alice Smith | New York | 555-0101 |
| Bob Johnson | Chicago | 555-0102 |
| Eva Gomez | Chicago | 555-0105 |

**Row Count:** 3 rows

**What you're seeing:** This is exactly the kind of query the CEO would ask for: "Give me a clean list of customers in our target cities who we can actually call." It combines:
- `IN` for multiple cities
- `IS NOT NULL` for complete contact info
- Aliases for professional presentation

**Artisan's Insight:** This query is CEO-ready. Clean, purposeful, and immediately useful. This is the standard you've achieved.

---

## 🎯 Key Takeaways from Exercise 5

| Concept | Takeaway |
|---------|----------|
| **DISTINCT** | Remove duplicates for unique lists |
| **IS NULL / IS NOT NULL** | Handle missing data correctly |
| **IN** | Clean matching against multiple values |
| **LIKE with wildcards** | Pattern matching for flexible searches |
| **AND/OR with parentheses** | Complex logic made clear |
| **Aliases** | Professional presentation |
| **Query composition** | Combine concepts to answer real business questions |

---

## 💡 Artisan's Reflection

After completing all five exercises, ask yourself:

- [ ] Can I write queries using every concept from Module 2?
- [ ] Do I understand how to combine multiple conditions correctly?
- [ ] Can I handle NULL values without falling into the `= NULL` trap?
- [ ] Do I use parentheses when mixing `AND` and `OR`?
- [ ] Can I present my results professionally with aliases?
- [ ] Am I ready to tackle the CEO Report?

**If yes – YOU'VE DONE IT! Module 2 is complete!**

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
    QuizAns["⏳ Quiz Answers<br/>module2-sql-quiz-answers.md"] --> Complete
    Complete["🎉 MODULE 2 COMPLETE<br/>Ready for Module 3"] --> Guide
    Guide["🔄 Return to Module 2 Guide<br/>for Reflection & Begin Module 3"]
    
    style Quiz fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style Ex1 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex2 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex3 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex4 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex5 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style QuizAns fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style Complete fill:#a5d6a7,stroke:#2e7d32,stroke-width:2px
    style Guide fill:#fff8e1,stroke:#ff9800,stroke-width:2px
```

| Previous Step | Next Step |
|:---:|:---:|
| [← Back to Exercise 4 Solutions](./4-like-and-null-solutions.md) | [Continue to Quiz Answers →](./module2-sql-quiz-answers.md) |

---


*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

**Level 1 | Module 2 | Exercise 5 Solutions | Next: [Quiz Answers](./module2-sql-quiz-answers.md)**



