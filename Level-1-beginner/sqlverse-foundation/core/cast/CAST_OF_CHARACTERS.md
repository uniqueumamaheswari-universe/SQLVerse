# 🗄️🤖 SQL & GenAI Course
**🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost**

---

# SQLVerse Cast of Characters

## Canonical Reference

**Document Type:** Canonical Entity & Data Subject Registry
**Version:** 1.0
**Status:** DRAFT
**Location:** `sqlverse-foundation/core/cast/`
**Scope:** ACQUIRE · BLUEPRINT · ACCELERATE

---

## 1. Purpose

This registry is the single source of truth for the recurring people of Level 1. It records who each person *is*, so that identity stays the same in every learning environment.

- **ACQUIRE:** where the cast first appears, in Module 4.
- **BLUEPRINT:** where the cast appears in the business narrative of `04-THE-SQLVERSE-BUSINESS-EVOLUTION/`.
- **ACCELERATE:** where the cast appears in `04-Interactive-Simulations/`.

**Governing rules**

1. **Identity is fixed; role is local.** A character's canonical identity does not change between areas. Only their *role in a particular story* may differ, and that is recorded in a separate column.
2. **Narrative stays where it is told.** This registry records identity, domain and appearances. Story arcs stay in the Blueprint. Interactive mechanics stay in ACCELERATE.
3. **Illustrative business context:** Fictional business names, scenarios and figures are educational examples, not claims about real organisations or transactions.

---

## 2. Decision-Makers and Domain Leads

| Name | Canonical identity | Domain | What they care about |
|---|---|---|---|
| **Raj** | CFO and investor | Library and Tourism Planet | Margins and return. Applies a threshold before committing; answers Buy, Don't Buy or Renegotiate. |
| **Geetha** | CEO of a bank | Banking Planet | Strategy and risk. Identifies high-value customers and risk signals across domains. |
| **Arjun** (the CTO) | CTO | Intelligent Transportation Planet | Structure, auditability, extensibility. Asks what changes when something new arrives. |
| **Ravi** | Owner of Brew Haven, Slice Squad and Daily Mart | Mall quick commerce | Unified customer view across three businesses with no common key. Arjun's brother. |
| **Annie** | CEO of Celebrate India | Event management | Margin leakage, partnerships, matching customers across vendors. Geetha's friend. |
| **Simon** | CFO of a consultancy firm | Startup Hub Expo | Turning messy emails into structured records; whether a venture was profitable and worth repeating. Friend of Raj's wife. |

### Role in Blueprint Folder 04

| Name | Role in the Folder 04 story | Appears in |
|---|---|---|
| **Raj** | Proposer of the investment; carries the "should we back this?" question | 01, 02, 05 |
| **Geetha** | Prospective investor; asks who owns the customer and how many real customers there are | 01, 02, 03 |
| **Arjun** (the CTO) | Prospective investor with technical judgement; asks about identity, audit and extensibility | 01, 02, 04, 06 |
| **Ravi** | Parallel example of identity without a key (phone, cash, family cards) | 03 |
| **Simon** | A fourth voice who asks how to count a person who plays two roles | 05 |
| **Annie** | Strategic partner in the closing teaser; her offer with FinVERSE leaves both firms independent | 06 |

*Folder 04 is in progress. Appearances are planned, not yet confirmed. Update this table when the chapters are frozen.*

---

## 3. Data Subjects

These people appear as **rows in records**, not as decision-makers.

| Name | Where | Why they matter | Status |
|---|---|---|---|
| **Meera Nair** | FinVERSE (`LOAN-501`) | Her ten payments show bag multiplicity and why a careless `DISTINCT` changes a total. See [Relational Mathematics, Part 5, §8.0, The Payments Question](../../../Module5-GenAI-Walkthrough/01-The-Socratic-Mirror/ACQUIRE-MODULE4/SQLVerse-Architects-Blueprint/01-RELATIONAL-MATHEMATICS/05-bags.md#80-the-payments-question). | Frozen |
| **Arjun Sharma** | FinVERSE (`CUST-702`) | A customer with three loans; shows 1:N association and join multiplicity. See [Relational Mathematics, Part 4, §7, Association](../../../Module5-GenAI-Walkthrough/01-The-Socratic-Mirror/ACQUIRE-MODULE4/SQLVerse-Architects-Blueprint/01-RELATIONAL-MATHEMATICS/04-associations.md#7-association--relationship). | Frozen |
| **Kavitha Menon** | Three acquired companies, then FinVERSE | One real person recorded under different keys and spellings. Anchors the identity reconciliation in Folder 04. | Planted in 02, recognised in 03 |

---

## 4. Placeholders

The names below are **working placeholders** and may change before Folder 04 is frozen.

| Placeholder | Stands for |
|---|---|
| **Meridian** | The asset management company |
| **Lifeline** | The individual insurance company |
| **RoadSure** | The vehicle insurance company |

---

## 5. Supporting Roles (Folder 04 Only)

These are minor characters who appear only in Folder 04. Each is a data steward inside one of the three acquired companies, and each is the voice of that company's world when the integration work begins.

| Name | Company | Role | Why they matter |
|------|---------|------|-----------------|
| **Dhanya Krishnan** | Meridian | Data steward | Holds Meridian's portfolio records, Demat account keys, and fund transaction histories. Speaks for the asset-management world — what a customer *is* in Meridian's records. |
| **Balaji Iyer** | Lifeline | Data steward | Holds Lifeline's policy records, Term / Health / Accident coverage, and claims history. Speaks for the individual-insurance world — how a policy-holder is identified and tracked. |
| **Farid Khan** | RoadSure | Data steward | Holds RoadSure's vehicle policies, registration records, and claims. Speaks for the vehicle-insurance world — where a customer is often a vehicle as much as a person. |

---

## 6. Disambiguation Rules

1. **Arjun the CTO and Arjun Sharma the customer are different people.** Write "Arjun, the CTO" at first mention in any story scene. Use the full name for the customer.
2. **Ravi and Rahul Rao are different people.** Rahul Rao is the joint applicant in Part 4.
3. **Pre-merger records belong to their own world.** Before integration, a person's records in each company belong to that company only.
4. **Companies keep their own names until the acquisition closes.** Only afterwards do they become FinVERSE units.

---

## 7. Maintenance

- Replace the relative links above with exact paths once the three areas are frozen.
- When Folder 04 is frozen, change the Kavitha Menon status and confirm the appearance table.
- Do not edit a character's canonical identity. Add a new "Role in" table instead.

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

**SQLVerse | Foundation | Cast of Characters | Level 1**