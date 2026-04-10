


# 🗄️🤖 SQL & GenAI Course
**🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost**

## 🏆 ACQUIRE COMPLETION: The Gemstone Vault & Schema Blueprint

## 💌 A Brief from the Designer

Hello, Artisan.

If you are reading this, you have done something extraordinary. You have stayed the course through four modules, countless queries, late nights of debugging, and moments of quiet triumph when a complex `JOIN` finally clicked.

This task is not a test. It is a **celebration**.

You are going to build a database of your own learning journey – a permanent, queryable record of every skill you mastered, every insight you gathered, and every challenge you overcame. When you finish, you will have a portfolio piece that proves, in SQL itself, that you have transformed from a learner into a Data Artisan.

Take a deep breath. Open your Vault. Let's begin.

In this mission, you will walk through the SQLVerse Artisan's garden, select the blooms of every colour and shade, assemble and style them into exquisite bouquets for a very special event – to decorate your portfolio, not for someone's dashboard. This venture will be delightful and enticing. These bouquets are going to become valuable gems in your vault over time.

**The SQLVerse is proud of you.**

---

You have already completed your ACQUIRE Induction and mastered Modules 1–4. Now, your completion task has three phases:

```mermaid
flowchart LR
    subgraph JOURNEY["Your ACQUIRE Journey"]
        direction LR
        A["✅ ACQUIRE Induction<br/>Calibration Complete"]
        B["✅ Modules 1-4<br/>Skills & Concepts Mastered"]
    end

    subgraph TASK["Your Completion Task"]
        direction LR
        D["📐 PHASE 1<br/>DESIGN<br/>Normalize the Schema"]
        E["💎 PHASE 2<br/>COLLECT<br/>Populate with Your Data"]
        F["🖼️ PHASE 3<br/>DISPLAY<br/>Query & Showcase"]
    end

    A --> B
    B --> D
    D --> E
    E --> F
    F --> H["🏆 Portfolio Gem Collection<br/>Your Permanent Record"]

    style A fill:#c8e6c9,stroke:#2e7d32,stroke-width:2px
    style B fill:#c8e6c9,stroke:#2e7d32,stroke-width:2px
    style D fill:#e1f5fe,stroke:#2196f3
    style E fill:#fff8e1,stroke:#ff9800
    style F fill:#e8f5e8,stroke:#4caf50
    style H fill:#f3e5f5,stroke:#9c27b0,stroke-width:3px
```

---

## 📂 Where to Save Your Work

Create the following folder in your **Vault (Tab 4)** :

```
Projects/Level-1-beginner/ACQUIRE_COMPLETION/
```

Inside, you will save all files from this task.

```
ACQUIRE_COMPLETION/
├── README.md                          # Your completion report (use template below)
├── design/
│   ├── normalization-steps.md         # Your written reasoning
│   └── schema.sql                     # CREATE TABLE statements
├── collect/
│   ├── data-collection.md             # Notes on where you found each piece of data
│   └── insert-data.sql                # INSERT statements
└── display/
    └── queries.sql                    # SELECT queries (insights)
```

---

## 🔧 Tools You'll Need

| Tab | Purpose |
|-----|---------|
| **Tab 1 (The Map)** | Course files – all concept files, reference guides, and module content from Modules 1–4 |
| **Tab 2 (The Factory)** | SQLite Online – to create tables, insert data, and run queries |
| **Tab 3 (The Consultant)** | AI Co-pilot – for conceptual guidance (configured with Student Mode Prompt) |
| **Tab 4 (The Vault)** | Your GitHub repository – to save all files |

> 💡 **Note:** You will need to refer to the course files extensively to extract your learning data. Keep Tab 1 open as you work through this task.

---

## 🌌 SQLVerse Check-In

<div style="border-left: 4px solid #9c27b0; background-color: #f3e5f5; padding: 15px; margin: 20px 0; border-radius: 0 8px 8px 0;">

**You are no longer a student. You are a Data Artisan.** This task is your rite of passage – a chance to design, build, and query a database that tells the story of your own transformation.

**The difference between a coder and an Artisan is discipline.**

</div>

---

## 📐 Phase 1: DESIGN – Crafting the Schema

### Step 0: The Flat Spreadsheet

Below is a flat, unnormalized table that contains information about your learning journey across Modules 1–4. It has **redundancy, update anomalies, and insertion/deletion anomalies**. Your job is to normalize it.

Only 4 rows are shown as examples. You will need to add all rows for your own learning journey (one row per skill, per learning objective, per bonus skill, etc.).

| module_id | module_name | skill_filename | skill_name | bonus_skill_name | bonus_skill_filename | bonus_skill_source | perigon_insight_text | perigon_source | perigon_filename | objective_text | student_viewpoint | quiz_score | exercise_filename | exercise_completed |
|-----------|-------------|----------------|------------|------------------|----------------------|-------------------|----------------------|----------------|------------------|----------------|-------------------|------------|-------------------|--------------------|
| 1 | Module 1: Intro to Databases | 1-what-is-a-database.md | What is a database? | NULL | NULL | NULL | "A spreadsheet is an aquarium; a database is an ocean." | Module 1 File 1 | 1-what-is-a-database.md | Explain what a database is | "The ocean analogy clicked for me" | 85 | 1-database-thinking.md | 1 |
| 1 | Module 1: Intro to Databases | 2-database-components.md | Database components | NULL | NULL | NULL | NULL | NULL | NULL | List three database components | "Tables, rows, columns, schema" | 85 | 2-real-world.md | 1 |
| 4 | Module 4: Joining Tables | 6-JoinConditions.md | ON vs WHERE Logic | CREATE TABLE | 0-refactoring-lab.md | Refactoring Lab | "A join is a bridge; a chain of joins is a story." | Module 4 File 6 | 6-JoinConditions.md | Write an INNER JOIN | "The bridge metaphor helped" | 92 | 1-inner-join.md | 1 |
| 4 | Module 4: Joining Tables | 6-JoinConditions.md | ON vs WHERE Joins | DELETE | 2-Foreign-Keys-Referential-Integrity.md | SQLVerse Architect's Blueprint | "Precision in the ON clause is precision in thought." | Module 4 File 6 | 6-JoinConditions.md | Write a LEFT JOIN | "ON vs WHERE is critical" | 92 | 2-left-join.md | 1 |

> 💡 **Note the subtle trap:** The same `skill_name` appears twice ("ON vs WHERE Logic" and "ON vs WHERE Joins") with different bonus skills. This creates a **transitive dependency** – the bonus skill doesn't actually depend on the `skill_name`, but on the `module`. You'll resolve this in 3NF.

> 💡 **You will need to expand this spreadsheet with all your own data** – skills, learning objectives, bonus skills, Perigon insights, quiz scores, and exercises from all four modules.

---

### Step 1: Identify Anomalies (The Structural Audit)

Before you touch the `CREATE` command, you must diagnose the "rot" in the flat spreadsheet. Look at the sample data and identify the following structural failures.

#### Redundancy (The Echo Effect)
- **Observation:** Look at the `module_name` and `quiz_score` columns.
- **The Problem:** If you have 15 skills in Module 4, you are typing "Module 4: Joining Tables" 15 times.
- **Your Task:** Explain why repeating the `module_name` for every single skill is a waste of space and a risk to data integrity.

*Write your reasoning:* `________________________________________________`

#### Update Anomaly (The Ripple Effect)
- **Scenario:** Imagine you decide to rename "Module 1: Intro to Databases" to "Module 1: Database Foundations."
- **The Problem:** How many rows would you have to change in the flat table? What happens if you miss one?
- **Your Task:** Describe the "Data Ghost" created when one row says "Foundations" and the other 10 still say "Intro."

*Write your reasoning:* `________________________________________________`

#### Insertion Anomaly (The "Wait-for-it" Problem)
- **Scenario:** You want to add "Module 5: Advanced Aggregations" to your plan, but you haven't learned any specific skills for it yet.
- **The Problem:** Can you add the module to this table if the `skill_name` cannot be NULL?
- **Your Task:** Explain why you shouldn't need a "skill" just to acknowledge that a "module" exists.

*Write your reasoning:* `________________________________________________`

#### Deletion Anomaly (The Burned Bridge)
- **Scenario:** You decide to remove the "INNER JOIN" skill from your record.
- **The Problem:** Look at that row. If you delete it, what happens to your record of the `quiz_score` for Module 4 or the `perigon_insight_text` associated with that row?
- **Your Task:** Explain how deleting a single *skill* could accidentally wipe out your entire *module progress record*.

*Write your reasoning:* `________________________________________________`

---

### Step 2: Normalize to 1NF

Identify any repeating groups or non‑atomic values. Show the split.

**Your 1NF result:** [Describe or show tables]

---

### Step 3: Normalize to 2NF

Identify partial dependencies (if any composite key exists). Show the split into separate tables.

**Your 2NF result:** [Describe or show tables]

---

### Step 4: Normalize to 3NF

Identify transitive dependencies. Show the final normalized schema.

**Your 3NF result:** [Describe or show tables]

**Expected tables after normalization (5 tables – streamlined for Level 1):**

| Table | Description |
|-------|-------------|
| `modules_level1` | Modules 1, 2, 3, 4 |
| `skills_level1` | Skills + learning objectives (combined) |
| `bonus_skills_level1` | Bonus skills learned |
| `insights_level1` | Perigon insights (philosophical takeaways) |
| `achievements_level1` | Quiz scores + exercises completed |

---

### Step 5: Write CREATE TABLE Statements

Write SQL `CREATE TABLE` statements for your final normalized schema. Below is the expected schema – you may adjust column names or data types as needed.

```sql
-- Table: modules_level1
CREATE TABLE modules_level1 (
    module_id INTEGER PRIMARY KEY,
    module_name TEXT NOT NULL
);

-- Table: skills_level1 (combines skills + learning objectives)
CREATE TABLE skills_level1 (
    skill_id INTEGER PRIMARY KEY,
    module_id INTEGER,
    filename TEXT NOT NULL,
    skill_name TEXT NOT NULL,
    objective_text TEXT,
    student_viewpoint TEXT,
    FOREIGN KEY (module_id) REFERENCES modules_level1(module_id)
);

-- Table: bonus_skills_level1
CREATE TABLE bonus_skills_level1 (
    bonus_skill_id INTEGER PRIMARY KEY,
    module_id INTEGER,
    bonus_skill_name TEXT NOT NULL,
    filename TEXT,
    source TEXT,
    FOREIGN KEY (module_id) REFERENCES modules_level1(module_id)
);

-- Table: insights_level1
CREATE TABLE insights_level1 (
    insight_id INTEGER PRIMARY KEY,
    insight_text TEXT NOT NULL,
    source TEXT,
    filename TEXT,
    module_id INTEGER,
    student_viewpoint TEXT,
    FOREIGN KEY (module_id) REFERENCES modules_level1(module_id)
);

-- Table: achievements_level1 (combines quizzes + exercises)
CREATE TABLE achievements_level1 (
    achievement_id INTEGER PRIMARY KEY,
    module_id INTEGER,
    quiz_score INTEGER,
    exercise_filename TEXT,
    completed_status BOOLEAN DEFAULT 1,
    student_viewpoint TEXT,
    FOREIGN KEY (module_id) REFERENCES modules_level1(module_id)
);
```

**Save as:** `design/schema.sql`

---

```mermaid
flowchart TD
    A["Flat Spreadsheet<br/>(Step 0)"] --> B["1NF<br/>Atomic values"]
    B --> C["2NF<br/>Remove partial dependencies"]
    C --> D["3NF<br/>Remove transitive dependencies"]
    D --> E["Final Normalized Schema<br/>5 tables with _level1 suffix"]
    
    style A fill:#ffebee
    style B fill:#e1f5fe
    style C fill:#fff8e1
    style D fill:#e8f5e8
    style E fill:#c8e6c9
```

---

## 💎 Phase 2: COLLECT – Mining the Gemstones

Now, populate your tables with **your actual data** – not sample data.

### Where to Find Information (Extraction Templates)

**Module 4 Skills (copy-paste template):**

| Skill Name | Filename |
|------------|----------|
| Intro to Joins | 1-IntroToJoins.md |
| INNER JOIN | 2-InnerJoin.md |
| LEFT JOIN | 3-LeftJoin.md |
| Joining Multiple Tables | 4-JoiningMultipleTables.md |
| Self Join | 5-SelfJoin.md |
| Join Conditions | 6-JoinConditions.md |

**Bonus Skills (look in these files):**
- `0-refactoring-lab.md` → CREATE TABLE, ALTER TABLE, DROP TABLE
- `5-SelfJoin.md` (Dynamic Data Check) → INSERT OR IGNORE
- `SQLVerse-Architects-Blueprint/2-Foreign-Keys-Referential-Integrity.md` → DELETE

**Perigon Insights:** Search for `💎 DESIGNER'S PERIGON` across every Level 1 file you have access to (Technical Guide, Level 1 README, Level 1 Master Guide, Module Guides, concept files, practice exercises, exercise solutions, capstone reports, and SQLVerse Architect's Blueprint).

---

### Module-by-Module Reference

| Module | Concept Files Location | Progress Check Locations | Notes |
|--------|------------------------|--------------------------|-------|
| **Module 1** | `1-sqlCommands/` (3 files) | Each concept file (Files 1, 2, 3) | Check the **last concept file** (`File 3`) for bonus skills. |
| **Module 2** | `1-sqlCommands/` (7 files) | Each concept file (Files 1–7) | Check the **last concept file** (`File 7`) for bonus skills. |
| **Module 3** | `1-sqlCommands/` (5 files) | Each concept file (Files 1–5) | Check the **last concept file** (`File 5`) for bonus skills. |
| **Module 4** | `1-sqlCommands/` (6 files + Refactoring Lab + SQLVerse Architect's Blueprint folder) | Each concept file (Files 1–6) | Check the **last concept file** (`File 6`), the **Refactoring Lab** (`0-refactoring-lab.md`), and the **SQLVerse Architect's Blueprint** folder for bonus skills and Perigon insights. |

---

### Student Viewpoint Examples

Use these as inspiration for your own reflections:

- "Toys NULL insight was huge!"
- "ON vs WHERE finally clicked"
- "Self-join aliases = mandatory"
- "Cartesian scared me straight"

---

### Write INSERT Statements

Write `INSERT` statements to populate each table with your collected data.

```sql
-- Example:
INSERT INTO modules_level1 (module_id, module_name) VALUES
(1, 'Module 1: Introduction to Databases & AI Co-pilot'),
(2, 'Module 2: Basic Retrieval – SELECT & WHERE');

INSERT INTO skills_level1 (skill_id, module_id, filename, skill_name, objective_text, student_viewpoint) VALUES
(1, 2, '1-the-sieve-select.md', 'SELECT clause', 'Write a SELECT query', 'I finally understood that SELECT runs after FROM!');

INSERT INTO bonus_skills_level1 (bonus_skill_id, module_id, bonus_skill_name, filename, source) VALUES
(1, 4, 'DELETE', '2-Foreign-Keys-Referential-Integrity.md', 'SQLVerse Architect''s Blueprint');

INSERT INTO insights_level1 (insight_id, insight_text, source, filename, module_id, student_viewpoint) VALUES
(1, 'A spreadsheet is an aquarium; a database is an ocean.', 'Module 1 File 1', '1-what-is-a-database.md', 1, 'This metaphor stayed with me throughout Level 1');

INSERT INTO achievements_level1 (achievement_id, module_id, quiz_score, exercise_filename, completed_status, student_viewpoint) VALUES
(1, 2, 90, '1-basic-select.md', 1, 'This was my first real query – exciting!');
```

**Save as:** `collect/insert-data.sql`

---

### Optional: Data Collection Notes

Create a file `collect/data-collection.md` to note where you found each piece of information (for future reference).

```markdown
## Module 3

**Skills:** Found in `1-sqlCommands/` folder – 1-order-by.md, 2-aggregate-functions.md, etc.
**Learning Objectives:** Extracted from Progress Check in each file (Files 1–5).
**Bonus Skills:** Bulk Insert from File 1; UPDATE from File 4; DELETE from SQLVerse Architect's Blueprint File 2.
**Perigon Insights:** Found two in File 5 – one about the garden, one about counting. Also found one in the Level 1 README.
**Student Viewpoint:** Based on my notes from when I struggled with HAVING.
**Quiz Score:** 88 (saved in module3-quiz-answers.md)
**Exercises Completed:** All 5 files in 2-practiceExercises/
```

---

## 🖼️ Phase 3: DISPLAY – The Artisan's Showcase

Now, query your own database to produce a "Completion Report."

### Required Queries (Write at least 5)

1. **Which module did I score the highest on the quiz?**
```sql
-- Your query here
```

2. **List all skills I learned in Module 3, with cleaned‑up names.**
```sql
-- Your query here
```

3. **Show me all bonus skills across all modules.**
```sql
-- Your query here
```

4. **Count how many practice exercises I completed.**
```sql
-- Your query here
```

5. **Display each Perigon insight from Module 4, along with my viewpoint.**
```sql
-- Your query here
```

6. **List all learning objectives for Module 2, along with my personal viewpoint.**
```sql
-- Your query here
```

7. **Show all exercises I completed in Module 4 with my reflections.**
```sql
-- Your query here
```

8. **Total number of skills per module.**
```sql
SELECT m.module_name, COUNT(s.skill_id) AS total_skills
FROM modules_level1 m
LEFT JOIN skills_level1 s ON m.module_id = s.module_id
GROUP BY m.module_id;
```

9. **Total number of bonus skills per module.**
```sql
SELECT m.module_name, COUNT(b.bonus_skill_id) AS total_bonus_skills
FROM modules_level1 m
LEFT JOIN bonus_skills_level1 b ON m.module_id = b.module_id
GROUP BY m.module_id;
```

### Portfolio Showcase Query

```sql
-- "My Transformation Report"
SELECT 
    m.module_name,
    COUNT(s.skill_id) as skills_mastered,
    AVG(a.quiz_score) as avg_quiz_score,
    COUNT(a.exercise_filename) as exercises_completed
FROM modules_level1 m
LEFT JOIN skills_level1 s ON m.module_id = s.module_id
LEFT JOIN achievements_level1 a ON m.module_id = a.module_id
GROUP BY m.module_id
ORDER BY skills_mastered DESC;
```

### The Consistency Check (Proving Your Normalization Worked)

```sql
-- Find any modules that exist but have zero skills recorded
SELECT m.module_name
FROM modules_level1 m
LEFT JOIN skills_level1 s ON m.module_id = s.module_id
WHERE s.skill_id IS NULL;
```

**Why This Proves Normalization Worked:**
- **Pre‑normalization:** Deleting "INNER JOIN" would have lost the Module 4 quiz score.
- **Post‑normalization:** The `modules_level1` row survives independently.
- **Insertion Anomaly SOLVED:** You can add Module 5 anytime without needing a dummy skill.

### Your Legacy Query

```sql
SELECT insight_text 
FROM insights_level1 
WHERE student_viewpoint LIKE '%click%'
ORDER BY RANDOM() 
LIMIT 1;
```

**Save as:** `display/queries.sql`

---

### README.md Template

Create a `README.md` file in your `ACQUIRE_COMPLETION/` folder using this template:

```markdown
# My ACQUIRE Portfolio

## My Transformation Report
**Total Skills:** [run your total skills query]
**Highest Quiz Score:** [run your highest quiz query]
**Favorite Insight:** [run your Legacy Query]

## Screenshots
![Transformation Report](transformation.png)
![Consistency Check](consistency.png)

## Reflections
[Write a short paragraph about your journey through Modules 1–4]
```

---

## ✅ Final Checklist

- [ ] Schema creates without errors
- [ ] All INSERTs succeed
- [ ] 5+ portfolio queries work
- [ ] Files organized in 3 folders (design/, collect/, display/)
- [ ] README.md created with screenshots
- [ ] GitHub commit message: "ACQUIRE Completion: My Learning Portfolio"
- [ ] I am proud of what I built

---

## 💎 DESIGNER'S PERIGON

<div style="border: 3px solid #9c27b0; border-radius: 10px; padding: 20px; margin: 25px 0; background: linear-gradient(135deg, #f3e5f5 0%, #e1bee7 100%);">

### *The Art of Reflection*

You have done something remarkable. You didn't just learn SQL – you built a database of your own learning journey. Every table, every row, every foreign key represents a gemstone you mined from the SQLVerse.

In the Artisan's Garden, this is the **final bouquet** – a collection of flowers you grew, trimmed, and arranged yourself.

> *“The best database you will ever design is the one that captures your own growth.”*

### 🌸 The Final Bouquet

**Transforms beginners → Architects with proof.**

| Day | Milestone |
|-----|-----------|
| **Day 1** | "Normalize my own data? Cool!" |
| **Day 3** | "My transformation report = wow!" |
| **Week 1** | "Portfolio screenshot → LinkedIn" |
| **Month 1** | "Interview: 'Show me your SQL portfolio'" |

**The SQLVerse expands. Your portfolio is proof.**

</div>

---

## 🧭 What's Next?

Return to the **Level 1 Master Guide** and proceed to the **ACCELERATE** phase.

➡️ **[Return to MASTER_GUIDE.md](./MASTER_GUIDE.md)**

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

**Level 1 | ACQUIRE Completion | Next: ACCELERATE Phase**


