


# 🗄️🤖 SQL & GenAI Course
**🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost**

---

## 🌐 Browser Office for ACCELERATE – AI Context Strategy

In ACCELERATE, your AI Consultant (Tab 3) needs **context** to give relevant, accurate advice. Without context, the AI will guess – and guessing leads to hallucinations, wrong syntax, and irrelevant examples.

The amount and type of context you provide depends on the module:

- **Modules 2 & 3** use the **same two databases** (`training_institution_sample.db` and `level1_estore_basic.db`) for every concept. You feed these schemas **once**, and the AI remembers them.
- **Module 4** uses **multiple specialised databases** (normalized E‑Store, self‑join databases, Tourism Planet, etc.). Each concept uses a different database. You feed **only the relevant schema** when you reach that file, and you **reset the AI’s memory** when switching databases.

This document is your step‑by‑step guide to feeding context correctly. Follow it in order.


---

## 🧭 The 5‑Step Context Workflow

| Step | Action |
|------|--------|
| **1** | Feed the character stories first |
| **2** | Understand the two‑tier context strategy |
| **3** | Load generic schema anchors (Modules 2 & 3) |
| **4** | Use file‑specific context boxes (Module 4) |
| **5** | Reset instruction when switching databases |
| **6** | Reference the schema anchor files |

---
## 📖 Step 1: Feed the Character Stories First (SQLVerse Lore)

The AI needs to know the SQLVerse characters before anything else.

Copy and paste these files into your AI Consultant (Tab 3):

**1. [`0-CAPSTONE-STORY.md`](../Module4-JoiningTables/2-practiceExercises/Capstone%20Reports/0-CAPSTONE-STORY.md)** – Arjun, Geetha, Raj  
**2. [`0-CAPSTONE-STORY-EXPANSION.md`](../Module4-JoiningTables/2-practiceExercises/Capstone%20Reports/0-CAPSTONE-STORY-EXPANSION.md)** – Ravi, Annie, Simon  

After each file, tell the AI: *“These are the SQLVerse characters. Use them to ground your examples.”*


> 💡 **Why this matters:** Without this context, the AI may ignore the character names or hallucinate fake stories. Feeding the stories first ensures its examples are grounded in the SQLVerse universe.

---

## 🧠 Step 2: Understand the Two‑Tier Context Strategy

ACCELERATE uses **two different strategies** for feeding database context, depending on the module:

| Tier | Modules | Strategy | Why |
|------|---------|----------|-----|
| **Tier 1** | Modules 2 & 3 | Generic schema anchors (once) | The same two databases (`training_institution_sample.db` and `level1_estore_basic.db`) are used for all concepts in these modules. Feed them once. |
| **Tier 2** | Module 4 | File‑specific context boxes (per concept) | Each concept uses a different specialised database (`level1_estore_normalized_MODULE4.db`, `level1_estore_self_join.db`, `tourism_planet_self_join.db`, etc.). Small table schemas provided at the top of each Socratic Mirror file. Feed only the relevant schema when you reach that file. |

### ✅ Why This Two‑Tier Strategy Works

| Benefit | Explanation |
|---------|-------------|
| **No overload** | You don’t feed all schemas at once. |
| **Context stays relevant** | Module 4 advice is grounded in the exact database you are using. |
| **AI doesn’t hallucinate** | It has the exact table and column names. |
| **Reset prevents contamination** | Switching domains is safe and clean. |
| **Repeatable** | The same pattern works for any future specialised database. |



> *“Don’t overload the AI. Give it only what it needs for the task at hand.”*

---

## 📦 Step 3: Load Generic Schema Anchors (Modules 2 & 3)

**Do this once at the start of ACCELERATE.** Feed these two files to the AI:

**- [`SCHEMA_ANCHOR_TRAINING_INSTITUTION_SAMPLE.md`](../SCHEMA_ANCHOR_TRAINING_INSTITUTION_SAMPLE.md)** – Education Planet (students, courses, enrollments, instructors, payments)
**- [`SCHEMA_ANCHOR_LEVEL1_ESTORE_BASIC.md`](../SCHEMA_ANCHOR_LEVEL1_ESTORE_BASIC.md)** – E‑Commerce Planet (customers, products, orders, order_items)

**How to feed them:**
- Open your AI Consultant (Tab 3).
- Copy and paste the contents of each file.

Tell the AI: *“These are the core schemas for ACCELERATE. Remember them.”*

> 💡 The AI will remember these for your entire session.

---

## 📂 Step 4: Use File‑Specific Context Boxes (Module 4)

For Module 4 concepts, **do not** use the generic anchors. Instead, each Socratic Mirror file in `01-The-Socratic-Mirror/ACQUIRE-MODULE4/` contains a **context box** at the top with:

- The exact database name
- The relevant tables and columns
- The business problem

**Example from `5-SelfJoin.md`:**

> **Database:** `level1_estore_self_join.db`  
> **Tables:** `employees` (employee_id, name, manager_id)  
> **Business problem:** Find employee–manager relationships using a self join.

Copy the entire context box and paste it into the AI before asking Socratic questions.

**Your workflow:**
1. Open the Socratic Mirror file (e.g., `5-SelfJoin.md`).
2. Copy the context box.
3. **Reset the AI’s memory for Module 4:**  
   Tell the AI: *“Discard previous specific table structures for Module 4. Here is the new context for [Concept Name].”*
4. Paste the context box.
5. Then ask your Socratic questions.

---

## 🔄 Step 5: Reset Instruction When Switching Databases

When you move from one Module 4 database to another (e.g., from `level1_estore_self_join.db` to `tourism_planet_self_join.db`), you must **reset the AI’s memory**.

When switching between Module 4 databases (e.g., from Self‑Join to Join Conditions), always reset the AI’s context. This prevents the AI from mixing up table structures from different domains. Say this exact phrase before pasting the new context box:

> *“Discard previous specific table structures for Module 4. Here is the new context for [Concept Name].”*

> 💡 **Pro‑Tip:** Without this reset, the AI may mix up tables from different databases and give incorrect advice.

---

## 🗄️ Step 6: Reference the Schema Anchor Files

The four specialised databases used in Module 4 have dedicated schema anchor files. They are located in `Module5-GenAI-Walkthrough/schema_anchors/`.

| Schema Anchor | Database | When to Use |
|---------------|----------|-------------|
| `SCHEMA_ANCHOR_ESTORE_NORMALIZED.md` | `level1_estore_normalized_MODULE4.db` | Join concepts (INNER, LEFT, chaining) |
| `SCHEMA_ANCHOR_ESTORE_SELF_JOIN.md` | `level1_estore_self_join.db` | Self‑join (employee hierarchy, product series) |
| `SCHEMA_ANCHOR_TOURISM_SELF_JOIN.md` | `tourism_planet_self_join.db` | Self‑join practice (tours, guides, customers) |
| `SCHEMA_ANCHOR_TRAINING_SELF_JOIN.md` | `training_institution_self_join.db` | Instructor mentorship self‑join |

You do not need to feed these files directly. The **context boxes** in the Socratic Mirror files already contain the essential table structures. Use these anchor files as a reference when you need the full schema.

---

## 🚀 Ready to Begin

- For **Modules 2 & 3**, feed the generic anchors once.
- For **Module 4**, follow the context box in each file and **reset the AI’s memory** before each new concept.

Now you understand how to feed context to the AI for every part of ACCELERATE. 

**The SQLVerse expands. Go build with clarity.**

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

**Level 1 | ACCELERATE Phase | Browser Office – AI Context Strategy**


