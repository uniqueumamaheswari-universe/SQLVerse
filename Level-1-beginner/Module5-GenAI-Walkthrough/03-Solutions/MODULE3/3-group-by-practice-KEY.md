### 📋 File 3 Exit Reflection – File 2 Data Gap Audit

**3. The Schema Completeness Layer:** In File 2, you encountered a Data Gap Audit where `listing_date` and `total_area_in_squarefeet` were missing from the `properties` table. What business questions become impossible to answer without these fields? What would you do if a stakeholder demanded an answer despite the data gap?

#### A. Impossible Business Questions (Without `listing_date` and `total_area_in_squarefeet`)

1. **Inventory Velocity / Days on Market (DOM):** *"How long do properties remain listed before selling, and are active listings aging out?"* → Impossible without `listing_date`.

2. **Valuation Unit Economics:** *"What is the average price per square foot ($/sqft) across property types?"* → Impossible without `total_area_in_squarefeet`.

3. **Appraisal & Pricing Accuracy:** *"Is a property's high list price explained by its physical size, or is it unusually expensive relative to comparable properties?"* → Impossible to evaluate on a price-per-square-foot basis without `total_area_in_squarefeet`.

**Architectural Lesson:**

> **"Impossible to compute reliably" ≠ "SQL doesn't know how."**

SQL is perfectly capable of doing the arithmetic. The problem is: **the required business facts aren't represented in the schema.**

#### B. Managing Demanding Stakeholders During a Data Gap

When a stakeholder demands metrics that the current schema cannot compute:

1. **Issue a Data Deficit Note:** Formally document the gap including the missing columns, affected business metrics, and architectural root cause.

2. **Reject Data Fabrication:** Never invent proxy metrics—for example, estimating square footage or assuming arbitrary listing dates—simply to make a query return a result. Reporting false precision creates severe financial liability.

3. **Offer an Immediate Alternative & Bridge:**
   - **Immediate:** Provide actionable proxies using available data.  For example: "We cannot provide $/sqft yet, but here is the median list price distribution by status and property type."
   - **Roadmap:** Submit a DDL migration proposal in Module 4 to backfill missing attributes and unlock full analytical capability.

---