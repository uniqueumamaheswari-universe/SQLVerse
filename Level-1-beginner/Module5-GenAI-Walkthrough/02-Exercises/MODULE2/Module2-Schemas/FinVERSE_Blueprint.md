

# 🗄️🤖 SQL & GenAI Course
**🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost**

---

# 🗄️📊 FinVERSE — Digital Banking Ecosystem Blueprint


## 📌 Purpose

This document describes the **FinVERSE** – the financial universe inside SQLVerse. FinVERSE is a modern digital banking ecosystem that powers retail banking, digital payments, lending, and customer operations.

Unlike E‑Store or Hospital Planet, FinVERSE is not a simple "customer → order → item" pattern. It is a multi‑service financial platform where customers hold accounts, transact with merchants, use cards, take loans, and interact with support.

**This is a complete domain shift. No mirrors. No structural comfort. This is a new consulting engagement.**

---

## 🌍 Welcome to FinVERSE

> A modern digital banking ecosystem serving millions of retail customers through savings accounts, debit cards, digital payments, lending, and customer support.

Inside FinVERSE you'll work with:

- Customers
- Accounts
- Transactions
- Cards
- Loans
- Merchants
- Branches
- Employees

Every request comes from a real department inside the organization, requiring you to think beyond SQL and understand the business decisions behind the data.

---

## 🌍 Business Landscape Through a Consultant's Lens

FinVERSE is not a traditional bank. It is a digital‑first financial services platform serving millions of retail customers through a mobile app and web dashboard.

### 🏢 Meet the Business

**FinVERSE is a digital banking ecosystem.**

Here is how the business operates:

- **Customers onboard** and create accounts.
- **Customers transact** with merchants via cards, UPI, or bank transfers.
- **Customers access credit** through personal loans.
- **Customers receive support** when they encounter issues.
- **Internal teams** monitor fraud, risk, compliance, and financial performance.

```mermaid
flowchart LR
    Customer[Customer] -->|Onboards| Account[Account]
    Account -->|Transacts| Transaction[Transaction]
    Account -->|Uses| Card[Card]
    Account -->|Applies for| Loan[Loan]
    Loan -->|Repays| LoanPayment[Loan Payment]
    Customer -->|Raises| Ticket[Support Ticket]
```

> 💡 **Your responsibility is not to run a bank.** Your responsibility is to understand how money, customers, and data flow through the financial system.

---

**The Core Stakeholders:**

| Entity | Role |
|--------|------|
| **Customers** | Individuals who hold accounts, transact, and use financial products. |
| **Accounts** | Financial containers that hold customer funds and track balances. |
| **Transactions** | Money movement – deposits, withdrawals, transfers, and merchant payments. |
| **Cards** | Debit or credit instruments linked to accounts. |
| **Loans** | Credit products extended to customers with repayment schedules. |
| **Merchants** | Entities that accept payments from customers. |
| **Employees** | FinVERSE staff who manage support, fraud, risk, and operations. |
| **Branches** | Physical or virtual service centres. |

---

### 🎭 Business Scenarios – SQLVerse Characters in FinVERSE

---

#### Scenario 1 – Arjun's Card Payment Issue

**Context:** Arjun is shopping on the Amazon app. He tries to pay using his credit card, but the payment fails due to a technical glitch. He opens the FinVERSE app, checks his account balance, and completes the payment using his debit card instead.

**Business Relevance:** This scenario introduces:
- Card status validation
- Account balance verification
- Transaction recording
- Payment method switching

**Departments Involved:** Customer Success, Payments Team, Fraud Detection

---

#### Scenario 2 – Raj's Home Loan Recommendation

**Context:** Raj has been a loyal FinVERSE customer for years. He recommends FinVERSE to his friend, who is looking for a home loan. His friend negotiates a competitive interest rate, gets the loan approved quickly, and experiences a smooth fund transfer to the seller's account. He is thrilled with the experience.

**Business Relevance:** This scenario introduces:
- Loan application and approval workflow
- Interest rate negotiation (stored in `interest_rate`)
- Fund transfer transactions
- Customer referral journey

**Departments Involved:** Credit Team, Operations, Customer Success

---

#### Scenario 3 – Annie's Brother's Urgent Money Transfer

**Context:** Annie's brother needs to send money urgently to his son, who is studying in the United States. He uses FinVERSE to transfer funds internationally. The transaction is processed swiftly, and the son receives the money within minutes.

**Business Relevance:** This scenario introduces:
- International money transfer (transaction type `Transfer`)
- Cross‑border payments
- Transaction status tracking
- Customer trust and reliability

**Departments Involved:** Payments Team, Fraud Detection, Compliance

---

### 🌊 Typical Business Events

| Event | Explanation & Actors |
|-------|----------------------|
| **Customer Onboards** | A new customer registers and creates their first account. *(Actor: Customer, Customer Success)* |
| **Transaction Occurs** | A customer makes a purchase, deposit, or transfer. *(Actor: Customer, Merchant, Payments Team)* |
| **Card Issued** | A debit or credit card is linked to a customer account. *(Actor: Customer, Card Operations)* |
| **Loan Applied** | A customer applies for a personal loan. *(Actor: Customer, Credit Team)* |
| **Loan Repayment Made** | A customer pays back a loan instalment. *(Actor: Customer, Collections Team)* |
| **Support Ticket Raised** | A customer reports an issue or requests assistance. *(Actor: Customer, Support Team)* |
| **Fraud Alert Triggered** | A suspicious transaction is flagged for review. *(Actor: Fraud Detection Team)* |

---

### 📖 Business Vocabulary

| Term | Meaning |
|------|---------|
| **Account** | A financial container holding a customer's funds. Includes balance, type (savings, current, salary), and status. |
| **Transaction** | Any money movement – debit, credit, transfer, or merchant payment. |
| **Card** | A physical or digital card linked to an account. Used for payments and ATM withdrawals. |
| **Loan** | A credit product extended to a customer. Includes principal, interest rate, tenure, and status. |
| **Merchant** | A business that accepts payments from FinVERSE customers. |
| **Support Ticket** | A customer‑raised issue or query. Used to track resolution. |
| **Branch** | A service location where customers can interact with FinVERSE staff. |
| **Employee** | A FinVERSE staff member. Includes relationship managers, credit officers, and support agents. |
| **KYC** | "Know Your Customer" – identity verification required for account opening. |
| **Chargeback** | A disputed transaction reversed by the bank. |
| **Settlement** | Finalisation of a merchant transaction. |

> **📌 Design Note – Fraud and Risk:**
>
> In this simplified model, fraud detection is indicated by a `is_fraud` flag on transactions and a `risk_score` on accounts. Full fraud workflow (case management, investigation, resolution) will be introduced in **Level 2**.

---

### 🔄 Observe the Business Workflow

A customer's financial journey flows through the system in a specific sequence:

```text
Customer Onboards
        ↓
Account Created
        ↓
Card Issued / Loan Applied
        ↓
Transactions Occur
        ↓
Loan Repayments Made
        ↓
Support Tickets Raised (if needed)
        ↓
Account Monitored (Fraud, Risk, Compliance)
```

Each step in this workflow is represented by one or more tables in the database.

---

### 🧠 Before Looking at the Tables

Ask yourself three business questions:

1. **Where does a customer first enter the system?**
   → What table stores customer registration?

2. **How does money move through the ecosystem?**
   → Which tables track balances, transactions, and settlements?

3. **What business events signal financial health?**
   → Which tables record loan status, fraud flags, and customer support outcomes?

---

### 🔍 Now Start Reading the Blueprint

With these questions in mind, study the ER diagram and table schemas below. The database is designed to mirror the financial workflow you just traced. Your task is to identify which table stores each business event.

**Business first. Data model second. SQL third.**

---

## 📊 Entity Relationship Diagram (ERD)

```mermaid
erDiagram
    Customers ||--o{ Accounts : holds
    Accounts ||--o{ Transactions : initiates
    Accounts ||--o{ Cards : issues
    Customers ||--o{ Loans : applies_for
    Loans ||--o{ Loan_Payments : receives
    Customers ||--o{ Support_Tickets : raises
    Merchants ||--o{ Transactions : processes
    Employees ||--o{ Support_Tickets : resolves
    Branches ||--o{ Employees : employs

    Customers {
        INTEGER customer_id PK
        TEXT first_name
        TEXT last_name
        TEXT email
        TEXT phone
        TEXT kyc_status
        TEXT risk_score
        TEXT onboarding_date
        TEXT status
    }
    Accounts {
        INTEGER account_id PK
        INTEGER customer_id FK
        TEXT account_type
        REAL balance
        TEXT status
    }
    Transactions {
        INTEGER transaction_id PK
        INTEGER account_id FK
        INTEGER merchant_id FK
        REAL amount
        TEXT transaction_type
        TEXT transaction_date
        TEXT status
        BOOLEAN is_fraud
    }
    Cards {
        INTEGER card_id PK
        INTEGER account_id FK
        TEXT card_type
        TEXT card_number
        TEXT expiry_date
        TEXT status
    }
    Loans {
        INTEGER loan_id PK
        INTEGER customer_id FK
        REAL principal
        REAL interest_rate
        REAL tenure_months
        REAL outstanding_balance
        TEXT status
        TEXT approval_date
    }
    Loan_Payments {
        INTEGER payment_id PK
        INTEGER loan_id FK
        REAL amount
        TEXT payment_date
        TEXT payment_method
        TEXT status
    }
    Merchants {
        INTEGER merchant_id PK
        TEXT name
        TEXT category
        TEXT settlement_type
        TEXT status
    }
    Support_Tickets {
        INTEGER ticket_id PK
        INTEGER customer_id FK
        INTEGER employee_id FK
        TEXT ticket_type
        TEXT status
        TEXT created_date
        TEXT resolved_date
    }
    Employees {
        INTEGER employee_id PK
        TEXT first_name
        TEXT last_name
        TEXT role
        INTEGER manager_id
        INTEGER branch_id FK
    }
    Branches {
        INTEGER branch_id PK
        TEXT name
        TEXT city
        TEXT state
        TEXT status
    }
```

---

## 🗂️ Table Schemas

### `customers`

| Column | Type | Nullable | Description |
|--------|------|----------|-------------|
| `customer_id` | INTEGER | No | Primary key – unique customer identifier |
| `first_name` | TEXT | No | Customer's first name |
| `last_name` | TEXT | No | Customer's last name |
| `email` | TEXT | Yes | Email address – **some NULLs for realism** |
| `phone` | TEXT | Yes | Phone number – **some NULLs for realism** |
| `kyc_status` | TEXT | No | `Pending`, `Verified`, `Rejected`, `Incomplete` |
| `risk_score` | TEXT | No | `Low`, `Medium`, `High` – used by Risk Team |
| `onboarding_date` | TEXT | No | Date the customer first registered |
| `status` | TEXT | No | `Active`, `Inactive`, `Suspended`, `Closed` |

---

### `accounts`

| Column | Type | Nullable | Description |
|--------|------|----------|-------------|
| `account_id` | INTEGER | No | Primary key – unique account identifier |
| `customer_id` | INTEGER | No | Foreign key to `customers.customer_id` – owner of the account |
| `account_type` | TEXT | No | `Savings`, `Current`, `Salary`, `Joint` |
| `balance` | REAL | No | Current account balance in credits |
| `status` | TEXT | No | `Active`, `Dormant`, `Closed`, `Frozen` |

**Foreign Key:** `customer_id` → `customers(customer_id)`

---

### `transactions`

| Column | Type | Nullable | Description |
|--------|------|----------|-------------|
| `transaction_id` | INTEGER | No | Primary key – unique transaction identifier |
| `account_id` | INTEGER | No | Foreign key to `accounts.account_id` – source account |
| `merchant_id` | INTEGER | Yes | Foreign key to `merchants.merchant_id` – merchant involved (if any) |
| `amount` | REAL | No | Transaction amount in credits |
| `transaction_type` | TEXT | No | `Debit`, `Credit`, `Transfer`, `Payment` |
| `transaction_date` | TEXT | No | Date and time of the transaction |
| `status` | TEXT | No | `Pending`, `Completed`, `Failed`, `Reversed` |
| `is_fraud` | BOOLEAN | No | `TRUE` if flagged as fraudulent (default `FALSE`) |

**Foreign Keys:**
- `account_id` → `accounts(account_id)`
- `merchant_id` → `merchants(merchant_id)`

---

### `cards`

| Column | Type | Nullable | Description |
|--------|------|----------|-------------|
| `card_id` | INTEGER | No | Primary key – unique card identifier |
| `account_id` | INTEGER | No | Foreign key to `accounts.account_id` – linked account |
| `card_type` | TEXT | No | `Debit`, `Credit`, `Prepaid` |
| `card_number` | TEXT | No | Masked card number (e.g., `****1234`) |
| `expiry_date` | TEXT | No | Card expiry date in `YYYY-MM-DD` format |
| `status` | TEXT | No | `Active`, `Blocked`, `Expired`, `Lost` |

**Foreign Key:** `account_id` → `accounts(account_id)`

---

### `loans`

| Column | Type | Nullable | Description |
|--------|------|----------|-------------|
| `loan_id` | INTEGER | No | Primary key – unique loan identifier |
| `customer_id` | INTEGER | No | Foreign key to `customers.customer_id` – borrower |
| `principal` | REAL | No | Original loan amount |
| `interest_rate` | REAL | No | Annual interest rate (e.g., `12.5` for 12.5%) |
| `tenure_months` | INTEGER | No | Repayment period in months |
| `outstanding_balance` | REAL | No | Remaining balance to be repaid |
| `status` | TEXT | No | `Active`, `Completed`, `Defaulted`, `Pending` |
| `approval_date` | TEXT | No | Date the loan was approved |

**Foreign Key:** `customer_id` → `customers(customer_id)`

---

### `loan_payments`

| Column | Type | Nullable | Description |
|--------|------|----------|-------------|
| `payment_id` | INTEGER | No | Primary key – unique payment identifier |
| `loan_id` | INTEGER | No | Foreign key to `loans.loan_id` – which loan is being repaid |
| `amount` | REAL | No | Payment amount |
| `payment_date` | TEXT | No | Date of the payment |
| `payment_method` | TEXT | No | `Bank Transfer`, `Card`, `Cash`, `UPI` |
| `status` | TEXT | No | `Pending`, `Completed`, `Failed` |

**Foreign Key:** `loan_id` → `loans(loan_id)`

---

### `merchants`

| Column | Type | Nullable | Description |
|--------|------|----------|-------------|
| `merchant_id` | INTEGER | No | Primary key – unique merchant identifier |
| `name` | TEXT | No | Merchant business name |
| `category` | TEXT | No | `Retail`, `E‑Commerce`, `Food`, `Travel`, `Utilities` |
| `settlement_type` | TEXT | No | `Daily`, `Weekly`, `Monthly` – how often they are paid |
| `status` | TEXT | No | `Active`, `Suspended`, `Inactive` |

---

### `support_tickets`

| Column | Type | Nullable | Description |
|--------|------|----------|-------------|
| `ticket_id` | INTEGER | No | Primary key – unique ticket identifier |
| `customer_id` | INTEGER | No | Foreign key to `customers.customer_id` – who raised the ticket |
| `employee_id` | INTEGER | Yes | Foreign key to `employees.employee_id` – assigned resolver |
| `ticket_type` | TEXT | No | `Account Issue`, `Card Issue`, `Transaction Dispute`, `Loan Query`, `Fraud Report` |
| `status` | TEXT | No | `Open`, `In Progress`, `Resolved`, `Closed` |
| `created_date` | TEXT | No | Date the ticket was raised |
| `resolved_date` | TEXT | Yes | Date the ticket was resolved – **some NULLs for realism** |

**Foreign Keys:**
- `customer_id` → `customers(customer_id)`
- `employee_id` → `employees(employee_id)`

---

### `employees`

| Column | Type | Nullable | Description |
|--------|------|----------|-------------|
| `employee_id` | INTEGER | No | Primary key – unique employee identifier |
| `first_name` | TEXT | No | Employee's first name |
| `last_name` | TEXT | No | Employee's last name |
| `role` | TEXT | No | `Support Agent`, `Credit Officer`, `Fraud Analyst`, `Relationship Manager`, `Branch Manager` |
| `manager_id` | INTEGER | Yes | Self‑join reference to `employee_id` – who they report to |
| `branch_id` | INTEGER | Yes | Foreign key to `branches.branch_id` – where they work |

**Foreign Key:** `branch_id` → `branches(branch_id)`  
**Self‑Join:** `manager_id` → `employees(employee_id)`

---

### `branches`

| Column | Type | Nullable | Description |
|--------|------|----------|-------------|
| `branch_id` | INTEGER | No | Primary key – unique branch identifier |
| `name` | TEXT | No | Branch name |
| `city` | TEXT | No | City where the branch is located |
| `state` | TEXT | No | State where the branch is located |
| `status` | TEXT | No | `Active`, `Closed`, `Temporarily Closed` |

---

## 🔗 Key Relationships

| Relationship | Cardinality | Explanation |
|--------------|-------------|-------------|
| `customers` → `accounts` | One‑to‑Many | One customer can hold multiple accounts |
| `customers` → `loans` | One‑to‑Many | One customer can take multiple loans over time |
| `customers` → `support_tickets` | One‑to‑Many | One customer can raise multiple tickets |
| `accounts` → `transactions` | One‑to‑Many | One account can have many transactions |
| `accounts` → `cards` | One‑to‑Many | One account can have multiple cards |
| `loans` → `loan_payments` | One‑to‑Many | One loan can have many repayments |
| `merchants` → `transactions` | One‑to‑Many | One merchant can process many transactions |
| `employees` → `support_tickets` | One‑to‑Many | One employee can resolve many tickets |
| `employees` → `employees` | Self‑Join | One employee reports to a manager (also an employee) |
| `branches` → `employees` | One‑to‑Many | One branch employs many employees |

---

## 📊 Sample Data Highlights (Planned)

| Feature | Example | Purpose |
|---------|---------|---------|
| **NULL emails/phones** | Some customers have missing contact details | Enables `IS NULL` exercises |
| **KYC status** | Pending, Verified, Rejected, Incomplete | Enables status‑based filtering |
| **Risk scores** | Low, Medium, High | Enables `IN` and logical operator exercises |
| **Account types** | Savings, Current, Salary, Joint | Enables category‑based filtering |
| **Transaction types** | Debit, Credit, Transfer, Payment | Enables `IN` and `BETWEEN` exercises |
| **Card status** | Active, Blocked, Expired, Lost | Enables status‑based filtering |
| **Loan status** | Active, Completed, Defaulted, Pending | Enables logical operator exercises |
| **Ticket status** | Open, In Progress, Resolved, Closed | Enables status‑based filtering |
| **Fraud flags** | Transactions with `is_fraud = TRUE` | Enables fraud detection exercises |
| **Date spread** | Transactions and loans across Q1‑Q3 2025 | Enables `BETWEEN` date range exercises |
| **Multiple payments per loan** | Each loan has 1–3 repayments | Enables aggregation in Module 3 |
| **Self‑join readiness** | Employees have `manager_id` | Enables `SELF JOIN` in Module 4 |

---

## 🧠 Architect's Design Notes

- **Domain Depth** – FinVERSE has 10 tables, making it richer than any previous domain. This mirrors production‑scale databases.
- **Multi‑Table Workflow** – Customer → Account → Transaction → Merchant → Loan → Support → Employee → Branch. This enables progressive complexity across Modules 2–4.
- **NULL Handling** – Email, phone, resolved_date – multiple NULL combinations for `IS NULL` exercises.
- **Logical Operators** – Combine `account_type`, `status`, `balance`, `risk_score` for `AND`/`OR` exercises.
- **Range Filtering** – `balance`, `amount`, `principal`, `outstanding_balance` support `BETWEEN`, `>`, `<`.
- **Pattern Matching** – Names, merchant categories, ticket types support `LIKE` exercises.
- **JOIN Readiness** – All foreign keys are in place. This schema supports `INNER JOIN`, `LEFT JOIN`, `SELF JOIN`, and multi‑table joins for Module 4.
- **Aggregation Readiness** – Multiple transactions per account, multiple payments per loan, multiple tickets per customer support `GROUP BY`, `SUM`, `COUNT`, `HAVING` in Module 3.
- **Self‑Join Potential** – `employees.manager_id` enables `SELF JOIN` exercises.
- **Fraud Detection** – `is_fraud` flag enables real‑world financial analytics.
- **Business Stakeholders** – Each table supports a department (Customer Success, Fraud, Risk, Credit, Finance, Support, Operations). This aligns with the consulting framework developed in Exercise 4.

---

## 🎯 SQLVerse Architect's Checklist

Before writing SQL, professional developers usually answer three questions:

1. **Where does this information live?**
   Identify the table that owns the requested business data – customers, accounts, transactions, cards, loans, merchants, support tickets, employees, or branches.

2. **Will one table be sufficient?**
   Decide whether the business request requires relationships across multiple tables.

3. **What exactly is the business asking to see?**
   Separate the required output from the business story.

> **Blueprint Reminder:** This document helps you understand the data model before you begin querying it. Understanding the structure first usually leads to simpler and more accurate SQL.

---

## 🚀 Extendability for Level 2 and Level 3

FinVERSE is designed to grow with the learner.

| Level | New Features | Tables/Concepts Added |
|-------|--------------|----------------------|
| **Level 1** | Core SQL | Customers, Accounts, Transactions, Cards, Loans, Merchants, Support, Employees, Branches |
| **Level 2** | Subqueries, CTEs, Views, Window Functions | Fraud investigations, KYC workflows, Monthly reporting views |
| **Level 3** | Stored procedures, Triggers, Transactions, Indexes, Data Warehousing | Revenue analytics, Customer lifetime value, Portfolio risk modelling |

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

**SQLVerse FinVERSE Blueprint | Level 1 | ACCELERATE Phase | APPLY Cycle**