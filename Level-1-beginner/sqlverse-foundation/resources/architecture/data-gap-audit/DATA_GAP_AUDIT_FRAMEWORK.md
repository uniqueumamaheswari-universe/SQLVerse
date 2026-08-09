
# 🗄️🤖 SQL & GenAI Course
**🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost**

---

# Data Gap Audit Framework

**Architectural Knowledge Artifact**  
**Version:** 1.0  
**Status:** FROZEN

---

## 📋 Purpose

The **Data Gap Audit** is a professional practice for diagnosing when a business request cannot be answered honestly using the current data model. It provides a repeatable framework for documenting limitations, deferring requests without fabricating data, and identifying schema evolution opportunities.

**The SQLVerse Mandate:**  
**Business first. Data model second. SQL third.**

---

## 🔍 What Is a Data Gap Audit?

A Data Gap Audit is a **structured investigation** that answers three questions:

| Question | What It Reveals |
|----------|-----------------|
| **What does the business need to know?** | The stakeholder's requirement. |
| **What facts are required to answer it?** | The fields, attributes, or relationships needed. |
| **Are those facts present in the current data model?** | Whether the schema supports the analysis. |

If the required facts are **missing from the data model**, the audit produces a **Data Deficit Note** and defers the request for future schema evolution.

---

## 🧠 When to Perform a Data Gap Audit

| Scenario | Why |
|----------|-----|
| **A business request cannot be answered with existing data.** | To diagnose whether the limitation is in SQL or in the data model. |
| **The stakeholder asks for a metric that does not exist in the schema.** | To identify the missing field and document the gap. |
| **You suspect the request is "operationally complete" but "analytically insufficient."** | To distinguish between what the schema was designed for and what it cannot yet support. |
| **Before proposing a schema migration or evolution.** | To document the business case for the change. |

---

## 🏛️ How to Distinguish SQL Limitation from Data-Model Limitation

| Limitation Type | Diagnosis | Fix |
|-----------------|-----------|-----|
| **SQL Limitation** | The query logic is flawed, or the SQL syntax is incomplete. The data exists in the database. | Refine the SQL query. |
| **Data-Model Limitation** | The required field does not exist in the database. No query can produce the answer. | Evolve the schema (e.g., `ALTER TABLE ADD COLUMN`). |

**Key Insight:**  
> A data-model limitation is **not a failure**. It is a **design insight** that the schema must evolve to meet new business requirements.

---

## 📋 The Audit Methodology

### Step 1: Capture the Business Requirement

Document the stakeholder's request in their own language. Do not translate it into SQL yet.

> **Example:** *"I need average days on market for luxury properties to set Q3 acquiring targets."*

### Step 2: Identify the Required Facts

List the fields, attributes, or relationships needed to answer the request.

> **Example:** `listing_date` is required to calculate `days_on_market`.

### Step 3: Inspect the Data Model

Check whether the required facts exist in the current schema.

> **Example:** `listing_date` is missing from the `properties` table.

### Step 4: Write the Data Deficit Note

If facts are missing, document the gap using the **Data Deficit Note Template**.

### Step 5: Decide the Path Forward

| Option | When to Choose |
|--------|----------------|
| **Defer the Request** | Required facts are missing. Document the gap and return when schema evolves. |
| **Refine the Query** | The data exists but the query logic is flawed. |
| **Propose Schema Evolution** | The gap is critical and business‑justified. Plan the migration. |

---

## 🧭 The Data Deficit Note (Template)

The Data Deficit Note is a structured professional artifact that documents why a business request cannot be answered.

```markdown
### Data Deficit Note

**Request ID:** [Unique identifier]

**Business Requirement:**
[What the stakeholder needs to know]

**Required Facts:**
[Fields or attributes needed to answer the request]

**Data Model Assessment:**
[What is present / What is missing]

**SQL Assessment:**
[Why SQL cannot produce the answer]

**Key Takeaway:**
[The architectural lesson]

**Decision:**
[Defer / Refine / Evolve]

**Next Steps:**
[What happens next]
```

---

## 📋 Example Case Study: Fleet Delivery Network

### 1. The Business Requirement

> *"Calculate the average delivery delay (in minutes) for high-priority parcels in the North Region to evaluate driver incentive payouts."*

### 2. The Current Data Model (`deliveries`)

```sql
CREATE TABLE deliveries (
    delivery_id         INTEGER PRIMARY KEY,
    parcel_code         TEXT NOT NULL,
    driver_id           INTEGER NOT NULL,
    region              TEXT NOT NULL,       -- e.g., 'North', 'South'
    priority_level      TEXT NOT NULL,       -- e.g., 'Standard', 'High'
    delivery_status     TEXT NOT NULL,       -- e.g., 'PENDING', 'DELIVERED'
    actual_delivery_time TEXT NOT NULL       -- ISO timestamp 'YYYY-MM-DD HH:MM:SS'
);
```

### 3. The Gap Audit & Fact Mapping

| Business Requirement | Required Logic / Expression | Present in Schema? | Target Column |
|----------------------|----------------------------|-------------------|---------------|
| Location Filter | `WHERE region = 'North'` | ✅ YES | `region` |
| Priority Filter | `WHERE priority_level = 'High'` | ✅ YES | `priority_level` |
| Calculate Delay | `actual_delivery_time - estimated_delivery_time` | ❌ NO | Missing `estimated_delivery_time` |

### 4. Diagnosis & SQL Reality Check

- **SQL Capability:** SQL can easily filter `WHERE region = 'North' AND priority_level = 'High'`.

- **Database Limitation:** Because the schema tracks *when* the item was delivered (`actual_delivery_time`), but **not** *when it was promised* (`estimated_delivery_time`), calculating a "delay" is physically impossible.

- **The Trap Avoided:** The analyst refrains from guessing average trip durations or writing fake `WHERE` conditions.

### 5. Resolution & Action Plan

1. **Draft a Data Deficit Note** to notify the Operations Lead.

2. **Defer the SLA analysis** until the data model evolves.

3. **Raise a schema-evolution request** for the missing `estimated_delivery_time` attribute.

> **The mechanics of evolving the schema—writing the `ALTER TABLE` migration and backfilling historical data—will be introduced later in the course.**

**The Framework teaches the audit. Module 4 teaches schema evolution.**

---

### 🏛️ Closing Thought

> The Data Gap Audit is **domain‑invariant**.
>
> It works on Real Estate. It works on Airlines. It works on Logistics.
>
> The business vocabulary changes. The skeletal pattern remains invariant.


---

## 🔄 When to Perform a Data Gap Audit

| Scenario | When to Use |
|----------|-------------|
| **A stakeholder request cannot be answered** | Immediately |
| **You suspect a schema limitation** | During requirements analysis |
| **Before proposing a schema migration** | During impact analysis |

---

## 🏛️ The Data Gap Audit as a Professional Practice

| Aspect | Why It Matters |
|--------|----------------|
| **Integrity** | You do not invent data or fabricate answers to satisfy a request. |
| **Transparency** | You communicate limitations clearly to stakeholders. |
| **Traceability** | You document gaps for future schema evolution. |
| **Scalability** | The audit framework applies across every business universe. |

---

## 📋 Why This Is a Signature SQLVerse Artifact

The Data Gap Audit:

- **Reinforces** the SQLVerse Mandate: *"Business first. Data model second. SQL third."*
- **Develops** the student's professional judgment—not just SQL fluency.
- **Provides** a repeatable framework that applies across E‑Store, Hospital Planet, Real Estate Planet, FinVERSE, and beyond.

> **The business vocabulary changes. The skeletal pattern remains invariant.**

---

## 🧭 Related Resources

| Resource | Location |
|----------|----------|
| Data Deficit Note Template | `sqlverse-foundation/resources/architecture/data-gap-audit/DATA_DEFICIT_NOTE_TEMPLATE.md` |
| Repository Standards | `sqlverse-foundation/docs/Repository-Standards.md` |

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

**SQLVerse | Architecture | Data Gap Audit Framework**

