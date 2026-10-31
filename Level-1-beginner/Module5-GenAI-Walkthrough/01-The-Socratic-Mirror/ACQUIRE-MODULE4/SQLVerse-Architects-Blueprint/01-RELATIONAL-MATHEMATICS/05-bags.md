
# 🗄️🤖 SQL & GenAI Course
**🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost**

---
# Relational Mathematics

## Part 5 — Bags

**Sections:** §8 (Bags / Multisets) 

**Document Type:** Mathematical Foundation — Part 5 of 5
**Version:** 1.0
**Status:** FROZEN
**Location:** `SQLVerse-Architects-Blueprint/01-RELATIONAL-MATHEMATICS/`
**Governing Standard:** `SQLVERSE-ARCH-FW-001`

---

> **Every row has meaning.**
> **Every meaning has a law.**
> **Every law is based on mathematics.**

---

*This is Part 5 of the Relational Mathematics. It continues from [`04-associations.md`](04-associations.md) — Part 4.*

*Part 4 ended with the structure of an association — how a customer and a loan can be linked, how that link is enforced, and how a query walks across it. Part 5 begins with a question: what happens when the same value appears more than once — and when is that repetition a fact, and when is it an illusion?*

*The numbering and conventions established in Parts 1 through 4 continue throughout.*

---

### Notation carried forward

- `Ω` — the universe
- `S₁`, `S₂`, `S₃` — sample sets, each defined by a business rule
- `A`, `B` — generic sets, used for identities
- `C`, `L`, `R` — the customer set, the loan set, and the association relation
- `A × B` — the Cartesian product of `A` and `B`
- `(a, b, c)` — a tuple — an ordered collection of values

### Notation introduced in Part 5

- `m(x)` — the **multiplicity** of element `x` in a bag — the number of times `x` occurs
- `⊎` — bag union — the operation that **adds** multiplicities (distinct from set union `∪`)
- `supp(B)` — the **support** of a bag `B` — the set of distinct values whose multiplicity is positive

---

## 8. Bags

### §8.0 — The Payments Question

Meera Nair's personal loan, LOAN-501, has been running for ten months.

The credit team asks a routine question: *what amounts has Meera paid?*

The analyst opens the payments table and runs the simplest query available.

```sql
SELECT amount
FROM loan_payments
WHERE loan_id = 'LOAN-501';
```

Ten rows return.

```
amount
-------
45,000
45,000
45,000
45,000
45,000
60,000
45,000
45,000
45,000
45,000
```

Ten payments. Nine of them identical.

The analyst pauses.

*Something looks wrong.*

Ten rows, nine of them the same number — this has the shape of a data-entry problem. A duplicated record. A failed import. A typo. Something that `DISTINCT` exists to clean up. The instinct to collapse the repeats is immediate and strong.

**But what if the repeats are not the problem?**

Look again at what these rows are. Each 45,000 is a monthly instalment Meera actually paid — January, February, March, April, May, then a larger payment in June, then July, August, September, October. Ten separate events, each a real payment Meera made. The 60,000 is the month she paid more than the standard amount.

**Nine events happened to carry the same amount.**

The repeats are not errors. They are the business working exactly as designed — the rhythm of a loan being repaid.

And yet — this is the puzzle — **the same ten rows, read carelessly, can produce a number that is wrong by 360,000.**

---

Here is the question the rest of this section answers:

> **When you look at a collection of values and see repeats, how do you know whether you are looking at ten payments or two?**

The rows are the same. The database is the same. The query is the same. What changes is something subtler than the data.

And the answer changes the total — from **465,000** to **105,000** — without a single row being altered, deleted, or corrupted.

---

The analyst must decide: **what is this collection of amounts, mathematically?**

*The rest of §8 answers.*

---

### §8.1 — Naming the Structure


The analyst has ten rows and a question that will not go away.

*How do you know whether you are looking at ten payments or two?*

The question is not about Meera's loan. It is about **what kind of collection** the ten amounts are. And before the question can be answered, the collection needs a name.

---

#### The vocabulary the reader already has

In the preceding sections, the reader had been building a vocabulary for collections.

In **§1**, the vocabulary began with **sets** — collections of distinct elements. A set records **membership**: whether an element belongs.

In **§2**, sets gained **subsets** — containment within containment.

In **§3**, sets gained **operations** — union, intersection, difference, complement, symmetric difference. Each operation combined or separated sets by membership.

In **§4–§6**, sets gained **structure** — the Cartesian product, the tuple, the relation. Each layer named what one element *is*, and what one collection *is*.

In **§7**, relations gained **associations** — the connection between two entities, expressible as a relation, enforced by keys.

**Every one of these structures assumed the same thing:** a collection contains an element **once**, or it does not contain it at all. A set does not record *how many times* an element appears — only **whether** it appears.

That assumption is about to break.

---

### The bag
Look again at Meera's ten amounts.

```
45,000
45,000
45,000
45,000
45,000
60,000
45,000
45,000
45,000
45,000
```

As a **set**, this collection contains two elements:

```
{45,000, 60,000}
```

As a **collection that preserves the repeats**, it contains ten:

```
{45,000, 45,000, 45,000, 45,000, 45,000,
 60,000, 45,000, 45,000, 45,000, 45,000}
```

These are not the same object. The set has **two** elements. The collection with repeats has **ten**.

The set answers: *which amounts appear?*

The collection with repeats answers: *which amounts appear, and how many times?*

**The second kind of collection has a name.**

---

A **bag** (also called a **multiset**) is a collection in which an element can occur more than once.

**The bag contains ten occurrences of amounts, one for each payment event in this example.**

The definition is short. Its consequences are not.

---

#### Multiplicity
Every element in a bag has a **multiplicity** — the number of times it occurs.

The multiplicity of an element `x` in a bag `B` is written:

```
m(x)
```

For Meera's ten amounts read as a bag:

```
m(45,000) = 9
m(60,000) = 1
```

Nine occurrences of 45,000. One occurrence of 60,000.

Here is the same information set beside the set reading:

| Property | Set | Bag |
|----------|-----|-----|
| Distinct amounts | 2 | 2 |
| Total occurrences | Not recorded | 10 |
| Multiplicity of 45,000 | Not represented | 9 |
| Multiplicity of 60,000 | Not represented | 1 |

The set preserves **which** distinct values appear. The bag preserves **which values appear, and how many times each appears**.

The two collections contain the **same distinct values**. But they are **not the same collection**, because they preserve **different information**.

---

A value absent from the bag has multiplicity zero. For example, `m(30,000) = 0`; 30,000 is not one of the values present in Meera's bag.

The **size** of a bag is the sum of its multiplicities over its distinct values:

```
size(B) = Σ m(x)   for all x in supp(B)
```

Here `size(B)` — is the set of distinct values whose multiplicity is greater than zero. Summing over `supp(B)` counts each distinct value according to its multiplicity.

For Meera's bag:

```
size(B) = m(45,000) + m(60,000) = 9 + 1 = 10
```

**The bag has ten elements.** Not two.

This is the first concrete difference from set theory:

| Collection | Size |
|------------|------|
| Set `{45,000, 60,000}` | **2** — because a set counts each distinct element once |
| Bag with `m(45,000)=9, m(60,000)=1` | **10** — because a bag counts every occurrence |

---

#### A set is a special case of a bag

Here is a quiet but important relationship:

> **A set is a bag in which no element has multiplicity greater than 1.**

Every set can be viewed as a bag. Take the set `{45,000, 60,000}`. As a bag, it has:

```
m(45,000) = 1
m(60,000) = 1
```

Every element appears exactly once. This is a **special kind of bag** — the kind where no element repeats.

```
                    BAG
              (all collections
            with multiplicities)
                     │
                     │  special case:
                     │  all multiplicities ≤ 1
                     ▼
                    SET
```

**A set is a bag that never repeats. A bag is a set that permits repeats.**

This relationship matters because most of what you learned about sets carries over, and §8.3 shows what does not.  **A bag adds multiplicity on top of set structure.** It does not replace set structure. It extends it.

You have not left the world of sets. You have **widened** it.

---
#### Three concepts, not to be confused

You have met all three before. **Set cardinality** was named in §2 — the number of distinct elements in a set. **Column cardinality** and **relationship cardinality** were named in §7, alongside set cardinality, in its own three-meanings table.

**Multiplicity is not a fourth meaning of cardinality.** It counts occurrences of one value — `m(45,000) = 9` — not distinct elements. It belongs to a bag; the three cardinalities belong to sets, columns, and relationships.

A loan with many payments has relationship cardinality 1:N. Each payment amount may have its own multiplicity in the bag of amounts. The two describe different facts about the same data.


---

#### Why the distinction matters

Return to Meera's ten rows.

**Read as a set**, they contain two amounts. A credit team asking *"which amounts has Meera paid?"* gets a complete answer: **{45,000, 60,000}**.

**Read as a bag**, they contain ten payments. A credit team asking *"how much has Meera paid in total?"* gets a complete answer only from the bag: **465,000**.

**The two collections answer two different questions.**

And here is the consequence that will matter for the rest of §8:

| Question the business asks | Information it requires | Collection type |
|----------------------------|-------------------------|-----------------|
| *Which distinct amounts has Meera paid?* | Distinct values only | **Set** |
| *How many payments has Meera made?* | Occurrences | **Bag** |
| *How much has Meera paid in total?* | Sum over events | **Bag** |
| *How many different payment amounts has she used?* | Distinct values | **Set** |

The business does not choose a mathematical structure independently of the question. **The question determines what information must be preserved. The structure that preserves that information is the correct one.**

---

And here is the consequence that is easiest to miss:

**`DISTINCT` is not wrong.** It answers a different question. The error is not in the query. It is in the analyst who mistakes one question for another.

A `DISTINCT` query that returns `{45,000, 60,000}` is **correct** — if the question was *"which distinct amounts appeared?"*

A bag-based query that returns **465,000** is **correct** — if the question was *"how much has Meera paid?"*

The error only arises when someone asks one question and answers the other. **The collection type was never the problem.** The mismatch between question and collection was.

---

#### Summary

- **A bag** preserves values and their multiplicities.
- **A set** is the special case in which multiplicities never exceed one.
- **The business question** determines whether distinct-value semantics or occurrence-preserving semantics is required.

**The vocabulary is now complete.** The bag has a name, a structure, and a place in the collection family.

What remains is what the bag **does** — how it behaves when combined, compared, and queried. That is §8.2's subject: the same ten amounts, read two ways.

---
### 8.2 Widening the lens

The ten rows have a name now. Before going further, run the experiment: change what the query shows, and watch what the result can and cannot distinguish.

Take the query from §8.0 and ask three things of every result: *What do I see? What can I tell apart? What is still hidden?*

---

#### Step 1: the amount alone

Before running anything, predict three numbers for Meera's LOAN-501: how many rows come back, how many distinct amounts there are, and what the total is.

```sql
SELECT amount
FROM loan_payments
WHERE loan_id = 'LOAN-501';
```

Ten rows. Nine are 45,000 and one is 60,000. In §8.1's words, this is a bag with `m(45,000) = 9` and `m(60,000) = 1`.

*What can I tell apart?* Only two kinds of payment. *What is hidden?* Which payment is which.

---

#### Step 2: count, distinct, and total

Now ask three questions of the same rows at once:

```sql
SELECT
    COUNT(*)               AS payment_rows,
    COUNT(DISTINCT amount) AS distinct_amounts,
    SUM(amount)            AS total_paid
FROM loan_payments
WHERE loan_id = 'LOAN-501';
```

| Measure | Result |
|---|---|
| Payment rows | 10 |
| Distinct amounts | 2 |
| Total paid | 465,000 |

Three numbers, one table. `COUNT(*)` counts occurrences. `COUNT(DISTINCT amount)` counts distinct values. `SUM(amount)` adds every occurrence.

The classic mistake sits one keyword away:

```sql
SELECT SUM(DISTINCT amount)
FROM loan_payments
WHERE loan_id = 'LOAN-501';
```

The result is **105,000**, which is 45,000 + 60,000. The query is valid and the arithmetic is correct. It answers a different question: *what is the sum of the distinct amounts?* It does not answer *how much did Meera pay?*

---

#### Step 3: the same rows, with DISTINCT

```sql
SELECT DISTINCT amount
FROM loan_payments
WHERE loan_id = 'LOAN-501';
```

```
amount
-------
45,000
60,000
```

**Two rows.** No amount occurs more than once, so this result can be represented as a **set of distinct amounts.**


Now ask: *can the ten payments be rebuilt from these two rows?* They cannot. Nothing in `{45,000, 60,000}` says that 45,000 happened nine times. The result kept **which** amounts appeared and discarded **how often**. That information is absent from the result. The original ten payment rows remain unchanged.

Neither query is better. They preserve different things.

---
#### Step 4: widening to `status`

Add a second column, in case it separates the repeats:

```sql
SELECT status, amount
FROM loan_payments
WHERE loan_id = 'LOAN-501';
```

Every row now reads `(Completed, 45,000)` or `(Completed, 60,000)`. Nothing changed. Each row is a two-value tuple, and `(Completed, 45,000)` still appears nine times. 

**A column that is the same in every row cannot tell the rows apart. Only a column that differs from row to row can.**

---

#### Step 5: widening to `payment_method`

Now try a column that does vary.

```sql
SELECT payment_method, amount
FROM loan_payments
WHERE loan_id = 'LOAN-501';
```

```
payment_method    amount
UPI               45,000
UPI               45,000
UPI               45,000
UPI               45,000
UPI               45,000
Bank Transfer     60,000
UPI               45,000
UPI               45,000
UPI               45,000
UPI               45,000
```

**Something changed.** The 60,000 payment now stands apart: it was made by Bank Transfer, and the others by UPI. But the nine 45,000 payments are all UPI, so the tuple `(UPI, 45,000)` still appears nine times.

**A column that varies can still fail to tell the events you care about apart.**

`DISTINCT` now works across the pair:

```sql
SELECT DISTINCT payment_method, amount
FROM loan_payments
WHERE loan_id = 'LOAN-501';
```

```
payment_method   amount
UPI              45,000
Bank Transfer    60,000
```

Two distinct pairs. `DISTINCT` judges uniqueness across **all selected columns together**, not one column alone.

---

#### What the experiment shows

The ten payments never changed. The queries examined them in different ways:

| Query | Rows returned | What it preserved | What it could not tell apart |
|---|---|---|---|
| `SELECT amount` | 10 | Every occurrence | Which payment is which |
| `SELECT DISTINCT amount` | 2 | Which amounts appeared | How often each occurred |
| `SELECT status, amount` | 10 | Every occurrence; `status` was `Completed` in all ten, so it added nothing | The nine 45,000 payments |
| `SELECT payment_method, amount` | 10 | Every occurrence; separated the 60,000 (Bank Transfer) from the rest (UPI) | The nine 45,000 payments, all UPI |
| `SELECT DISTINCT payment_method, amount` | 2 | Which `(method, amount)` pairs appeared: `(UPI, 45,000)` and `(Bank Transfer, 60,000)` | How often each pair occurred |
| `SELECT COUNT(*), COUNT(DISTINCT amount), SUM(amount)` | 1 | Counts and total computed from every occurrence: 10, 2, 465,000 | Which payments produced them |
| `SELECT SUM(DISTINCT amount)` | 1             | The sum of distinct amounts: 105,000 | How often each amount occurred; it is not the total paid |

---

#### The question that remains

All ten payments are real, separate events. Yet in every result above, nine of them look identical. The queries cannot tell them apart, and the reason is not the data. It is what the queries chose to show.

The business asks three different things of this same data:

- *Which amounts appeared?*
- *How many payments occurred?*
- *How much was paid?*

Each needs the repeats treated differently. And behind all of them is a harder question, one the `loan_payments` table can answer:

**Which column, if we looked at it, would tell the payments apart?**

That is for §8.5. First, §8.3 asks what happens to these repeats when two collections are combined.

---
### §8.3 — Two Bags, Three Operations

#### Combining bags

The Credit Analyst is monitoring loans given to first-time applicants. Meera is one of them. The report asks three questions about each part of the loan's history: 

- **how much was paid**
- **how many instalments were paid** 
- **how many instalments remain unpaid**

The analyst has two saved extracts from the payment history. Each extract contains only the `amount` column.

| Extract | Months covered | Instalments paid | Instalments unpaid | Total paid |
|---|---|---|---|---|
| **First half** | 1 to 6 | 6 | 0 | 285,000 |
| **Second half** | 7 to 10 | 4 | 0 | 180,000 |

The report's summary figures are shown alongside the extracts; the bags themselves contain only the payment amounts.

Each extract is **a bag.** Written in terms of multiplicity:

```
First half:   m(45,000) = 5    m(60,000) = 1
Second half:  m(45,000) = 4    m(60,000) = 0
```

The loan is ten months old, so the second half covers four months. The report reads cleanly. Now the analyst asks a different kind of question: what happens when the two extracts are put together, compared, and subtracted?

---

#### Combining: additive union

Put the two halves together. Every occurrence in either extract is kept, so the multiplicities **add**.

```
m(45,000) = 5 + 4 = 9
m(60,000) = 1 + 0 = 1
```

The resulting bag has **size 10** and a **total value of 465,000.** It reconstructs the full collection of payment amounts introduced in §8.0.


This operation is written `⊎` and called **additive union**. It is the bag counterpart of set union, `∪`, and corresponds to SQL's `UNION ALL` when the query results contain the same single column.

The set version behaves differently. As sets, the two halves are:

```
First half:   {45,000, 60,000}
Second half:  {45,000}
```

Their union is `{45,000, 60,000}`. It contains two distinct values, with no record of how many payments carried each amount.

The set tells us which amounts occurred. The bag also preserves how often they occurred.

---

#### Comparing: intersection

What do the two halves have in common? 

For each value, retain the **smaller** of its two multiplicities.

```
m(45,000) = min(5, 4) = 4
m(60,000) = min(1, 0) = 0
```

The intersection contains four occurrences of 45,000. The value 60,000 does not appear in the second half, so none of its occurrences survive the comparison.

Intersection does not add the two collections. It retains only the multiplicity they have in common.

---

#### Subtracting: difference

Now subtract the second half from the first. Remove occurrences according to the second bag, but never let a multiplicity fall below zero.

```
First half − Second half

m(45,000) = max(5 − 4, 0) = 1
m(60,000) = max(1 − 0, 0) = 1
```

One occurrence of 45,000 and one occurrence of 60,000 remain. These are the **excess multiplicities** in the first half relative to the second.

Reverse the order:

```
Second half − First half

m(45,000) = max(4 − 5, 0) = 0
m(60,000) = max(0 − 1, 0) = 0
```

**The result is the empty bag.** Every value in the second half occurs no more often than it does in the first.

Difference is directional, as in §3.4. The floor at zero is the additional rule for bags: a collection cannot contain a negative number of occurrences.

Notice what the result does **not** tell us. It identifies the excess multiplicities of values, not the identities of particular payments. The bags preserve counts, not the identity of each event.

---

#### The three rules together

| Operation          | Rule for the resulting multiplicity   | SQL             |
| ------------------ | ------------------------------------- | --------------- |
| Additive union `⊎` | `m(x) = m_A(x) + m_B(x)` | `UNION ALL` |
| Intersection `∩` | `m(x) = min(m_A(x), m_B(x))` | `INTERSECT ALL` |
| Difference `−` | `m(x) = max(m_A(x) − m_B(x), 0)` | `EXCEPT ALL` |

For sets, multiplicities are restricted to zero or one. Under that restriction, these bag rules reduce to the corresponding set operations from §3.

Bags extend the rules to collections that preserve repetition; they do not replace the set operations.

**Engine note:** SQLite supports `UNION ALL`. It does not support `INTERSECT ALL` or `EXCEPT ALL`; PostgreSQL supports all three forms.

The following is an illustrative SQLite example. It assumes that the two saved extracts have been made available as tables named `first_half` and `second_half`. These are illustrative source names, not tables established by the current schema.

```
-- Runs in SQLite
SELECT amount FROM first_half
UNION ALL
SELECT amount FROM second_half;
```

---

#### What survives, and what does not

§3.8 made a specific promise: `A ∪ A = A` would fail for bags. **Here is where the failure arrives.**

Take the first half as `A`, and combine it with itself.

```
A ⊎ A:

m(45,000) = 5 + 5 = 10
m(60,000) = 1 + 1 = 2
```

The result is not `A`. Every multiplicity has doubled.

The set identity depended on a property of sets: repeating an element does not create another element in a set. Bags preserve that repetition, so additive union with itself doubles every occurrence count.

But not every set identity fails. Check the operations one by one:

| Identity                         | For sets      | For bags                                            |
| -------------------------------- | ------------- | --------------------------------------------------- |
| `A ∪ A = A`                  | Holds         | **Fails** for additive union `⊎`; multiplicities double. |
| `A ∩ A = A`                  | Holds         | Holds: `min(m, m) = m`                              |
| `A − A = ∅`                  | Holds         | Holds: `max(m − m, 0) = 0`                          |
| `A ∪ B = B ∪ A`              | Holds         | Holds for additive union                            |
| `A ∩ B = B ∩ A`              | Holds         | Holds for intersection                              |
| `(A ∪ B) ∪ C = A ∪ (B ∪ C)`  | Holds         | Holds for additive union                            |
| `(A ∩ B) ∩ C = A ∩ (B ∩ C)`  | Holds         | Holds for intersection                              |
| `A − B = B − A`              | Not generally | Not generally                                       | 

The distinction matters. Some laws carry over unchanged; others must be reconsidered. Bag difference, in particular, is directional: reversing the operands can change the result.

Most of what you learned about sets carries over. The identity that fails for additive union is the one that depended on forgetting repetition.

---
### §8.4 — From results to evidence

Two results have already appeared in this folder without being named as bags.

In §7, Arjun joined to his loans and appeared **three times**. The text said: *that is not an error.* In §8.3, the analyst's two extracts were bags, and their combination had ten occurrences. This section asks two things about those collections. Where do they come from? And what can they prove?

---

#### Where bags come from

**Projection.** §8.2 showed it. `SELECT amount` keeps every row and shows only one column. Rows that differ elsewhere look alike here, and the result is a bag.

**Joins.** Arjun's three rows are a bag in the strict sense: the customer side of the result repeats once per loan. Nothing was duplicated by mistake. The join paired one customer with three loans, and the result honestly reports that.

**Tables without a key.** A table carries no guarantee of distinct rows unless a key constraint provides one. Suppose an E-Store checkout log records only the item scanned:

```
item
------
Laptop
Smart Watch
Laptop
```

There is no `order_id`, no `scan_id`, no key of any kind. Nothing in the table forbids the second `Laptop` row. Two scans of a Laptop are two events.

In all three cases, repetition arrives because the collection **keeps occurrences** and not because the data went wrong.

A keyless table is one source of duplicates. It is not the source of all bag behavior in SQL. Query results themselves use bag semantics — even when every source table has a primary key.

---

#### Why SQL keeps them

§6 said SQL's departures from classical theory are deliberate. Here are the reasons.

| Reason | What it means |
|---|---|
| **Cost** | Eliminating duplicates takes work. Many queries never need it, so SQL does not impose that work by default. |
| **Repeats can be real** | Two identical-looking rows may be two real events, as with the two scans or Meera's nine payments of 45,000. Collapsing them destroys information. |
| **Aggregation depends on occurrences** | `SUM`, `AVG` and `COUNT(*)` are defined over every occurrence. Collapse first and the total becomes 105,000 instead of 465,000. |

`DISTINCT`, `UNION` and the primary key exist for the cases where a set is what you want. SQL makes the set a choice. The bag is the default.

Of the divergences §6 identified, this section has examined SQL’s bag semantics and why repeated occurrences are preserved. `NULL` is §8.6’s subject.

---

#### What the bags prove, and what they do not

The analyst now holds a result and wants to treat it as evidence. Start with what is secure.

| Question | What the bags establish | What stays open |
|---|---|---|
| How many different amounts were paid? | Two: 45,000 and 60,000. | Nothing. This question is fully answered. |
| How much was paid? | 465,000 is the sum of the ten supplied amount occurrences. | Whether 465,000 was received through ten valid, settled payment events. |
| How many payments occurred? | Ten occurrences: `m(45,000) = 9` and `m(60,000) = 1`. | Whether ten occurrences are ten distinct events. |
| Were all instalments paid on time? | Nothing. Amounts and counts carry no timing. | Every part of it. |

The second row separates two claims. **The supplied amounts sum to 465,000** — that follows from the collection. **465,000 was received** — that requires evidence about the underlying records.

The third row needs the same care. `m(45,000) = 9` says nine occurrences. It does not say nine events. The bag preserves **multiplicity**, not **identity**, so it can say how often a value occurs and cannot say which payment is which. A bag of amounts preserves how many occurrences of each value there were. It does not preserve which payment produced each occurrence.

The "unpaid: 0" column in §8.3 deserves the same care. It came from comparing months elapsed with payments received. That is a count, and it carries an assumption: that each payment settled the instalment due in its own month. A count of payments can be **consistent with** that assumption. Consistency is not proof. The count may agree with the assumption without establishing that the assumption is true.

The audit also has to keep two things apart: a **payment event** (money moved) and an **instalment obligation** (a sum that was due). A bag of amounts describes the first. Whether an obligation was met on time is a claim about the second.

---

#### What would settle the open questions

Each open question needs something the amount-only view does not contain.

| Needed input | What it would settle | Where it lives |
|---|---|---|
| **A payment identifier** | Whether ten occurrences are ten distinct events | Recorded alongside each payment |
| **A payment date** | When each payment happened | Recorded alongside each payment |
| **The instalment schedule** | What was due, and when | Held elsewhere, or not recorded at all |

The first two are columns of the payment record itself, so they can be examined directly. The third is a **business fact**. It may live in another system or may not be captured. Looking at more columns of the payments table cannot supply it, and nothing here promises that it can be supplied.

---

#### The bag is honest

Nothing went wrong in §8.3. The bags reported exactly what they hold: ten occurrences, two distinct values, 465,000 in total. The arithmetic was correct throughout.

What failed, or would fail, is the step after it: turning a correct count of occurrences into a claim about events, timing, or discipline. **The bag is honest. The mistake is asking it a question it cannot answer.**

The ten amounts are about to get company. §8.5 returns to the same ten payments and widens the view to the columns that identify them and place them in time.

---

### §8.5 — Seeing the Payments

§8.4 ended with two columns that could tell the payments apart. 

**Add them one at a time, and watch what each change reveals.**

---

#### Step 1 — Add the date

```sql
SELECT payment_date, amount
FROM loan_payments
WHERE loan_id = 'LOAN-501';
```

```
payment_date    amount
2025-01-05      45,000
2025-02-05      45,000
2025-03-05      45,000
2025-04-05      45,000
2025-05-05      45,000
2025-06-05      60,000
2025-08-20      45,000
2025-08-20      45,000
2025-09-05      45,000
2025-10-05      45,000
```

Something changes immediately.  Eight of the ten pair values are now unique — each appears only once. Most of the payments can now be told apart.

Two cannot. The pair `(2025-08-20, 45,000)` appears twice:

```
m((2025-08-20, 45,000)) = 2
```

**This result is still a bag.** The date narrowed the repetition, but did not remove it.

Look also at the dates themselves. Payments fall on the fifth of each month, from January to June. Then the next one is dated **20 August.** No payment is dated in July.

---

#### Step 2 — What `DISTINCT` does here

Apply `DISTINCT` to the same two columns:

```sql
SELECT DISTINCT payment_date, amount
FROM loan_payments
WHERE loan_id = 'LOAN-501';
```

Nine rows return. The two payments on 20 August collapse into one.

Now check what happens to the **financial totals** when we aggregate over that distinct view:

```sql
SELECT COUNT(*), SUM(amount)
FROM (SELECT DISTINCT payment_date, amount
      FROM loan_payments
      WHERE loan_id = 'LOAN-501') AS t;
```

The result returns **9 payments** totalling **420,000**.

The true totals are 10 payments and 465,000. Nothing was corrupted or miscalculated, yet one real payment of 45,000 has completely vanished from the aggregate sum.

A date varies from row to row, but it is still not a guarantee of uniqueness. Two real payment events can share a date and an amount.

---

#### Step 3 — Add the payment identifier

Now introduce the primary key column:

```sql
SELECT payment_id, payment_date, amount
FROM loan_payments
WHERE loan_id = 'LOAN-501';
```

```
payment_id    payment_date    amount
9001          2025-01-05      45,000
9002          2025-02-05      45,000
9003          2025-03-05      45,000
9004          2025-04-05      45,000
9005          2025-05-05      45,000
9006          2025-06-05      60,000
9007          2025-08-20      45,000
9008          2025-08-20      45,000
9009          2025-09-05      45,000
9010          2025-10-05      45,000
```

Every row is now different from every other. No tuple appears twice. Every multiplicity is 1.

**This collection is a set of tuples.** In §6 that was called a relation, and these are the rows of one.

> Every tuple in this result is distinct. Mathematically, the collection has no repeated tuples. But the query still follows SQL's default bag semantics; it simply happens to return no repeated tuple this time.

---

#### Why it is a set

**This guarantee exists because of a rule enforced by the table schema:**

```
payment_id   ← PRIMARY KEY
```

`payment_id` is the primary key of `loan_payments`. The database engine physically refuses to store two rows with the same value in it. This is the exact role the composite key played for `loan_applicants` in §7: it turned "a table of rows" into a formal guarantee that the stored table forms a set.

The date could not provide that guarantee because two payments shared one. A primary key provides it because the schema forbids repetition.

However, a guarantee about the _stored table_ does not automatically carry over to _every query result_. Project the key away, and the bag returns:

```sql
SELECT amount
FROM loan_payments
WHERE loan_id = 'LOAN-501';
```

Ten rows return. Nine are 45,000. This is the query from §8.0, and it is a bag again.

The underlying data did not change. **The stored table is a set.** The query chose a narrower view of it, and that view is a bag. The primary key guarantees that no two stored rows share a `payment_id`. Project that key away, and previously distinct rows can become indistinguishable. SQL preserves those occurrences by default.

---

#### The same object, two views

Look back over the investigation:

| What the query showed | What the result structure was |
|---|---|
| `amount` | A bag: `m(45,000) = 9` |
| `payment_date, amount` | A bag with one repeated pair: `m = 2` |
| `payment_id, payment_date, amount` | A set: every multiplicity is 1 |

Ten events were in the table throughout. What changed is how much of each event the query preserved. **A bag is often a set seen through a narrower lens.**

The rows in this table are the tuples of §5. The table is the relation of §6. Meera's ten payments sit in a database as a set of tuples, and a query that projects only the amount turns them into a bag.

---

#### What the dates reveal—and what they still cannot show

§8.3’s report said no instalments were unpaid. That was consistent with the data, and the dates add detail the report could not show.

The payments run monthly from January to June, with a notable gap:  **no payment is dated in July**. Then, two payments of 45,000 appear on **20 August**.

The natural reading is that July's instalment was paid late, together with August’s. That reading fits the evidence cleanly.

Yet it remains a reading. The table records what was paid and when. It does not record what was due, so it cannot say which instalment each payment settled. A payment event is one thing; an instalment obligation is another. The dates sharpen the evidence while leaving the underlying obligation open.

The earlier amount-only report was never wrong. Counting instalments, it saw ten months and ten payments. It could not see timing.  That is what a bag of amounts cannot hold.

Two columns of the payment record have now been unmasked. One final kind of value is still unaccounted for. Every number and attribute examined so far assumed that a value was always present. 

**§8.6 asks what happens when it is not.**

---

### §8.6 The record that began before the name

An unconscious accident victim is brought into Hospital Planet's ICU by a bystander. Treatment begins at once. Nobody waits for a name, an insurer, or a way to pay. This is the patient followed in Walkthrough 4, whose identity and funding become known only after treatment has begun.

By the next morning the hospital has recorded what it knows. The record has blanks. Some will be filled in over the coming days, when the hospital enters information into a field that was empty. Some may never be filled.

*The table used in this section is illustrative. The Level 1 schema does not yet include claims. The narrative is ahead of the schema by design.*

---

#### Why Hospital Planet, and not FinVERSE?

Every section so far has used FinVERSE. This one leaves it on purpose, because the two businesses answer the same question in opposite ways: *may a record exist before all of its facts are known?*

FinVERSE declares its money columns `NOT NULL`: balances, amounts, principal, and interest rates. Those columns must contain a value before a row can be stored. This is a design choice for those columns. It is not a guarantee that every fact about a customer or loan is known, and FinVERSE has nullable columns elsewhere, such as `email` and `phone`.

Hospital Planet's admission record has to exist even when facts are unknown. An unconscious patient does not wait for a name, an insurer, or a way to pay. Treatment begins first, and the record is created before those facts are known to the hospital. Here the blank that FinVERSE's money columns forbid is the honest state of the data.

Neither design is wrong. Each follows its business. Hospital Planet's motto puts the patient first and billing last, and that order is what makes `NULL` legitimate there.

---

#### Six cases, two structural patterns

The records below are six journeys through the same hospital. The first five are individual patients. The sixth is a sponsored programme that serves many patients under one agreement. Each journey ends with a different funding arrangement, and each passes through a moment when the record is incomplete.


**Walkthrough 1: the insured patient.** A conscious patient arrives with chest pain, supplies insurance details, and is recommended for surgery. The insurer approves full coverage and later settles the bill. The payer is known at admission, the approval is recorded before the operation, and the settlement is recorded after the bill is issued.

**Walkthrough 2: the self-paying patient.** A patient admitted after a fall has no insurance. He pays in full and is discharged. The payer is known from the start, there is one transaction, and nothing is missing.

**Walkthrough 3: the hospital's own nurse.** A nurse develops appendicitis during a shift. Management approves a full waiver for the surgery and aftercare. The payer is the hospital itself. The settlement is not a payment but a decision, so the record must keep the waiver as a business fact and not only the resulting zero.

**Walkthrough 4: the NGO steps in.** An unconscious patient needs urgent surgery. Treatment begins before identity or funding is known. Three days later the patient is identified. A week after that, an NGO agrees to fund the treatment. The name and the NGO commitment are now known. But *committed* is not *paid*: the money has not yet arrived. 

 **Walkthrough 5: transfer and crowdfunding.** An emergency patient, later identified as Sneha Pillai, receives critical care. Continued treatment at Hospital Planet is unaffordable, so she is transferred to a government hospital. Her family starts a crowdfunding campaign to pay Hospital Planet's existing charge. The transfer does not settle that charge, because the government hospital takes over ongoing care and not the bill already incurred. Whether the campaign succeeds is not known.

**Walkthrough 6: the corporate eye camp.** A corporate sponsor funds a ten-day eye camp for people who cannot afford specialist care. Eligibility is checked at the door. Diagnosis, surgery and medicines are fully sponsored under a budget agreed before the camp opens, and surgeries are performed at the hospital nearby. Each patient is admitted, treated and recorded individually, and receives an ID card and a summary of treatment. The sponsor pays once, on a single consolidated invoice, after the camp ends.

Before the camp opens there are no patient rows at all. The budget exists, and the patients do not yet. **The absence of a row is not a `NULL`.** A `NULL` is a blank in a row that exists.

---

#### The snapshot

Here are the records of the five individual patients as the system holds them at the moment the analyst reads them.

| admission_id | patient_name | payer_type | charge | financial_status | settled_amount |
|---|---|---|---|---|---|
| 7001 | Asha Verma | Insurer | 4,200 | Paid | 4,200 |
| 7002 | Ravi Kumar | Patient | 1,200 | Paid | 1,200 |
| 7003 | Meena Das | Hospital Sponsorship | 900 | Waived | 0 |
| 7004 | Rajesh Nair | NGO Sponsorship | 18,000 | Committed | NULL |
| 7005 | Sneha Pillai | NULL | 22,000 | NULL | NULL |

Throughout this section, `settled_amount` means **money received**. A waiver receives no money, which is why row 7003 holds 0 even though a charge of 900 was forgiven.

The first three records have reached their financial outcomes. Row 7004 is committed but unpaid, so its `settled_amount` is `NULL`. Row 7005 is identified but unresolved: no payer, no status, no settlement. The crowdfunding campaign appears nowhere, because the table has no column for an effort to raise money.

**This is a snapshot, not a history.** It holds the endpoint of each journey. It cannot say when the name became known, when the NGO committed, or what the NGO committed to.

The difference between a blank and a zero is the whole section. Row 7003's zero is known. Rows 7004 and 7005 hold `NULL` because the amount received is not yet known. Both are blank, for different reasons.

---

#### What SQL sees

```sql
SELECT * FROM admissions WHERE settled_amount = 0;
```

**Row 7003 only.** A known zero, recorded as a decision.

```sql
SELECT * FROM admissions WHERE settled_amount = NULL;
```

**No rows.** A comparison with `NULL` is neither true nor false. It is *unknown*, and `WHERE` keeps only rows that are true.

```sql
SELECT * FROM admissions WHERE settled_amount IS NULL;
```

**Rows 7004 and 7005.** Both are blank, for different reasons, and the query cannot tell them apart.

```sql
SELECT * FROM admissions WHERE settled_amount <> 4200;
```

**Rows 7002 and 7003.** Row 7001 equals 4,200. Rows 7004 and 7005 are dropped silently, because comparing `NULL` with 4,200 is unknown, not true. This is a common real-world `NULL` bug: the rows vanish and no error appears.

---

#### What the counts measure

```sql
SELECT COUNT(*)              AS rows_,
       COUNT(settled_amount) AS recorded,
       SUM(settled_amount)   AS total
FROM admissions;
```

| rows_ | recorded | total |
|---|---|---|
| 5 | 3 | 5,400 |

This is the occurrences-versus-values theme of §8.2 again. `COUNT(*)` counts every row. `COUNT(settled_amount)` counts non-`NULL` values, which include row 7003's zero, where no money moved. `SUM` adds only the recorded amounts, so it is not "money still to come" or even "money resolved". It is the sum of what is known.

The charges total 46,300. The gap between charges and recorded amounts is 40,900. That gap is not "money owed." It contains row 7004's committed charge, row 7005's unresolved charge, and row 7003's waived 900, which nobody owes. It is an arithmetic difference between two measures, and the data cannot say what it means.

---

#### The analyst's mistake

A manager asks: *"How much is still owed to Hospital Planet by insurers?"*

**The analyst filters on `settled_amount IS NULL`,** which returns rows 7004 and 7005, and treats their charges (18,000 + 22,000) as pending insurance claims.

| The analyst assumed | What the record says | Row |
|---|---|---|
| `NULL` means "pending" | `NULL` means only that the amount received is not yet known. It could also mean "not determined" or "not recorded." | 7004, 7005 |
| Pending means insurance | The payer is an NGO. | 7004 |
| Pending means insurance | There is no payer at all. | 7005 |
| Amount owed equals the charge | The commitment is not paid. Nobody is yet responsible for the charge. | 7004, 7005 |

The analyst used `NULL` as a secret code for a known business state. It meant only: *I do not know yet.* Reading row 7004's `Committed` as "the NGO will pay" would be the opposite error, treating the charge as settled. Both mistakes have one root: **the analyst assigned a meaning the record does not carry.**

---

#### A programme, not a payer

The five-row snapshot has one `payer_type` per patient. The camp does not fit, because the sponsor's commitment belongs to the programme and not to any one patient. So the agreement gets its own table. Both tables here are illustrative.

**`sponsored_programmes`**

| campaign_ref | sponsor_name | committed_budget | invoice_status |
|---|---|---|---|
| CSR-EYE-2026 | Apex Health Foundation | 1,000,000 | Not yet invoiced |

**`admissions` (the first two camp admissions)**

| admission_id | patient_name | payer_type | campaign_ref | charge | financial_status | settled_amount |
|---|---|---|---|---|---|---|
| 7006 | K. Ramaswamy | CSR Sponsorship | CSR-EYE-2026 | 3,500 | Committed | NULL |
| 7007 | Lakshmi Devi | CSR Sponsorship | CSR-EYE-2026 | 12,000 | Committed | NULL |

Every camp admission carries the same `payer_type` — `CSR Sponsorship` — because the sponsor is identified by the programme, not by the individual patient. The `campaign_ref` is what distinguishes this camp from any other CSR programme.

`campaign_ref` is a foreign key from each admission to its programme, the same one-to-many association as §7: one programme, many patients. The hospital still keeps an itemised, patient-level record for every admission. Eligibility is recorded as verified, without recording the reason in this illustrative extract. The programme link identifies the specific CSR campaign and connects each admission to its sponsor.

The programme row holds the batch invoice state: `Not yet invoiced`, then `Invoiced`. Settlement is a separate financial event. The patient rows keep `Committed` as before, and the programme's `invoice_status` records the stage of invoicing, not whether payment has been received.

---

#### The analyst's mistake extended

 **A committed programme is not an uncollected debt.** Now add rows 7006 and 7007 to the same `admissions` table. `settled_amount IS NULL` would return rows 7004 to 7007, and the "pending insurance" total would grow from 40,000 to 55,500. Rows 7006 and 7007 are backed by a programme with a budget and a single invoice due. Row 7004 is a single commitment. Row 7005 has no responsible party at all. All four rows read `NULL`, and they are four different situations. The arithmetic is correct; the classification is not.

---

#### The fix

`NULL` is not a funding model. It is the marker for the absence of a known value. The known states get their own columns, and each column has a declared domain.

`Committed` records a promise to pay. `settled_amount` records money received. Row 7004 has the first but not the second, and the two columns must not be collapsed.

| Column | Permitted values | What it answers | Where `NULL` is still legitimate |
|---|---|---|---|
| `payer_type` | Patient, Insurer, Hospital Sponsorship, CSR Sponsorship, NGO Sponsorship | Who bears the cost? | The payer is unknown (row 7005) |
| `financial_status` | Paid, Waived, Committed | Where is the charge in its life? | No status yet recorded (row 7005) |
| `settled_amount` | A number | How much money has been received? | Amount received is unknown or not recorded (rows 7004, 7005) |

For admission 7005, the payer is unknown or has not been recorded. The record does not establish whether the decision has not yet been made or whether the information is simply missing.

Two earlier sections meet here. §5 noted that `NULL` belongs to no domain, which is why SQL treats it as a marker and not a value. §6 and §7 described a domain as the set of values a column may hold. A CHECK constraint can enforce a permitted set of values, as the following examples illustrate.

The following snippets illustrate domain constraints for `payer_type` and `financial_status` only. They are not a complete table definition; no constraint for settled_amount is shown here.

```sql
payer_type TEXT
    CHECK (payer_type IS NULL OR payer_type IN
        ('Patient', 'Insurer', 'Hospital Sponsorship',  'CSR Sponsorship', 'NGO Sponsorship')),

financial_status TEXT
    CHECK (financial_status IS NULL OR financial_status IN
        ('Paid', 'Waived', 'Committed'))
```

> `financial_status` records where the charge stands in its resolution. It does not record the kind of amount. `Paid` and `Waived` describe how a charge ended, and `Committed` describes a promise not yet kept.

The staff-waiver example is recorded as `('Hospital Sponsorship', 'Waived', 0)`, and a sponsored treatment can name its sponsor. These were never unknowns, so they stop being blanks. `NULL` stays where the unknown is real: the unconscious patient's name and a payer not yet decided.

**These constraints validate each column on its own.** They accept any value that fits that column's domain, and they do not check that the columns agree. Two consequences follow. First, nothing enforces that a waiver is paired with `settled_amount = 0`. Second, `Paid` with a `NULL` settled amount is permitted. **That is the cross-column consistency problem from §7's Domain beat.**

A sponsor's commitment belongs to the programme, not to the patient's row. A `NULL` on that row records only that the amount received is not known. The programme record shows how far the invoice has progressed.

That is the sharper form of this section's lesson. `NULL` records what is not known. These were never unknowns, so they stop being blanks.  A blank can do the first and cannot do the second.

---

#### The record that preserved what was known

The patient needed treatment before the hospital knew a name. The database needed a record before it knew the whole story. Its job was not to force the story to be complete.

**The database must preserve what is known, preserve what is unknown, and never turn an assumption into a fact.**

§8.7 returns to Meera's payments, where the same discipline applies to a total.

---

### 8.7 Back to the ten payments

Section 8.0 began with ten rows and a puzzle: *how do you know whether you are looking at ten payments or two?*

The rows have not changed. What has changed is what you can say about them.

| Question | The amount alone | With the date and `payment_id` |
|---|---|---|
| How many different amounts? | 2, fully answered | 2, fully answered |
| How many payments? | 10 occurrences | 10 distinct events |
| How much was paid? | 465,000 | 465,000, and now it can be checked event by event |
| Were any collapsed by `DISTINCT`? | 105,000 (two distinct amounts) | 420,000 (nine rows; the two 20 August payments merged) |
| Were any instalments late or missed? | Cannot be determined | July has no payment dated in it, which is consistent with a late payment, but the table does not say what was due |


Three habits carry the section:

- **Ask what the collection is before you ask what it totals.** A set and a bag give different answers, and neither is wrong.
- **A repeated value is not necessarily a repeated fact.** Two payments of 45,000 on 20 August were two events. A join that multiplied a row would have been a repeated value with no new fact behind it.
- **A blank is not an answer.** `NULL` marks what is unknown. It is not zero, and it is not a funding model.

A set tells us which values are present. A bag also tells us how many times they occur. In business, that difference can separate a correct total from an inflated one, and a repeated value from a repeated event.

---

### 9. The vocabulary, complete

A chain runs through this folder.

```
Set  →  Tuple  →  Relation  →  Association  →  Bag
```

A **set** records which things belong. A **tuple** gives one thing structure. A **relation** collects tuples that share a structure. An **association** connects two entities, and a key keeps it honest. A **bag** keeps count of what a set forgets.

None of these was invented for the course. Each was already in the rows of every table you queried.

**You have been using sets since the first `SELECT`. The word is new. The concept is not.**

The material that follows asks a different question of the same rows: what one row means. That is the subject of [`01-grain-basics.md`](../02-GRAIN-FOUNDATIONS/01-grain-basics.md).

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

**SQLVerse | Architecture | Relational Mathematics | Part 5 — Bags | Next: Grain Basics** 