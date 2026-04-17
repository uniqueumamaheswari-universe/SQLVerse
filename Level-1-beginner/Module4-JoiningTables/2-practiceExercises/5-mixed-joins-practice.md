


# 🗄️🤖 SQL & GenAI Course
**🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost**

---

## 🧠 Exercise 5: Mixed JOIN Practice – The Artisan's Arsenal

You've mastered `INNER JOIN`, `LEFT JOIN`, multiple tables, and self joins. Now it's time to combine **all of them** in a single exercise. This is the Artisan's Arsenal – knowing which join to use, when, and why.

In the real world, no one asks *"Write an INNER JOIN"* or *"Write a LEFT JOIN"*. They ask business questions. You must decide: Does this need an `INNER JOIN` (only matching rows)? A `LEFT JOIN` (keep everything from one side)? A self join (hierarchy within a table)? Or a chain of all three?

**This exercise tests your judgment, not just your syntax.**

---

## 🌌 SQLVerse Check-In

<div style="border-left: 4px solid #9c27b0; background-color: #f3e5f5; padding: 15px; margin: 20px 0; border-radius: 0 8px 8px 0;">

**You are now navigating multiple planets.** Some questions live on Education Planet (Training Institution). Others live on Tourism Planet (self joins). The laws of joins are universal – only the data changes.

### 🔍 SQLVerse Artisan's Objective

In this exercise, you will demonstrate **mastery** of all join types. You will read a business question, identify which tables are needed, choose the correct join type(s), and write the query.

**The difference between a coder and an Artisan is discipline.**

</div>

---

### 📍 Your Current Stage – PRACTICE Journey

```mermaid
flowchart LR
    A["✅ PREPARE Complete<br/>📘 Files 1-6"] --> B
    B["✅ Exercise 0<br/>Normalization Practice"] --> C
    C["✅ Exercise 1<br/>INNER JOIN Practice"] --> D
    D["✅ Exercise 2<br/>LEFT JOIN Practice"] --> E
    E["✅ Exercise 3<br/>Multiple Tables"] --> F
    F["✅ Exercise 4<br/>Self Join Practice"] --> G
    G["📍 YOU ARE HERE<br/>🧠 Exercise 5<br/>Mixed JOIN Practice"] --> H
    H["⏳ Capstone Reports<br/>CEO / CTO / CFO"] --> I
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

You've mastered every join type. Now you'll combine them.

---

## 🔧 Browser Office for PRACTICE

**🚀 Kickstart: Any Computer, Any Browser, Anytime.**  
**🌍 Destination: Any country, Any city, Any Platform.**

| Tab | Purpose | What to Do |
| :--- | :--- | :--- |
| **1: The Map** | Reference materials | • Keep your **[Module 4 Reference Guide](./module4-reference.md)** handy.<br>• Complete the challenges below. |
| **2: The Factory** | Run queries | You will switch between **Training Institution** and **Tourism Planet** databases. Each challenge will specify which database to load. |
| **3: The Consultant** | Conceptual Q&A | If stuck, follow the **3‑Attempt Rule**. Ask for conceptual hints, not code. Configure with **[Student Mode Prompt](../../../STUDENT_MODE_PROMPT_LEVEL1.md)**. |
| **4: The Vault** | Save your work | Save each successful query in your Vault at: `Learning/Level-1-beginner/Level1-1-ACQUIRE/Module4-JoiningTables/2-practiceExercises/` |

---

### 🛠️ Module 4 Toolkit

🚀 Foundation First, AI Next, Projects Last.  
💎 Gemstone by Gemstone, Skill by Skill.

| | | | |
|---|---|---|---|
| **Browser Office** | 🔧 [Troubleshooting Common Issues](../../../Setup/STEP1_COMMISSION_BROWSER_OFFICE.md) | 🔄 [Browser Office Workflow](../../../Setup/STEP2_ESTABLISH_LEARNING_RITUAL.md) | ⌨️ [Tab Operations & Shortcuts](../../../Setup/STEP3_MASTER_TAB_OPERATIONS.md) |
| **ACQUIRE Section** | 🗄️ [Database Ecosystem](../../Guides/Section1-ACQUIRE/2_Database_Ecosystem.md) | 📚 [Knowledge Base (Vault)](../../Guides/Section1-ACQUIRE/3_Knowledge_Base.md) | 🧠 [Mindset Tuning](../../Guides/Section1-ACQUIRE/4_Mindset.md) |

---

## 🏛️ Your Data Playgrounds

You will use two databases in this exercise:

### Database 1: Training Institution

**Location:** [`training_institution_sample.db`](../../../Resources/sample_databases/training_institution_sample.db)

**Tables:** `students`, `courses`, `instructors`, `enrollments`, `payments`

### Database 2: Tourism Planet

**Location:** [`tourism_planet_self_join.db`](../1-sqlCommands/SQLVerse-Architects-Blueprint/tourism_planet_self_join.db)

**Tables:** `tours`, `guides`, `customers`, `bookings`, `booking_tours`

> 💡 **Quick Refresh:** Run `SELECT * FROM students;` or `SELECT * FROM tours;` in each database to refresh your memory of the data.

---

## 💡 Artisan's Decision Framework

Before writing any query, ask yourself:

| Question | If Yes → |
|----------|----------|
| Do I need all rows from one table, even without matches? | **LEFT JOIN** |
| Do I only need rows that have matches in both tables? | **INNER JOIN** |
| Is the relationship within the same table (e.g., manager → employee)? | **Self Join** |
| Do I need data from 3+ tables in a chain? | **Multiple Joins** |
| Do I need to preserve NULLs from a LEFT JOIN while adding another table? | **Chain LEFT JOINs** |

---

## 🧪 Challenges

For each challenge, use the **Artisan's Query Rhythm**:
- **The Question** – read the business request.
- **The Decision** – which join type(s) and which database?
- **The Query** – write your SQL.
- **Try it now** – run it in Tab 2.
- **Reflect & Learn** – did you choose the right join?

---

### Challenge 1: Students with Payment Status (Training Institution)
**Question:** Show all students, their total payments, and whether they have paid their full fees. Display `student_name`, `total_fees`, `fees_paid`, `balance_owed`, and `payment_status` ('Paid in Full', 'Partial', or 'No Payments').

> 💡 **Decision Guide:** Use `students` table only. No joins needed. Use `CASE` statement for status.

```sql
-- Your query here
-- Database: Training Institution
-- Save as: 5-1-payment-status.sql
```

**What this teaches:** Not every question requires a join. Economy of Effort.

---

### Challenge 2: Courses with No Enrollments (Training Institution)
**Question:** Find courses that have no students enrolled. Display `course_code`, `course_name`, and `course_track`.

> 💡 **Decision Guide:** `LEFT JOIN` from `courses` to `enrollments`, then `WHERE enrollment_id IS NULL`.

```sql
-- Your query here
-- Database: Training Institution
-- Save as: 5-2-empty-courses.sql
```

**What this teaches:** `LEFT JOIN` with `IS NULL` to find orphans.

---

### Challenge 3: Complete Student Transcript (Training Institution)
**Question:** Show every student, their enrolled courses, instructor names, and final exam scores. Include students with no enrollments (show NULL for course and instructor). Display `student_name`, `course_name`, `instructor_name`, and `final_exam_score`. Order by student name.

> 💡 **Decision Guide:** `LEFT JOIN` chain: `students` → `enrollments` → `courses` → `instructors`. Preserve students with no enrollments.

```sql
-- Your query here
-- Database: Training Institution
-- Save as: 5-3-student-transcript.sql
```

**What this teaches:** Chaining `LEFT JOIN`s to preserve all rows from the starting table.

---

### Challenge 4: Package Tours and Their Sub-Tours (Tourism Planet)
**Question:** Show all package tours and the number of sub-tours they contain. Display `package_name` and `sub_tour_count`. Only include packages that have at least one sub-tour. Order by sub_tour_count descending.

> 💡 **Decision Guide:** Self join with `INNER JOIN` (only packages with sub-tours), then `GROUP BY` and `COUNT`.

```sql
-- Your query here
-- Database: Tourism Planet
-- Save as: 5-4-package-subtour-count.sql
```

**What this teaches:** Self join with aggregation.

---

### Challenge 5: Family Booking Details with Tours (Tourism Planet)
**Question:** Show all bookings, the primary customer's name, the total number of family members (including the primary), and the tours included in the booking. Display `booking_id`, `primary_name`, `family_size`, and `tour_names` (comma-separated list using `GROUP_CONCAT`). Only include bookings that have at least one tour assigned.

> 💡 **Decision Guide:** Multiple joins: `bookings` → `customers` (primary) → `customers` (dependents) → `booking_tours` → `tours`. Use `GROUP_CONCAT` for tour names.

```sql
-- Your query here
-- Database: Tourism Planet
-- Save as: 5-5-family-booking-details.sql
```

**What this teaches:** Complex chain joining multiple tables with aggregation and string concatenation.

---

### Challenge 6: High-Value Students with Instructor Details (Training Institution)
**Question:** Find students who have paid more than $2000 in total across all payments. Show `student_name`, `total_paid`, `course_name`, and `instructor_name`. If a student is enrolled in multiple courses, show each course separately.

> 💡 **Decision Guide:** `INNER JOIN` chain: `students` → `payments` (aggregate first) → `enrollments` → `courses` → `instructors`. Use a subquery or `GROUP BY` in a CTE for total paid.

```sql
-- Your query here
-- Database: Training Institution
-- Save as: 5-6-high-value-students.sql
```

**What this teaches:** Combining aggregation with multi-table joins.

---

### Challenge 7: The Ultimate Mixed Join – Mentor's Students (Tourism Planet + Training Institution)
**Question:** Imagine cross-planet analysis. A senior guide (Elena Vasquez) wants to see all junior guides she trained, and for each junior guide, show the courses they teach (from Training Institution – assume guides are also instructors). Display `senior_guide_name`, `junior_guide_name`, and `course_name`. Order by junior guide name.

> 💡 **Decision Guide:** This is a **cross-database challenge** (conceptual). You cannot join across databases. Instead, think: Self join on `guides` (Tourism Planet) to find juniors of Elena. Then manually map guide names to instructor names in Training Institution.

```sql
-- Part A: Find junior guides trained by Elena Vasquez (Tourism Planet)
-- Your query here

-- Part B: Find courses taught by those guides in Training Institution
-- Your query here
```

**Save as:** `5-7-cross-planet-analysis.sql`

**What this teaches:** Real-world data often lives in separate systems. Sometimes you export, sometimes you connect via ETL. An Artisan understands the boundaries.

---

## 🎯 Your Progress Tracker

| Challenge | Status (✅/⏳) | Confidence (1‑5) |
|-----------|---------------|------------------|
| 1: Students with Payment Status | | |
| 2: Courses with No Enrollments | | |
| 3: Complete Student Transcript | | |
| 4: Package Tours and Their Sub-Tours | | |
| 5: Family Booking Details with Tours | | |
| 6: High-Value Students with Instructor Details | | |
| 7: The Ultimate Mixed Join | | |

---

## 💎 DESIGNER'S PERIGON

### 🎨 *The Art of Choice*

You have learned every join type. You have practiced each one in isolation. Now you stand at the crossroads – not of syntax, but of **judgment**.

An `INNER JOIN` is for precision. A `LEFT JOIN` is for inclusion. A self join is for reflection. Chaining is for storytelling.

> *“The Artisan doesn't ask 'How do I write a join?' The Artisan asks 'Which join tells the truth?'”*

In the Artisan's Garden, a mixed bouquet is not random. It is **curated**. The mixed bouquet is **precisely crafted** and **exclusively arranged** for a **purpose.**

The Artisan handpicks the flowers, combines colors, shapes, and textures to create a stunning, **harmonious view**. Let us break down the process of selection:

An Artisan practises **minimalism** – the **artistry** lies in picking the right floral arrangement for the **occasion** and conveying the meaning. An artisan can make a statement with:

| Arrangement | SQL Equivalent |
|-------------|----------------|
| a single flower; just **one simple flower** | Single table query |
| a **monochromatic bouquet** to create depth and modern elegance with a single hue | INNER JOIN |
| a **bouquet with varying shades of the chosen color** to create a sophisticated, elegant, and modern look | OUTER JOIN (LEFT/RIGHT) |
| a **multi-colored bouquet** combining vibrant and contrasting blooms to create a lively, cheerful effect | Multi-table JOIN |
| a **Bicoloured Flower arrangement** to create depth and visual interest from a single source | SELF JOIN |


With such a **broad spectrum** of artifacts at disposal – spoilt for choice – how does an Artisan **choose** the floral arrangement for an occasion?

The Artisans of SQLVerse choose the **artifact** with **purpose and balance** the occasion demands – nothing more, nothing less.

The SQLVerse Artisans always design **what is right** for the given occasion and **never to flaunt** their specialized skillset.

The Artisan doesn't ask *"What can I build?"* The Artisan asks *"What does this moment need?"*

> *“The right join at the right time – that is mastery.”*

---

### 🌍 Real‑World Application

The mixed join queries you just wrote mirror real business intelligence work.

| Query | Real‑World Scenario | Business Impact |
|-------|---------------------|-----------------|
| 📊 **Payment Status** | Finance needs to know who owes money. | **Cash flow** – prioritize collections. |
| 📝 **Student Transcript** | Registrar needs complete academic records. | **Compliance** – audit-ready documentation. |
| 🎯 **Package Sub-Tour Count** | Marketing needs to highlight popular packages. | **Conversion** – feature rich packages. |
| 👨‍👩‍👧‍👦 **Family Booking Details** | Hotel operations need room allocation. | **Efficiency** – correct suite assignment. |
| 💰 **High-Value Students** | Sales team needs to identify VIPs for retention. | **Revenue** – targeted loyalty programs. |

#### The Artisan's Advantage

When an interviewer asks, *"Tell me about a time you used multiple join types in one query"* – **you** will say:

> *"I needed to find students who paid over $2000, show their courses and instructors, and include only those with enrollments. I used INNER JOIN to connect students to payments, aggregated to find high-value students, then joined to enrollments, courses, and instructors. Each join served a specific purpose – payments for finance, enrollments for academics, instructors for operations."*

**That answer gets you hired.**

---

**The SQLVerse expands. You are ready for Capstone Reports.** 🏆

---

## ✅ When You're Done

- [ ] I successfully ran all 7 queries (or made a solid attempt at each).
- [ ] I saved each query in my Vault with the correct filename.
- [ ] I can choose the correct join type based on a business question.
- [ ] I understand when NOT to use a join.
- [ ] I can chain different join types in a single query.
- [ ] I feel ready for the **Capstone Reports (CEO / CTO / CFO)**.

---

## 🧭 Practice Navigation

```mermaid
flowchart LR
    A["✅ PREPARE Complete<br/>📘 Files 1-6"] --> B
    B["✅ Exercise 0<br/>Normalization Practice"] --> C
    C["✅ Exercise 1<br/>INNER JOIN Practice"] --> D
    D["✅ Exercise 2<br/>LEFT JOIN Practice"] --> E
    E["✅ Exercise 3<br/>Multiple Tables"] --> F
    F["✅ Exercise 4<br/>Self Join Practice"] --> G
    G["✅ Exercise 5<br/>Mixed JOIN Practice"] --> H
    H["⏳ Capstone Reports<br/>CEO / CTO / CFO"] --> I
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
| [← Back to Exercise 4: Self Join Practice](./4-self-join-practice.md) | [Continue to Capstone Reports →](./Capstone%20Reports/) |

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

**Level 1 | Module 4 | Practice Exercise 5 | Next: [Capstone Reports](./Capstone%20Reports/)**