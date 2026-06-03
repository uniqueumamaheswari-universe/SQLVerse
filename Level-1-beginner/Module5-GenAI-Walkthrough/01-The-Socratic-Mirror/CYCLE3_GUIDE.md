

# 🗄️🤖 SQL & GenAI Course
**🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost**

---

## 🔄 ACCELERATE Cycle 3 Guide: Module 4 (Spiral Chamber)

You have entered the spiral. This is a self‑contained spiral traversal chamber. Work through the three phases in order. After completing all three, return to the Navigation Guide to log your Lap 3 Black Box Feedback.

> **Browser Office:** Your four tabs are already configured. Tab 3 is set up according to `BROWSER-OFFICE-ACCELERATE.md` – Socratic Mentor mode, no code generation.

---

## 🎯 Cycle 3 Learning Objectives

By completing this cycle, you will be able to:
- Apply Socratic questioning to all Module 4 concepts (JOINs, normalisation, self‑join, foreign keys)
- Understand **Foreign Keys** and **Referential Integrity** as the glue of relational databases
- Apply **normalisation** (1NF → 2NF → 3NF) to refactor a flat table into a clean schema
- Complete the **E‑Store Refactoring Lab** (`0-refactoring-lab.md`)
- Diagnose and fix broken AI‑generated queries involving JOINs and normalisation (6 LABs)
- Validate your reasoning against golden prompts (6 KEYs)
- Extract gemstones for your Skill‑Tree from both ACQUIRE and ACCELERATE

---

<div align="center" style="border: 2px solid #ff9800; border-radius: 10px; padding: 15px; margin: 20px 0; background: linear-gradient(135deg, #fff8e1 0%, #ffe0b2 100%);">

### 🗄️ Specialised Databases for Module 4

Unlike Modules 2 and 3 (which used `level1_estore_basic.db` and `training_institution_sample.db`), Module 4 uses **specialised databases** for different concepts (e.g., `level1_estore_self_join.db`, `tourism_planet_self_join.db`, `training_institution_self_join.db`). The exact database to load for each concept is explained inside the Socratic Mirror files and in `BROWSER-OFFICE-ACCELERATE.md`.

</div>

---

<div align="center" style="border: 2px solid #9c27b0; border-radius: 10px; padding: 15px; margin: 20px 0; background: linear-gradient(135deg, #f3e5f5 0%, #e1bee7 100%);">

### 🎭 Birthplace of the SQLVerse

Module 4 is where the **SQLVerse characters** (Arjun, Geetha, Raj, Ravi, Annie, Simon) and their domains first appear. The concepts you master here – JOINs, normalisation, self‑join – are the foundation for the **Reality Chambers** (the next leg of ACCELERATE). You will not complete simulations inside this cycle; instead, you will build the structural knowledge required to conquer them later.

</div>

---

<div align="center" style="border: 2px solid #2196f3; border-radius: 10px; padding: 15px; margin: 20px 0; background: linear-gradient(135deg, #e1f5fe 0%, #bbdefb 100%);">

### 🔗 The Relational Bridge

Module 2 filtered **rows**. Module 3 compressed **rows**.  
Module 4 **connects rows across tables** – using foreign keys, JOINs, and normalisation to build multi‑source truth.

You will also refactor the flat E‑Store database into a normalised schema (the **Refactoring Lab**), applying 1NF → 2NF → 3NF rules. This is where you transition from query writer to **schema architect**.

</div>

---

## 🗺️ The Spiral Flight Path

> **Flight Rule:** Complete an entire Pass horizontally across all concepts before dropping down to the next vertical layer. Never cross‑thread or jump ahead.

```mermaid
flowchart LR
    Start["🌀 Start Cycle 3"] --> Augment["🔍 AUGMENT<br/>Socratic Mirror<br/>(Concepts 1 ➔ 7)"]
    Augment --> Loop1["🔁 Loop Back &<br/>Drop Down"]
    Loop1 --> Apply["🧪 APPLY<br/>Exercise Bay<br/>(LABs 0 ➔ 5)"]
    Apply --> Loop2["🔁 Loop Back &<br/>Drop Down"]
    Loop2 --> Audit["🔑 AUDIT<br/>Solution Validation<br/>(KEYs 0 ➔ 5)"]
    Audit --> Exit["🚀 Orbit Complete<br/>Return to Control Deck"]

    style Start fill:#e1f5fe,stroke:#2196f3
    style Augment fill:#fff8e1,stroke:#ff9800
    style Apply fill:#fff8e1,stroke:#ff9800
    style Audit fill:#fff8e1,stroke:#ff9800
    style Exit fill:#c8e6c9,stroke:#2e7d32,stroke-width:2px
```

---

## 📎 **Mirror Bridge Convention**

This section explains the underlying **file system symmetry** between ACQUIRE and ACCELERATE — the structural foundation of the **Mirror Bridge Architecture.**

### **Folder Mapping**

| ACQUIRE folder | ACCELERATE folder |
|----------------|-------------------|
| `1-sqlCommands` | `01-The-Socratic-Mirror` |
| `2-practiceExercises` | `02-Exercises` |
| `4-exerciseAndQuizSolutions` | `03-Solutions` |

### **File Naming Rules**

- **AUGMENT files** are exact 1:1 mirrors of ACQUIRE concept files (same filename as in `1-sqlCommands`).
- **APPLY files** mirror ACQUIRE practice exercises files with `-LAB` appended (e.g., `4-like-and-null.md` → `4-like-and-null-LAB.md`).
- **AUDIT files** mirror ACQUIRE exercises and solution files with `-KEY` substituted instead of `-solutions` (e.g., `4-like-and-null-solutions.md` → `4-like-and-null-KEY.md`).

This ensures isomorphic mapping between **ACQUIRE** and **ACCELERATE** while clearly distinguishing the three passes.

---

## 🔍 AUGMENT – The Socratic Mirror

**Cognitive Goal:** abstraction & logic formation

**Base path:** `01-The-Socratic-Mirror/ACQUIRE-MODULE4/`

| Concept Focus | Mirror Bridge File (1:1 mapping with ACQUIRE) |
|---------------|------------------------------------------------|
| Why Join Tables? (Bridge Metaphor) | `1-IntroToJoins.md` |
| The Perfect Match (INNER JOIN) | `2-InnerJoin.md` |
| The Inclusive Bridge (LEFT JOIN) | `3-LeftJoin.md` |
| Chaining Joins (Multiple Tables) | `4-JoiningMultipleTables.md` |
| The Mirror Bridge (SELF JOIN) | `5-SelfJoin.md` |
| Precision Conditions (ON vs WHERE) | `6-JoinConditions.md` |
| Rules of Clean Design (Normalisation) | `7-Normalization.md` |

> 💡 After completing each concept, extract gemstones (skill, objective, viewpoint) into `EXTRACTION_BAY/SkillTree/GemstoneArray.md`.

✅ **After completing all 7 concepts**, return here and proceed to **APPLY**.

---

## 🧪 APPLY – The Exercise Bay

**Cognitive Goal:** struggle & implementation

**Base path:** `02-Exercises/MODULE4/`

**Tab 2:** Load the specialised database specified in each Socratic Mirror file (see `BROWSER-OFFICE-ACCELERATE.md`)

| LAB Focus | Mirror Bridge File (1:1 mapping with ACQUIRE) |
|-----------|------------------------------------------------|
| Refactoring Lab (Flat → Normalised) | `0-normalization-practice-LAB.md` |
| INNER JOIN Defect Cleanup | `1-inner-join-practice-LAB.md` |
| LEFT JOIN Boundary Debugging | `2-left-join-practice-LAB.md` |
| Multiple Tables Chaining Errors | `3-multiple-tables-practice-LAB.md` |
| SELF JOIN Structural Fixes | `4-self-join-practice-LAB.md` |
| Mixed JOIN Logic Audits | `5-mixed-joins-practice-LAB.md` |

> 💡 After completing each LAB, extract any anti‑pattern gemstones into `GemstoneArray.md`.

<div align="center" style="border: 2px solid #4caf50; border-radius: 10px; padding: 15px; margin: 20px 0; background: linear-gradient(135deg, #e8f5e8 0%, #c8e6c9 100%);">

### 🔄 Two Labs, Two Cognitive Goals

| Lab | Focus | Cognitive Goal |
|-----|-------|----------------|
| **`0-refactoring-lab.md`** | Extend and evolve the existing normalised E‑Store schema (add new tables, relationships, constraints) | **Architectural Evolution** – extending a living schema |
| **`0-normalization-practice-LAB.md`** | Apply normalisation rules to a **new business domain** | **Transferability** – designing a clean schema from scratch |

This is not duplication. It is **layered reinforcement**: first you extend, then you transfer.

</div>

✅ **After completing all 6 LABs**, return here and proceed to **AUDIT**.

---

## 🔑 AUDIT – Solution Validation

**Cognitive Goal:** validation & calibration

**Base path:** `03-Solutions/MODULE4/`

| KEY Focus | Mirror Bridge File (1:1 mapping with ACQUIRE) |
|-----------|------------------------------------------------|
| Normalisation Verification | `0-normalization-practice-KEY.md` |
| INNER JOIN Golden Alignment | `1-inner-join-practice-KEY.md` |
| LEFT JOIN Correctness Check | `2-left-join-practice-KEY.md` |
| Multiple Tables Reasoning Baseline | `3-multiple-tables-practice-KEY.md` |
| SELF JOIN Validation Audit | `4-self-join-practice-KEY.md` |
| Mixed JOIN Calibration Framework | `5-mixed-joins-practice-KEY.md` |

> 💡 After completing each KEY, extract final validation gemstones into `GemstoneArray.md`.

✅ **After completing all 6 KEYs**, your Cycle 3 spiral is complete.

---

## 🏁 MISSION CLEARED: RETURN RUNWAY

**🔒 CYCLE 3 COMPLETE**

All horizontal passes are executed, and all internal cognitive checkpoints have been verified. Your orbit around Module 4 data domains is officially complete.

<div align="center" style="border: 3px solid #ff9800; border-radius: 10px; padding: 25px; margin: 30px 0; background: linear-gradient(135deg, #fff8e1 0%, #ffe0b2 100%); box-shadow: 0 8px 20px rgba(255, 152, 0, 0.2);">

# [▶️ **RETURN TO FLIGHT CONTROL DECK**](../MODULE5_NAVIGATION_GUIDE.md)

**Log your Lap 3 Black Box Telemetry**

</div>

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

**Level 1 | ACCELERATE Phase | Cycle 3 Guide (Module 4) | Next: Return to Navigation Guide**


