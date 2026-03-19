


# 🗄️🤖 SQL & GenAI Course
**🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost**

## 🌍 Exercise 2: Real-World Application – Solutions & Sample Answers

Welcome to the solutions for Exercise 2! Use this guide to compare your own answers and deepen your understanding. In this exercise, we moved from abstract thinking to looking at actual data structures. These solutions focus on the **Relational** aspect of databases—how tables talk to each other. The goal is to see how databases appear in real‑world systems and why they are designed the way they are.

---

## 🌌 SQLVerse Check-In

<div style="border-left: 4px solid #9c27b0; background-color: #f3e5f5; padding: 15px; margin: 20px 0; border-radius: 0 8px 8px 0;">

**Your exploration of Education Planet continues.** You've reviewed Exercise 1 solutions. Now you're diving deeper into the **architecture** of real-world databases – seeing how tables connect like threads in a vast digital tapestry.

Remember: The difference between **knowing** the database and **owning** the database is about understanding these connections. An **Artisan** owns the database.

**The difference between a coder and an Artisan is discipline.**

</div>

---

### 📍 Your Current Stage

```mermaid
flowchart LR
    A["✅ Quiz Completed<br/>📝 module1-concepts-quiz.md"] --> B
    B["✅ Exercise 1 Solutions<br/>Database Thinking"] --> C
    C["📍 YOU ARE HERE<br/>📚 Exercise 2 Solutions<br/>Real-World Application"] --> D
    D["⏳ Exercise 3 Solutions<br/>Scale Comprehension"] --> E
    E["⏳ Quiz Answers<br/>module1-concepts-quiz-answers.md"] --> F
    F["🎉 READY FOR MODULE 2"]
    
    style A fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style B fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style C fill:#fff8e1,stroke:#ff9800,stroke-width:4px
    style D fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style E fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style F fill:#a5d6a7,stroke:#2e7d32,stroke-width:2px
```

You've completed the quiz and reviewed Exercise 1 solutions. Now let's dive into the Real-World Application exercise.

---

### 🔍 Part 1: Visual Reconnaissance (The E-Store)

**Task:** Load `level1_estore_basic.db` in Tab 2 and answer the detective questions.

When you explored **`level1_estore_basic.db`**, you were looking at the fundamental building blocks of e-commerce. You were trying to figure out the answer for these 3 Questions :  Where are the cities? , Where are the prices and Where are the dates?

| Detective Question | Table | Column |
|--------------------|-------|--------|
| 1. The Location Scout: Find which cities customers live in. | `customers` | `city` |
| 2. The Price Check: Find the price of a product. | `products` | `price` |
| 3. The Timeline: Find purchase dates. | `orders` | `order_date` |

*Why these answers?*  
- `customers` stores customer details, including `city`.  
- `products` holds product information, including `price`.  
- `orders` records each order with its `order_date`.

---

### 🔗 Part 2: The "Thread" Connection (Primary/Foreign Key Logic)

**The Mystery:** Why use `customer_id` instead of storing the customer name directly in the `orders` table?

**Sample Response:**

> "We use `customer_id` to ensure **Data Integrity**. If a customer changes their name or address, we only have to update it in the `customers` table once. Because the `orders` table uses a 'thread' (Foreign Key) to point to that ID, every order ever made by that person automatically points to the correct, updated information."

**The Alternative (The Spreadsheet Nightmare):**

If you typed "John Smith" into 1,000 order rows and then found out there were two different John Smiths, or if one John Smith changed his name, you would have to manually edit 1,000 rows. This is where errors crawl into your data.

> 🎨 **Artisan Tip:** Imagine a thin red line connecting the `customer_id` in the `orders` table to the same `customer_id` in the `customers` table. That line is the **Relationship** – it turns separate tables into a coherent story.

---

### 🏫 Part 3: Institutional Knowledge (Training DB)

**Scenario:** A student wants a course that fits within 4 weeks.

1. **Identify the Table:** `courses`
2. **Identify the Column:** `duration_weeks` (or simply `duration` in some schemas)
3. **The Discovery:** Look for courses with `duration_weeks <= 4`.  
   *Example:* In the provided `training_institution_sample.db`, you might find courses like "Frontend Development" (8 weeks) which doesn't fit, but "SQL Basics" or "Data Entry" might be 4 weeks or less. Students should identify at least one course meeting the criteria.

**Sample Answer:**  
- Table: `courses`  
- Column: `duration_weeks`  
- Found course: "Data Analysis for Beginners" (4 weeks) – fits the schedule.
- 
In this exercise, you practiced finding specific attributes.

-   **The Findings:** You likely noticed that the `courses` table contains a `duration` column.
    
-   **The Lesson:** To find courses that fit a 4-week window, you look for rows where the duration is `4`. In a spreadsheet, you'd scroll and look. In a database, you'll soon learn to write: `SELECT * FROM courses WHERE duration = 4 in Module2;`.

---

### 🤖 Part 4: Socratic Verification (Tab 3)

**Prompt:** *"I am looking at an 'Orders' table that only has a 'customer_id' and not the 'customer_name'. I suspect this is done to ensure data integrity in case a customer changes their name. Am I thinking about 'Relational Databases' correctly? What is this concept called in professional database design?"*

**Expected AI Response (conceptual):**  
Yes, you are absolutely correct! This is a fundamental principle of **relational database design** called **normalization**. By separating data into related tables and using foreign keys, you avoid duplication and maintain integrity. This specific practice – storing only the ID of a related record – is known as **referential integrity**.

---

### 🏛️ The Artisan's Insight: The "Portal" Effect

Think of a **Foreign Key** not just as a piece of data, but as a **Portal**. When you see `customer_id: 5` in an orders table, you are looking through a window into the Customers table. This "separation of concerns" is what allows databases to remain organized even when they hold millions of records.

----------

### 💎 Reflection

After completing this exercise, you should feel comfortable:
- Navigating a simple database to find specific information.
- Understanding why IDs are used instead of redundant data.
- Applying your knowledge to find courses that fit a given duration.

If any of these tasks felt difficult, revisit the concept files or ask your AI Consultant for more examples.

---

## ✅ When You're Done

- [ ] I've compared my answers with these samples.
- [ ] I understand why `customer_id` is used in the `orders` table.
- [ ] I understand how the `orders` table "points" to the `customers` table.
- [ ] I can locate tables and columns in a real database.
- [ ] I've grasped why "Primary Key to Foreign Key" is better than re-typing names.
- [ ] I'm ready to move to the next exercise solutions.

---

## 🧭 Navigation for EVALUATE

```mermaid
flowchart LR
    A["✅ Quiz Completed<br/>📝 module1-concepts-quiz.md"] --> B
    B["✅ Exercise 1 Solutions<br/>Database Thinking"] --> C
    C["✅ COMPLETED<br/>Exercise 2 Solutions<br/>Real-World Application"] --> D
    D["⏳ NEXT STEP<br/>Exercise 3 Solutions<br/>Scale Comprehension"] --> E
    E["⏳ Quiz Answers<br/>module1-concepts-quiz-answers.md"] --> F
    F["🎉 READY FOR MODULE 2"]
    
    style A fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style B fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style C fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style D fill:#fff8e1,stroke:#ff9800,stroke-width:4px
    style E fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style F fill:#a5d6a7,stroke:#2e7d32,stroke-width:2px
```

| Previous Step | Next Step |
|:---:|:---:|
| [← Back to Exercise 1 Solutions](./1-database-thinking-exercises-solutions.md) | [Continue to Exercise 3 Solutions →](./3-scale-comprehension-solutions.md) |

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

**Level 1 | Module 1 | Exercise 2 Solutions | Next: Exercise 3 Solutions**