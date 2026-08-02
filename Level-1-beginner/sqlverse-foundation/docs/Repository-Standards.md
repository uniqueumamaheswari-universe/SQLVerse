

# 🗄️🤖 SQL & GenAI Course
**🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost**

---

# 🗄️ SQLVerse Repository Standards

## 📌 Purpose

This document is the **authoritative reference** for the SQLVerse repository structure, naming conventions, and governance rules. It defines how the repository is organised, how files are named, how universes are classified, and how the repository evolves across levels.

**The Manifesto inspires. The Guide teaches. The README orients. The Standards preserve consistency.**

---

## 🧭 Repository Principles

The repository is organised around three principles:

| Principle | Meaning |
|-----------|---------|
| **Separation of Concerns** | Philosophy, learning assets, and reusable frameworks live in distinct folders. |
| **Single Source of Truth** | Every artifact lives in exactly one place — no duplication. |
| **Scalability** | The repository is designed to grow. |

---

## 🏛️ Repository Architecture

### 📁 Folder Structure & Responsibilities

```
sqlverse-foundation/
│
├── README.md                           
│
├── core/                               → Foundational philosophy
├── resources/                          → What students use
├── projects/                           → Reusable frameworks (future)
├── docs/                               → Maintainer documentation
└── ...                                 → Designed to grow
```

| Folder | Purpose |
|--------|---------|
| **`core/`** | Foundational documents that explain the philosophy, principles, and evolution of SQLVerse |
| **`resources/`** | Learning assets — Blueprints, Schema Guides, and Databases for each universe |
| **`projects/`** | Reusable templates and frameworks developed during ANALYZE and ARCHITECT phases |
| **`docs/`** | Maintainer documentation — including this document |
| **`...`** | Additional top‑level folders may be added as the SQLVerse evolves |

---

### `core/` — The Why

**Purpose:** Contains the foundational documents that define the SQLVerse identity, philosophy, and learning architecture.

| File | Purpose |
|------|---------|
| `SQLVERSE_BUSINESS_MULTIVERSE.md` | The Manifesto — the constitution of enterprise data judgment |
| `00-SQLVerse-Business-Suite-Guide.md` | The Introduction — the cinematic welcome to the SQLVerse |


**Future additions to `core/`:**
- Learning philosophy documents
- Pedagogical frameworks
- Design principles

---

### `resources/` — The What

**Purpose:** Contains everything required to *use* a universe. This is the canonical source of truth for all learning assets.

#### Data Models

```
resources/data-models/
│
├── flagship-universes/
│   ├── 1-e-store/
│   ├── 2-hospital-planet/
│   ├── 3-real-estate-planet/
│   └── 4-finverse/
│
└── mini-universes/
    └── (future)
```

| Folder | Purpose |
|--------|---------|
| **`flagship-universes/`** | The four core universes — E‑Store, Hospital Planet, Real Estate Planet, FinVERSE |
| **`mini-universes/`** | Specialised domains introduced in Level 2 and Level 3 |

#### Universe Folder Structure

Each universe folder contains three artifacts:

```
{number}-{universe-name}/
│
├── {Universe}_Blueprint.md     -- The business story
├── {Universe}_Schema.md        -- The architecture and evolution
└── {universe}.db               -- The working database
```

**Example:**

```
2-hospital-planet/
│
├── Hospital_Planet_Blueprint.md
├── Hospital_Planet_Schema.md
└── hospital_planet.db
```

---

### `projects/` — The How

**Purpose:** Contains reusable templates and frameworks developed during the **ANALYZE** and **ARCHITECT** phases.

| Folder | Purpose |
|--------|---------|
| `frameworks/` | Reusable analytical frameworks |
| `templates/` | Query templates, report templates, documentation templates |
| `patterns/` | Design patterns and architectural blueprints |

**Note:** `projects/` folder  will be populated as the ANALYZE and ARCHITECT phases are developed.

---

## 🌌 Universe Classification

### 🏛️ Flagship Universe

A **Flagship Universe** is a core business domain that spans the entire learning journey. It has its own business identity, blueprint, schema, database, walkthroughs, and case studies. It is designed to evolve across Levels 1, 2, and 3.

**Examples:**
- E‑Store
- Hospital Planet
- Real Estate Planet
- FinVERSE

**Key Mental Model:** Core world. Spans all levels. Complete identity.

---

### 🛰️ Satellite

A **Satellite** is an extension of a Flagship Universe. It cannot exist independently because its entities, relationships, and business rules depend on the flagship. It deepens domain knowledge without creating a new world.

**Examples:**
- Fraud Detection → Extends **FinVERSE**
- Insurance Claims → Extends **Hospital Planet**
- Mortgage Processing → Extends **Real Estate Planet**

**Key Mental Model:** Same world, deeper layers.

**Sentence:** *"A Satellite extends a Flagship Universe."*

---

### 🪐 Mini-Universe

A **Mini-Universe** is a completely independent business world. It has its own business vocabulary, stakeholders, workflows, schema, and database. It can be studied without knowing any flagship universe.

**Examples:**
- Airline Management
- Hotel Management
- Manufacturing
- Logistics
- Insurance

**Key Mental Model:** New world, same logic.

**Sentence:** *"A Mini-Universe stands on its own."*

---

## 🏷️ Naming Conventions

| Type | Location | Naming Pattern | Example |
|------|----------|----------------|---------|
| **Flagship Universe** | `flagship-universes/` | `{number}-{name}` | `1-e-store` |
| **Satellite** | `flagship-universes/{number}-{name}/satellites/` | `L{level}-{name}` | `L2-fraud-detection` |
| **Mini-Universe** | `mini-universes/` | `L{level}-{name}` | `L1-airlines-management` |

### Folder Naming

| Type | Pattern | Example |
|------|---------|---------|
| Flagship Universe | `{number}-{universe-name}` | `1-e-store` |
| Satellite | `L{level}-{domain-name}` | `L2-fraud-detection` |
| Mini-Universe | `L{level}-{domain-name}` | `L1-airlines-management` |

### File Naming

| Type | Pattern | Example |
|------|---------|---------|
| Blueprint | `{Universe}_Blueprint.md` | `Hospital_Planet_Blueprint.md` |
| Schema Guide | `{Universe}_Schema.md` | `Hospital_Planet_Schema.md` |
| Database | `{universe}.db` | `hospital_planet.db` |

---

## 🔢 Flagship Numbering Convention

| Number | Universe | Why |
|--------|----------|-----|
| **1** | E-Store | Familiar operational thinking — students already understand customers, products, orders |
| **2** | Hospital Planet | Empathetic thinking — richer relationships, ethical context, critical workflows |
| **3** | Real Estate Planet | Emotional + analytical thinking — ambiguity, branching workflows, complex decisions |
| **4** | FinVERSE | Enterprise analytical thinking — precision, governance, systems thinking |

**The numbers encode the pedagogical progression.**

| Transition | Complexity Shift |
|------------|------------------|
| 1 → 2 | More entities, richer relationships, ethical context |
| 2 → 3 | More tables, branching workflows, ambiguous outcomes |
| 3 → 4 | Enterprise‑scale systems, regulatory constraints, precision demands |

---

## Domain Ownership Principle


Every artifact — Blueprint, Schema Guide, Database, Walkthrough, Case Study, Satellite, or Mini‑Universe — belongs to:

**Exactly one and only one parent business domain.**

**Artifacts are never duplicated** across multiple universes.

- When a capability **extends** an existing universe, it becomes a **Satellite.**
- When it introduces a **new business domain**, it becomes a **Mini‑Universe.**

---

## 🗺️ Universe Classification Decision Flow

Use this walkthrough to determine exactly where a new domain belongs in the SQLVerse repository.

---

**Start here:**

> *"I want to add a new domain."*

**Ask yourself:**

> *"Does this domain depend on, extend, or directly enhance an existing Flagship Universe?"*

---

### ✅ YES — It is a **Satellite**

If the domain requires the parent flagship's core entities, shares its business logic, or is a natural vertical expansion of that world, it is a **Satellite**.

**Examples:**
- Fraud Detection → Extends **FinVERSE**
- Insurance Claims → Extends **Hospital Planet**
- Mortgage Processing → Extends **Real Estate Planet**

**Action:**
Place it inside the parent Flagship's `satellites/` folder:

```
flagship-universes/4-finverse/
    └── satellites/
        └── L2-fraud-detection/
```

**Naming Rule:** Use `L{level}-{domain-name}` (e.g., `L2-fraud-detection`).

---

### ❌ NO — It is a **Mini-Universe**

If the domain is a completely independent business world with no structural dependency on any flagship, it is a **Mini-Universe**.

**Examples:**
- Airline Management → No relationship with E‑Store, Hospital, Real Estate, or FinVERSE
- Hotel Management → Standalone hospitality ecosystem
- Manufacturing → Independent production domain

**Action:**
Place it directly under `mini-universes/`:

```
mini-universes/
    └── L1-airlines-management/
```

**Naming Rule:** Use `L{level}-{domain-name}` (e.g., `L1-airlines-management`).

---

### 📂 The Repository: A Panoramic View

The following tree shows the complete structure of the SQLVerse repository, including all current and future additions.

```
sqlverse-foundation/
│
├── README.md
│
├── core/
│   ├── SQLVERSE_BUSINESS_MULTIVERSE.md
│   └── 00-SQLVerse-Business-Suite-Guide.md
│
├── resources/
│   └── data-models/
│       ├── flagship-universes/
│       │   ├── 1-e-store/
│       │   │   ├── level1_estore_apply.db
│       │   │   ├── E-Store_Blueprint.md
│       │   │   └── E-Store_Schema.md
│       │   ├── 2-hospital-planet/
│       │   │   ├── hospital_planet.db
│       │   │   ├── Hospital_Planet_Blueprint.md
│       │   │   └── Hospital_Planet_Schema.md
│       │   ├── 3-real-estate-planet/
│       │   │   ├── real_estate_planet.db
│       │   │   ├── Real_Estate_Planet_Blueprint.md
│       │   │   └── Real_Estate_Planet_Schema.md
│       │   └── 4-finverse/
│       │       ├── finverse.db
│       │       ├── FinVERSE_Blueprint.md
│       │       ├── FinVERSE_Schema.md
│       │       └── satellites/
│       │           ├── L2-fraud-detection/
│       │           ├── L2-credit-cards/
│       │           ├── L3-portfolio-management/
│       │           └── L3-international-transfers/
│       └── mini-universes/
│           ├── L1-airlines-management/
│           ├── L2-hotel-management/
│           └── L3-manufacturing/
│
├── projects/
│   └── (future)
│
└── docs/
    └── Repository-Standards.md
```

---

## 📝 Quick Reference Guide

| If you want to add... | It is a... | Place it here... |
|-----------------------|------------|------------------|
| Credit Cards (extends FinVERSE) | 🛰️ **Satellite** | `flagship-universes/4-finverse/satellites/` |
| Pharmacy Management (extends Hospital Planet) | 🛰️ **Satellite** | `flagship-universes/2-hospital-planet/satellites/` |
| Airline Management | 🪐 **Mini-Universe** | `mini-universes/` |
| Hotel Management | 🪐 **Mini-Universe** | `mini-universes/` |
| Fraud Detection (extends FinVERSE) | 🛰️ **Satellite** | `flagship-universes/4-finverse/satellites/` |
| Logistics | 🪐 **Mini-Universe** | `mini-universes/` |
| International Transfers (extends FinVERSE) | 🛰️ **Satellite** | `flagship-universes/4-finverse/satellites/` |

---

## 🤝 Contribution Guidelines

Even if only one person contributes, the rules are documented to ensure consistency:

1. **New domains** follow the Decision Flow to determine placement.
2. **Satellites** live inside their Flagship parent's `satellites/` folder.
3. **Mini‑Universes** live in `mini-universes/`.
4. **File names** follow the established naming standards.
5. **Versioning** is applied according to the Level 1 → Level 2 → Level 3 progression.
6. **New top‑level folders** are added to the `...` list and documented here.

---
## 🚀 Repository Evolution Strategy

The SQLVerse repository is designed to evolve alongside the learner.

| Level | What Changes | Examples |
|-------|--------------|----------|
| **Level 1** | Core artifacts are established — Blueprint, Schema Guide, and Database for each flagship universe | E‑Store, Hospital Planet, Real Estate Planet, FinVERSE |
| **Level 2** | Enhanced schemas with new tables. Satellites and Mini‑Universes are introduced. New business logic is added to existing universes. | Credit Cards, Fraud Detection added to FinVERSE; Insurance Claims added to Hospital Planet |
| **Level 3** | Enterprise‑scale extensions. Advanced analytical frameworks. Portfolio risk modelling, predictive analytics, and complex system governance. | Portfolio Management Services added to FinVERSE; Predictive Patient Outcomes added to Hospital Planet |

---

## 🚀 Future Expansion Strategy

The repository is designed to grow. The `...` at the top‑level signals that new folders can be added without restructuring:

- `skill-tree/` — The Skill‑Tree database and extraction workflows
- `characters/` — SQLVerse characters (Arjun, Geetha, Raj, etc.) and their scenarios
- `templates/` — Project templates, report templates, query templates

When a new top‑level folder is added, only this document needs to be updated — the Manifesto, the Guide, and the README remain stable.

---

## 🏛️ Summary Table

| Type | Core Concept | Relationship | Schema | Lifecycle | Location | Naming | Example |
|------|--------------|--------------|--------|-----------|----------|--------|---------|
| **Flagship Universe** | Core business world | Spans all levels | Complete, own schema | Entire course | `flagship-universes/` | `{number}-{name}` | `1-e-store` |
| **Satellite** | Domain expansion of a flagship | Lives inside flagship | Extends flagship schema | Introduced when the parent Flagship Universe expands. | `flagship-universes/{number}-{name}/satellites/` | `L{level}-{name}` | `L2-fraud-detection` |
| **Mini-Universe** | Independent business world | Standalone | Own schema | Introduced for specialised concepts | `mini-universes/` | `L{level}-{name}` | `L1-airlines-management` |

---
*This document is the **authoritative reference** for **repository organisation** and should be **updated** whenever the **repository structure evolves.***

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

**SQLVerse | Repository Standards | Level 1 | Foundation**