
# 🗄️🤖 SQL & GenAI Course
**🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost**

---

# SQLVerse Investigative Framework

## Business Data Evolution Across Levels

**Document ID:** `SQLVERSE-ARCH-FW-001`  
**Classification:** Core Intellectual Asset & Architectural Standard  
**Content:** SQLVerse Architectural Standard — Methodology  
**Version:** 1.0  
**Status:** FROZEN  

---

## 📌 Purpose

The Framework is a central, cross-level intellectual asset inside `sqlverse-foundation` which is the canonical source of truth for approved SQLVerse architectural and business-universe state.

This framework is not just a single module's curriculum—it is the systematic, repeatable engineering methodology that governs how the entire SQLVerse curriculum thinks about data modeling, business domain evolution, schema migrations, and analytical correctness.

**Scope:** SQLVerse Foundation, Level 1 (DDL & Engine State), Level 2 (Analytical Processing), Level 3 (Production Engineering)

---

## 🧠 Executive Summary & Philosophy

In production data engineering, analytical query failures are rarely caused by simple SQL syntax errors. They are almost always caused by **Grain Misalignment**, **Temporal Blindness**, or **Missing Business Mechanics**.

The **SQLVerse Master Investigative Framework** defines the universal protocol for diagnosing data model limitations, evaluating trade-offs, and evolving database schemas across all SQLVerse business universes.

---

### 🏛️ SQLVerse Core Architectural Pipeline

```
┌────────────────────────────────────────────────────────────────────────────────────────┐
│                        SQLVERSE CORE ARCHITECTURAL PIPELINE                            │
│                                                                                        │
│   INVESTIGATION LABORATORY         CANONICAL DATABASE STATE       ANALYTICAL & PROD ENGINE │
│  (Forensic Gap Diagnosis)        (Versioned DDL & Executable)     (Complex Query Execution)│
│ ┌─────────────────────────┐     ┌─────────────────────────┐     ┌─────────────────────────┐│
│ │   Blueprint Analysis    │ ──► │  Level 1 Foundation DB  │ ──► │   Level 2 & Level 3     ││
│ │   & Decision Ledger     │     │   (v1.0 ──► v1.1 ──► v1.2)│     │   Analytical Queries    ││
│ └─────────────────────────┘     └─────────────────────────┘     └─────────────────────────┘│
└────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## 1. Cross-Level Architecture & Repository Boundaries

> **Investigation Laboratory → Foundation → Execution & Consumption**

To maintain software engineering rigor, SQLVerse enforces a strict three-layer separation of concerns:

| Layer | Role |
|-------|------|
| **1. The Investigation Laboratory (Blueprint Layer)** | The sandbox where data model deficits are identified, diagnostic queries are executed, alternatives are weighed, and Architectural Decision Records (ADRs) are logged. |
| **2. The Foundation Layer (`sqlverse-foundation`)** | The single source of truth holding canonical schema DDLs, versioned SQLite binaries (`.db`), data dictionaries, and historical evolution records. |
| **3. The Execution & Consumption Layer (Levels 2 & 3)** | The analytical runtime where queries, window functions, cohorts, and pipelines consume the evolved schema state defined by the Foundation. |

---

### 📂 SQLVerse Intellectual Asset Flow

```text
SQLVerse Intellectual Asset
        │
        ▼
Investigative Framework
        │
        ├───────────────┐
        ▼               ▼
Investigation       Architectural
Laboratory          Standards
(Blueprint)         & Lineage
        │
        ▼
Approved Decision
        │
        ▼
SQLVerse Foundation
        │
        ▼
Canonical Universe State
        │
        ├── Level 1
        ├── Level 2
        └── Level 3
```

---

## 2. The Universal 11-Step Reasoning Pipeline

Every diagnostic investigation and schema evolution across all business universes must execute this unyielding 11-step sequence:

```text
 01. BUSINESS PRESSURE       ──► What operational/financial friction is occurring?
 02. BUSINESS QUESTION       ──► What specific question must the business answer?
 03. REQUIRED FACT           ──► What physical measurement/attribute is needed?
 04. REQUIRED GRAIN          ──► What exact entity/event level holds this fact?
 05. CURRENT MODEL ANALYSIS  ──► What DDL, PKs, FKs, and constraints currently exist?
 06. AVAILABLE FACT & GRAIN  ──► What fact and level of detail does the schema actually store?
 07. GAP DIAGNOSIS           ──► What is the exact delta between Required and Available?
 08. FORENSIC PROOF          ──► Execute SQL proving current schema failure or ambiguity.
 09. SOLUTION OPTIONS        ──► What legitimate architectural alternatives exist?
                               ──► What are their trade-offs?
                               ──► Which preserve required grain, history, integrity, performance, and domain meaning?
 10. ARCHITECTURAL JUDGMENT  ──► Select winning path based on required grain, temporal integrity, data integrity, performance, and domain meaning.
 11. DECISION & HAND-OFF     ──► Log ADR entry and issue migration DDL or Business Rule View.
```

---

## 3. The Core Invariant: Grain Diagnostic Framework

Grain determines how data is stored, joined, and aggregated.

```text
Table Grain = The real-world entity or event represented by exactly ONE row in a table
```

---

### 📊 High (Fine) Granularity vs. Low (Coarse) Granularity

| Fine-Grained (Atomic) | Coarse-Grained (Aggregated) |
|-----------------------|----------------------------|
| One row = Specific transaction line item | One row = Rollup / summary state |
| Lossless, point-in-time state | Information loss, cannot disaggregate |
| Example: `Order_Items (order_id, product_id)` | Example: `Products (product_id)` |

```text
FINE-GRAINED
More individual facts
More detail
Less aggregation

COARSE-GRAINED
More summarized facts
Less detail
More aggregation
```

> 💡 **In data modeling, fine-grained data is often described as having higher granularity.**

---

### 🏛️ The Universal Grain Rules

| Rule | Description |
|------|-------------|
| **1. Primary Key Rule** | A table's grain is the business meaning of one row. Its primary key and unique constraints enforce the identity of that grain. If a primary key is compound `(order_id, product_id)`, the grain is one specific line item per order. |
| **2. Query Grain vs. Table Grain** | Table Grain is the physical level stored on disk. Query Grain is the aggregation level defined by `GROUP BY`. You can aggregate fine-grained data up to coarse query grain, but **you can never disaggregate coarse data down to fine query detail if the underlying grain was never stored.** |
| **3. Join Multiplication Risk** | Joining a coarse table directly to a fine table without adjusting aggregation logic causes fan-out duplicate summation (e.g., repeating order shipping fees per line item). |

---

## 4. Precision Gap Taxonomy

When a query fails to answer a critical business question, the failure must be classified using the standard SQLVerse Taxonomy:

| Gap Classification | Core Diagnostic Question | Technical Manifestation |
|-------------------|--------------------------|-------------------------|
| **`ATTRIBUTE_GAP`** | Is a required static property missing from an existing entity? | Missing column on a table where the storage grain is otherwise correct. |
| **`ENTITY_GAP`** | Is an entire business process or real-world noun completely missing? | Missing table or associative structure; events cannot be logged. |
| **`RELATIONSHIP_GAP`** | Do required entities exist but lack structural interaction paths? | Missing Foreign Key, junction table, or incorrect cardinality. |
| **`TEMPORAL_GAP`** | Is required historical state or event timing overwritten by current state? | Destructive `UPDATE` statements overwrite past truth. |
| **`GRAIN_GAP`** | Does the model represent the fact at the wrong level of detail? | Facts exist at a summary level when transactional detail is required. |
| **`REQUIREMENT_GAP`** | Is the business criterion or metric definition itself ambiguous or missing? | The schema is capable, but business logic lacks a standardized formula. |

> 📌 **Taxonomic Note:** A complex real-world outage may span multiple dimensions (e.g., a `TEMPORAL_GAP` manifesting at the wrong `GRAIN`), but every investigation must isolate the **Primary Forensic Gap** driving the architectural change.

---

## 5. Dual Case Investigation Contracts

To ensure rigorous documentation while respecting case-specific differences, investigations follow one of two standardized six-file formats.

---

### Contract Type A: Schema Evolution Case (DDL Modifying)

Used when resolving the gap requires altering database schema structures.

```text
case-study-folder/
├── 01-business-question.md          # Business context, decision-maker, required fact & grain
├── 02-current-schema-analysis.md     # Existing ERD, PK/FK mappings, current table grain
├── 03-data-gap-diagnosis.md          # Primary/Secondary gaps, diagnostic query proving failure
├── 04-solution-options.md            # Structural alternatives (min 2-3) & trade-off matrix
├── 05-architectural-decision.md      # ADR entry, selection rationale, performance impact
└── 06-schema-evolution-proposal.sql  # Safe DDL/DML migration script with verification checks
```

---

### Contract Type B: Requirement Clarification Case (Non-DDL Modifying)

Used when the database model is structurally sound, but business rules or metrics are ambiguous.

```text
case-study-folder/
├── 01-business-question.md          # Stakeholder pressure, metric conflict, analytical ambiguity
├── 02-current-model-analysis.md      # Capabilities assessment of existing tables and joins
├── 03-requirement-gap-diagnosis.md  # Proof of ambiguity via conflicting SQL output
├── 04-interpretation-options.md      # Competing business definitions & operational impact
├── 05-requirement-decision.md        # Governance decision, canonical analytical standard
└── 06-approved-business-rule.md     # SQL view definition or semantic formula standard
```

---

## 6. Architectural Decision Taxonomy & Ledger Contract

Every structural change or rule definition is categorized into one of seven decision types and logged in the central ledger.

---

### Decision Taxonomy

| Decision Type | Description |
|---------------|-------------|
| **`ATTRIBUTE_EVOLUTION`** | Adding scalar columns to capture static or point‑in‑time facts |
| **`ENTITY_EVOLUTION`** | Creating new primary tables to model previously unrepresented entities |
| **`RELATIONSHIP_EVOLUTION`** | Introducing junction tables or FKs to map entity interactions |
| **`GRAIN_RESTRUCTURING`** | Modifying table keys to alter the physical level of detail |
| **`REQUIREMENT_CLARIFICATION`** | Standardizing business definitions without DDL changes |
| **`DERIVATION`** | Approving a view‑layer calculation because atomic facts already exist |
| **`REJECT_UNSUPPORTED`** | Refusing a schema modification that violates domain boundaries |

> 🔑 **Key Distinction:**
>
> **Decision Type ≠ Solution Type**
>
> The taxonomy represents the **final architectural disposition**, not the initial diagnosis.
>
> A `GRAIN_GAP` diagnosis may lead to a `RELATIONSHIP_EVOLUTION` decision.
> A `TEMPORAL_GAP` diagnosis may lead to a `GRAIN_RESTRUCTURING` decision.
> The diagnosis identifies the problem; the decision identifies the architectural resolution.

---

### 📋 Ledger Contract (`ARCHITECTURAL_DECISION_LEDGER.md`)

```markdown
### ADR-[ID]: [Title]
- **Status:** APPROVED | REJECTED
- **Domain Universe:** [E-Store | Real Estate | Hospital | FinVERSE]
- **Decision Type:** [From Decision Taxonomy]
- **Baseline Version:** [e.g., v1.0]
- **Target Version:** [e.g., v1.1 | N/A for Rule Clarifications]
- **Observed Failure:** Statement of operational or financial breakdown.
- **Root Cause & Gap:** Primary Gap taxonomy classification.
- **Decision Rationale:** Justification for selected trade-off.
- **Foundation Artifact:** Path to migration script or approved business rule view.
```

---

## 7. Canonical Lineage & Handoff Contract

To ensure complete historical traceability and zero silent schema corruption, universes evolve along explicit, versioned lineage paths:

```text
[Universe Baseline v1.0]
         │
         ├── Migration Event 1 (ADR-001) ──► Evolution Record v1.1 ──► [Universe v1.1.db]
         │
         └── Migration Event 2 (ADR-002) ──► Evolution Record v1.2 ──► [Universe v1.2.db]
```

---

### 🏛️ The Invariant Lineage Law

> **Original schema is Evidence. Evolution record is Proof. Evolved database is Executable State.**

| Principle | Description |
|-----------|-------------|
| **1. Baseline Integrity** | Baseline DDL files (`v1.0`) are **never directly edited**. |
| **2. Atomic Migration** | All DDL modifications are committed via atomic migration scripts in the Foundation repository. |
| **3. Versioned Executable** | Every approved migration produces a new versioned SQLite binary (`.db`) for Level 2 and Level 3 query execution. |

---

## 📌 Endnote

### 🏛️ The Framework in a Nutshell

```text
SQLVERSE-ARCH-FW-001
        │
        ▼
SQLVerse Investigative Framework
        │
        ├── Level 1
        │     └── Module 4 applies it
        │
        ├── Level 2
        │     └── applies it to future evolution
        │
        └── Level 3
              └── applies it to production evolution
```

---

### 🔑 The Critical Boundaries

```text
Framework
   = HOW SQLVerse investigates evolution

Blueprint
   = WHERE the investigation is performed

Decision Ledger
   = WHAT architectural judgment was made

Evolution Record
   = WHY the canonical state changed

Foundation
   = WHAT the approved state is

Levels 1–3
   = HOW that state is consumed
```

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

**SQLVerse | Architecture | Investigative Framework | Document ID: SQLVERSE-ARCH-FW-001**