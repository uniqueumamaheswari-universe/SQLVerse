


# 🗄️🤖 SQL & GenAI Course
**🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost**

## 📖 Exercise 4 Solutions: LIKE & NULL Handling

This document contains the solutions for all challenges in **Exercise 4: LIKE & NULL Handling**. Use it to check your work, understand alternative approaches, and reinforce your learning.

---

## 🌌 SQLVerse Check-In

<div style="border-left: 4px solid #9c27b0; background-color: #f3e5f5; padding: 15px; margin: 20px 0; border-radius: 0 8px 8px 0;">

**The laws of the SQLVerse are no longer mysteries to you. You have the keys.** You've mastered pattern matching and NULL handling on E-Commerce Planet. Now check your solutions and see the Artisan's approach.

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
    Ex4["📍 YOU ARE HERE<br/>📖 Exercise 4 Solutions<br/>LIKE & NULL"] --> Ex5
    Ex5["⏳ Exercise 5 Solutions<br/>Mixed Practice"] --> QuizAns
    QuizAns["⏳ Quiz Answers<br/>module2-sql-quiz-answers.md"] --> Complete
    Complete["🎉 MODULE 2 COMPLETE<br/>Ready for Module 3"] --> Guide
    Guide["🔄 Return to Module 2 Guide<br/>for Reflection & Begin Module 3"]
    
    style Quiz fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style Ex1 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex2 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex3 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex4 fill:#fff8e1,stroke:#ff9800,stroke-width:4px
    style Ex5 fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style QuizAns fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style Complete fill:#a5d6a7,stroke:#2e7d32,stroke-width:2px
    style Guide fill:#fff8e1,stroke:#ff9800,stroke-width:2px
```

You are currently reviewing **Exercise 4 Solutions**. After this, you'll work through Exercise 5 solutions, then check your quiz answers, and finally complete Module 2.

---

## 📊 Adding NULL Values for Practice

Before solving the challenges, remember that we added NULL phone numbers to practice NULL handling:

```sql
-- Add new customers with NULL phone numbers
INSERT INTO customers (customer_id, name, email, city, phone) VALUES
(6, 'Frank Miller', 'frank@email.com', 'Boston', NULL),
(7, 'Grace Chen', 'grace@email.com', 'Seattle', NULL),
(8, 'Henry Garcia', 'henry@email.com', 'Miami', NULL);

-- Add a customer with a phone number for comparison
INSERT INTO customers (customer_id, name, email, city, phone) VALUES
(9, 'Ivy Patel', 'ivy@email.com', 'Austin', '555-0201');
```

> 🎉 **INSERT Mastery Check:** In File 6, you added Ben, Sam, and Emma to the Education database. In File 7, you added Oliver and Sophia. Now you've added 4 more customers to the E-Store database. **You're an INSERT pro!** The syntax is identical – only the table and column names change. This is skill transfer in action.

---

## 📝 Challenge Solutions

### Challenge 1: Names Starting with 'A'

**Question:** Find all customers whose names start with the letter 'A'.

**Solution:**
```sql
SELECT name, email, city
FROM customers
WHERE name LIKE 'A%';
```

**Expected Result:** Alice Smith.  
**Row Count:** 1 row

| name | email | city |
|------|-------|------|
| Alice Smith | alice@email.com | New York |

**What you're seeing:** The `%` wildcard matches **any number of characters** (including zero). `'A%'` means: "Starts with A, followed by anything." This finds Alice even though her full name has a space and a last name.

---

### Challenge 2: Names Ending with 'e'

**Question:** Find all customers whose names end with the letter 'e'.

**Solution:**
```sql
SELECT name, email, city
FROM customers
WHERE name LIKE '%e';
```

**Expected Result:** Alice Smith, Charlie Lee, Eva Gomez.  
**Row Count:** 3 rows

| name | email | city |
|------|-------|------|
| Alice Smith | alice@email.com | New York |
| Charlie Lee | charlie@email.com | New York |
| Eva Gomez | eva@email.com | Chicago |

**What you're seeing:** `'%e'` means: "Anything, ending with e." Notice that "Alice" ends with e, so Alice Smith qualifies even though her last name doesn't end with e – the pattern searches the entire name column.

---

### Challenge 3: Email Domain Search

**Question:** Find all customers whose email contains 'email.com' (the domain).

**Solution:**
```sql
SELECT name, email
FROM customers
WHERE email LIKE '%email.com%';
```

**Expected Result:** All customers (all have @email.com addresses).  
**Row Count:** 9 rows (or however many customers you have)

| name | email |
|------|-------|
| Alice Smith | alice@email.com |
| Bob Johnson | bob@email.com |
| Charlie Lee | charlie@email.com |
| David Kim | david@email.com |
| Eva Gomez | eva@email.com |
| Frank Miller | frank@email.com |
| Grace Chen | grace@email.com |
| Henry Garcia | henry@email.com |
| Ivy Patel | ivy@email.com |

**What you're seeing:** `'%email.com%'` matches "email.com" anywhere in the string – at the beginning, middle, or end. In our data, all emails are exactly `something@email.com`, so the pattern matches everything.

---

### Challenge 4: Five-Letter Names

**Question:** Find customers whose names have exactly 5 letters (first name only).  
*Note: Names are stored as full names (e.g., 'Alice Smith'), making this challenging.*

**Solution (conceptual approach):**
```sql
-- This pattern would work if first names were stored separately
-- SELECT name FROM customers WHERE name LIKE '_____'; -- 5 underscores

-- For our actual data structure, we need a different approach
-- This query finds names where the first name appears to be 5 letters
SELECT name
FROM customers
WHERE name LIKE '_____ %';  -- 5 letters, then space, then anything
```

**Expected Result (with our data):** 
- Alice Smith (Alice is 5 letters)
- Frank Miller (Frank is 5 letters)
- Grace Chen (Grace is 5 letters)
- Henry Garcia (Henry is 5 letters)

**Row Count:** 4 rows

| name |
|------|
| Alice Smith |
| Frank Miller |
| Grace Chen |
| Henry Garcia |

**What you're seeing:** This challenge reveals an important real-world truth: **data isn't always perfectly structured for your queries.** In a well-designed database, first and last names would be in separate columns. Here, we work with what we have.

**Artisan's Insight:** `_` (underscore) matches exactly one character. `'_____ %'` means: five characters, then a space, then anything. This approximates "five-letter first name" given our data structure. In the real world, you'll often need creative workarounds for imperfect data.

---

### Challenge 5: Customers with Phone Numbers

**Question:** Find all customers who have provided a phone number (phone is NOT NULL).

**Solution:**
```sql
SELECT name, phone
FROM customers
WHERE phone IS NOT NULL;
```

**Expected Result:** Customers with phone numbers (Alice, Bob, Eva, Ivy, plus any others with phones).  
**Row Count:** 4 rows (based on our data)

| name | phone |
|------|-------|
| Alice Smith | 555-0101 |
| Bob Johnson | 555-0102 |
| Eva Gomez | 555-0105 |
| Ivy Patel | 555-0201 |

**What you're seeing:** `IS NOT NULL` is the correct way to find rows that have a value. This is essential for creating contact lists, sending communications, or any scenario where missing data would cause problems.

---

### Challenge 6: Customers Missing Phone Numbers

**Question:** Find all customers who have NOT provided a phone number (phone is NULL).

**Solution:**
```sql
SELECT name, phone
FROM customers
WHERE phone IS NULL;
```

**Expected Result:** Customers with NULL phones (Charlie, David, Frank, Grace, Henry).  
**Row Count:** 5 rows

| name | phone |
|------|-------|
| Charlie Lee | NULL |
| David Kim | NULL |
| Frank Miller | NULL |
| Grace Chen | NULL |
| Henry Garcia | NULL |

**What you're seeing:** `IS NULL` finds missing data. Notice we don't see any values – just empty cells representing the absence of information. This is the foundation of data quality analysis.

**Artisan's Insight:** NULLs aren't errors – they're information about what you don't know. In a CRM system, NULL phone numbers might trigger a "please update your contact info" campaign.

---

### Challenge 7: Gmail Users with Phones (Logic Exercise)

**Question:** Find customers whose email contains 'gmail.com' AND who have provided a phone number.  
*(Note: Our sample data doesn't have Gmail addresses – this is a logic exercise.)*

**Solution:**
```sql
SELECT name, email, phone
FROM customers
WHERE email LIKE '%gmail.com%' AND phone IS NOT NULL;
```

**Expected Result:** No rows in current data.  
**Row Count:** 0 rows

**What you're seeing:** The query structure is what matters. It combines:
- Pattern matching (`LIKE '%gmail.com%'`)
- NULL checking (`IS NOT NULL`)
- Logical AND (both conditions must be true)

Even with zero results, this query demonstrates how to combine these concepts. In a real database with Gmail users, it would return valuable marketing data.

---

### Challenge 8: The NULL Trap

**Question:** First, run the wrong query, then write the correct version.

**Wrong query (trap):**
```sql
-- This returns NO rows, even though NULLs exist!
SELECT name, phone
FROM customers
WHERE phone = NULL;
```

**Correct query:**
```sql
SELECT name, phone
FROM customers
WHERE phone IS NULL;
```

**Expected Result:** Wrong query returns 0 rows. Correct query returns customers with NULL phones (Charlie, David, Frank, Grace, Henry).  
**Row Count:** 0 rows for wrong query, 5 rows for correct query

**What you're seeing:** This is the most common NULL mistake. `= NULL` doesn't mean "is missing" – it means "equals an unknown value," which is impossible to evaluate. The result is always unknown, treated as false in WHERE clauses.

**Artisan's Insight:** NULL is a ghost. You can't ask if a ghost equals something; you can only ask if it *is* there (`IS NULL`) or *is not* there (`IS NOT NULL`). This single rule will save you hours of debugging.

---

## 🎯 Key Takeaways from Exercise 4

| Concept | Takeaway |
|---------|----------|
| **`%` wildcard** | Matches zero or more characters |
| **`_` wildcard** | Matches exactly one character |
| **Pattern combinations** | `'A%'`, `'%e'`, `'%ar%'`, `'_____'` |
| **IS NULL** | Correct way to find missing data |
| **IS NOT NULL** | Correct way to find present data |
| **= NULL trap** | NEVER use `= NULL` – it always fails |
| **Real-world data** | Often messy – creative solutions required |

---

## 💡 Artisan's Reflection

After completing these exercises, ask yourself:

- [ ] Can I use `%` and `_` to find patterns in text?
- [ ] Do I understand the difference between `%` and `_`?
- [ ] Can I find NULL values correctly with `IS NULL`?
- [ ] Will I ever accidentally use `= NULL` again?
- [ ] Can I combine pattern matching with NULL checks?

**If yes, you're ready for Exercise 5: Mixed Practice!**

---


### 🧭 EVALUATE Navigation

```mermaid
flowchart LR
    Quiz["✅ Quiz Complete<br/>📝 Module 2 Quiz"] --> Ex1
    Ex1["✅ COMPLETED<br/>📖 Exercise 1 Solutions<br/>Basic SELECT"] --> Ex2
    Ex2["✅ COMPLETED<br/>📖 Exercise 2 Solutions<br/>WHERE Clause"] --> Ex3
    Ex3["✅ COMPLETED<br/>📖 Exercise 3 Solutions<br/>Logical & IN/BETWEEN"] --> Ex4
    Ex4["✅ COMPLETED<br/>📖 Exercise 4 Solutions<br/>LIKE & NULL"] --> Ex5
    Ex5["⏳ Exercise 5 Solutions<br/>Mixed Practice"] --> QuizAns
    QuizAns["⏳ Quiz Answers<br/>module2-sql-quiz-answers.md"] --> Complete
    Complete["🎉 MODULE 2 COMPLETE<br/>Ready for Module 3"] --> Guide
    Guide["🔄 Return to Module 2 Guide<br/>for Reflection & Begin Module 3"]
    
    style Quiz fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style Ex1 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex2 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex3 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex4 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex5 fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style QuizAns fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style Complete fill:#a5d6a7,stroke:#2e7d32,stroke-width:2px
    style Guide fill:#fff8e1,stroke:#ff9800,stroke-width:2px
```

| Previous Step | Next Step |
|:---:|:---:|
| [← Back to Exercise 3 Solutions](./3-logical-and-in-between-solutions.md) | [Continue to Exercise 5 Solutions →](./5-mixed-practice-solutions.md) |

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

**Level 1 | Module 2 | Exercise 4 Solutions | Next: [Mixed Practice Solutions](./5-mixed-practice-solutions.md)**

---

**Exercise 4 Solutions complete and perfectly aligned!** 🚀