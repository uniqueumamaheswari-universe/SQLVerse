


# 🗄️🤖 SQL & GenAI Course
**🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost**

---
## 🧪 Exercise 0 Solutions: Normalization Practice – Library Planet

This document contains the solutions for **Exercise 0: Normalization Practice**. Use it to check your work, understand alternative approaches, and reinforce your learning.

---

## 🌌 SQLVerse Check-In

<div style="border-left: 4px solid #9c27b0; background-color: #f3e5f5; padding: 15px; margin: 20px 0; border-radius: 0 8px 8px 0;">

**The laws of normalization are no longer mysteries to you. You have the keys.** You've transformed a messy spreadsheet into a clean, professional schema. Now check your solutions and see the Artisan's approach.

**The difference between a coder and an Artisan is discipline.**

</div>

---

### 📍 Your Current Stage

```mermaid
flowchart LR
    Quiz["✅ Quiz Complete<br/>📝 Module 4 Quiz"] --> Ex0
    Ex0["📍 YOU ARE HERE<br/>📖 Exercise 0 Solutions<br/>Normalization Practice"] --> Ex1
    Ex1["⏳ Exercise 1 Solutions<br/>INNER JOIN Practice"] --> Ex2
    Ex2["⏳ Exercise 2 Solutions<br/>LEFT JOIN Practice"] --> Ex3
    Ex3["⏳ Exercise 3 Solutions<br/>Multiple Tables Practice"] --> Ex4
    Ex4["⏳ Exercise 4 Solutions<br/>Self Join Practice"] --> Ex5
    Ex5["⏳ Exercise 5 Solutions<br/>Mixed JOIN Practice"] --> Cap
    Cap["⏳ Capstone Solutions<br/>CTO / CEO / CFO"] --> QuizAns
    QuizAns["⏳ Quiz Answers<br/>module4-quiz-answers.md"] --> Complete
    Complete["🎉 MODULE 4 COMPLETE<br/>Ready for ACCELERATE"] --> Guide
    Guide["🔄 Return to Module 4 Guide<br/>for Reflection & Begin ACCELERATE"]
    
    style Quiz fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style Ex0 fill:#fff8e1,stroke:#ff9800,stroke-width:4px
    style Ex1 fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style Ex2 fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style Ex3 fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style Ex4 fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style Ex5 fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style Cap fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style QuizAns fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style Complete fill:#a5d6a7,stroke:#2e7d32,stroke-width:2px
    style Guide fill:#fff8e1,stroke:#ff9800,stroke-width:2px
```

---

### Phase 1: Identify Anomalies (The Structural Audit)

**Redundancy (The Echo Effect)**
- Sarah Chen appears in **4 rows** (loans 1001, 1001 second book, 1003, 1006)
- **Problem:** If she changes her phone number, 4 rows must be updated. Miss one → inconsistent data.

**Update Anomaly (The Ripple Effect)**
- Sarah Chen's email appears in 4 rows. If only 3 rows are updated, the library has conflicting contact information.

**Insertion Anomaly (The "Wait-for-it" Problem)**
- Cannot add a new member (Priya Patel) without creating a fake loan with NULL `loan_id` and `book_title`. This violates data integrity.

**Deletion Anomaly (The Burned Bridge)**
- Deleting loan #1005 (David Thompson's Dune loan) removes all record of David Thompson if that was his only loan.

---

### Phase 2: 1NF

The table is already in 1NF because each cell contains a single atomic value (no comma-separated lists or repeating groups).

---

### Phase 3: 2NF

**Composite Primary Key:** `(loan_id, book_title)`

**Partial Dependencies:**
- `member_name`, `member_email`, `member_phone` depend only on `loan_id` (not on `book_title`)
- `book_author`, `book_genre` depend only on `book_title` (not on `loan_id`)

**2NF Result (4 tables):**

| Table | Columns |
|-------|---------|
| `loans` | loan_id, loan_date, member_name, member_email, member_phone |
| `books` | book_title, book_author, book_genre |
| `loan_details` | loan_id, book_title, return_date, fine_amount |

---

### Phase 4: 3NF

**Transitive Dependencies in `loans` table:**
- `member_email` and `member_phone` depend on `member_name` (not directly on `loan_id`)

**3NF Result (4 tables):**

| Table | Columns | Primary Key | Foreign Key |
|-------|---------|-------------|-------------|
| `members` | member_id, member_name, member_email, member_phone | member_id | – |
| `books` | book_id, book_title, book_author, book_genre | book_id | – |
| `loans` | loan_id, loan_date, member_id | loan_id | member_id → members(member_id) |
| `loan_details` | loan_detail_id, loan_id, book_id, return_date, fine_amount | loan_detail_id | loan_id → loans(loan_id), book_id → books(book_id) |

---

### Phase 5: CREATE TABLE Statements

```sql
-- Table: members
CREATE TABLE members (
    member_id INTEGER PRIMARY KEY,
    member_name TEXT NOT NULL,
    member_email TEXT UNIQUE NOT NULL,
    member_phone TEXT
);

-- Table: books
CREATE TABLE books (
    book_id INTEGER PRIMARY KEY,
    book_title TEXT NOT NULL,
    book_author TEXT NOT NULL,
    book_genre TEXT
);

-- Table: loans
CREATE TABLE loans (
    loan_id INTEGER PRIMARY KEY,
    loan_date DATE NOT NULL,
    member_id INTEGER NOT NULL,
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- Table: loan_details
CREATE TABLE loan_details (
    loan_detail_id INTEGER PRIMARY KEY,
    loan_id INTEGER NOT NULL,
    book_id INTEGER NOT NULL,
    return_date DATE,
    fine_amount DECIMAL(6,2) DEFAULT 0,
    FOREIGN KEY (loan_id) REFERENCES loans(loan_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
```

---

### Phase 6: INSERT Statements

```sql
-- Insert members
INSERT INTO members (member_id, member_name, member_email, member_phone) VALUES
(1, 'Sarah Chen', 'sarah.c@email.com', '555-1001'),
(2, 'Mike Rodriguez', 'mike.r@email.com', '555-1002'),
(3, 'Lisa Johnson', 'lisa.j@email.com', '555-1003'),
(4, 'David Thompson', 'david.t@email.com', '555-1004');

-- Insert books
INSERT INTO books (book_id, book_title, book_author, book_genre) VALUES
(1, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy'),
(2, 'The Fellowship of the Ring', 'J.R.R. Tolkien', 'Fantasy'),
(3, 'The Two Towers', 'J.R.R. Tolkien', 'Fantasy'),
(4, 'Dune', 'Frank Herbert', 'Sci-Fi'),
(5, 'Becoming', 'Michelle Obama', 'Biography'),
(6, 'The Silent Patient', 'Alex Michaelides', 'Thriller');

-- Insert loans
INSERT INTO loans (loan_id, loan_date, member_id) VALUES
(1001, '2025-01-10', 1),
(1002, '2025-01-12', 2),
(1003, '2025-01-15', 1),
(1004, '2025-01-20', 3),
(1005, '2025-02-01', 4),
(1006, '2025-02-05', 1);

-- Insert loan_details
INSERT INTO loan_details (loan_detail_id, loan_id, book_id, return_date, fine_amount) VALUES
(1, 1001, 1, '2025-01-24', 0.00),
(2, 1001, 2, '2025-02-07', 5.00),
(3, 1002, 4, '2025-01-26', 0.00),
(4, 1003, 3, '2025-01-29', 0.00),
(5, 1004, 5, '2025-02-03', 0.00),
(6, 1004, 6, '2025-02-17', 3.00),
(7, 1005, 4, '2025-02-15', 0.00),
(8, 1006, 1, '2025-02-19', 0.00);
```

---

### Phase 7: Verification Queries

**Query 1: Reconstruct the original flat view**

```sql
SELECT 
    l.loan_id,
    l.loan_date,
    m.member_name,
    m.member_email,
    b.book_title,
    b.book_author,
    ld.return_date,
    ld.fine_amount
FROM loans l
JOIN members m ON l.member_id = m.member_id
JOIN loan_details ld ON l.loan_id = ld.loan_id
JOIN books b ON ld.book_id = b.book_id
ORDER BY l.loan_id;
```

**Query 2: Members with total fines greater than zero**

```sql
SELECT 
    m.member_name,
    SUM(ld.fine_amount) AS total_fines
FROM members m
JOIN loans l ON m.member_id = l.member_id
JOIN loan_details ld ON l.loan_id = ld.loan_id
GROUP BY m.member_id
HAVING SUM(ld.fine_amount) > 0;
```

**Expected Result:**

| member_name | total_fines |
|-------------|-------------|
| Sarah Chen | 5.00 |
| Lisa Johnson | 3.00 |

**Query 3: Members with no loans (proves insertion anomaly solved)**

```sql
-- First add a new member with no loans
INSERT INTO members (member_id, member_name, member_email, member_phone) VALUES
(5, 'Priya Patel', 'priya.p@email.com', '555-1005');

-- Then find members with no loans
SELECT m.member_name, m.member_email
FROM members m
LEFT JOIN loans l ON m.member_id = l.member_id
WHERE l.loan_id IS NULL;
```

**Expected Result:**

| member_name | member_email |
|-------------|--------------|
| Priya Patel | priya.p@email.com |

---

## ✅ Solution Summary

| Phase | Key Concept | Status |
|-------|-------------|--------|
| Phase 1 | Anomaly Identification | ✅ Complete |
| Phase 2 | 1NF – Atomic values | ✅ Complete |
| Phase 3 | 2NF – Remove partial dependencies | ✅ Complete |
| Phase 4 | 3NF – Remove transitive dependencies | ✅ Complete |
| Phase 5 | CREATE TABLE statements | ✅ Complete |
| Phase 6 | INSERT statements | ✅ Complete |
| Phase 7 | Verification queries | ✅ Complete |

---

## 🧭 EVALUATE Navigation

```mermaid
flowchart LR
    Quiz["✅ Quiz Complete<br/>📝 Module 4 Quiz"] --> Ex0
    Ex0["✅ COMPLETED<br/>📖 Exercise 0 Solutions<br/>Normalization Practice"] --> Ex1
    Ex1["⏳ Exercise 1 Solutions<br/>INNER JOIN Practice"] --> Ex2
    Ex2["⏳ Exercise 2 Solutions<br/>LEFT JOIN Practice"] --> Ex3
    Ex3["⏳ Exercise 3 Solutions<br/>Multiple Tables Practice"] --> Ex4
    Ex4["⏳ Exercise 4 Solutions<br/>Self Join Practice"] --> Ex5
    Ex5["⏳ Exercise 5 Solutions<br/>Mixed JOIN Practice"] --> Cap
    Cap["⏳ Capstone Solutions<br/>CTO / CEO / CFO"] --> QuizAns
    QuizAns["⏳ Quiz Answers<br/>module4-quiz-answers.md"] --> Complete
    Complete["🎉 MODULE 4 COMPLETE<br/>Ready for ACCELERATE"] --> Guide
    Guide["🔄 Return to Module 4 Guide<br/>for Reflection & Begin ACCELERATE"]
    
    style Quiz fill:#e1f5fe,stroke:#4caf50,stroke-width:2px
    style Ex0 fill:#e1f5fe,stroke:#4caf50,stroke-width:4px
    style Ex1 fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style Ex2 fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style Ex3 fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style Ex4 fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style Ex5 fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style Cap fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style QuizAns fill:#fff8e1,stroke:#ff9800,stroke-width:2px
    style Complete fill:#a5d6a7,stroke:#2e7d32,stroke-width:2px
    style Guide fill:#fff8e1,stroke:#ff9800,stroke-width:2px
```

| Previous Step | Next Step |
|:---:|:---:|
| [← Back to Module 4 Guide](../MODULE4_GUIDE.md) | [Continue to Exercise 1 Solutions →](../../4-exerciseAndQuizSolutions/1-inner-join-practice-solutions.md) |

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

**Level 1 | Module 4 | Exercise 0 Solutions**