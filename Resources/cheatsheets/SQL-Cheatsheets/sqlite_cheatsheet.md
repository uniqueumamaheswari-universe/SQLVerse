

## 📱 **SQLite Cheatsheet: The Learning Factory**

### 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost

---

## 🏢 **The Browser Office: Tab 2 - The Factory**

**Tab 2: The Factory**  
*📱 SQLite Learning Lab - Your browser-based SQL playground*

**🚀 Kickstart: Any Computer, Any Browser, Anytime.**  
**🌍 Destination: Any country, Any city, Any Platform.**

**Your immediate, zero-installation SQL playground.**  
Perfect for Levels 1-2 learning, prototyping, and mobile development. Single-file architecture means you can practice anywhere with just a browser.

---

## 📋 **Core SQLite Characteristics**

| Aspect | SQLite Implementation | Key Notes |
| :--- | :--- | :--- |
| **Architecture** | Serverless, file-based | No installation, just `.db` file |
| **Concurrency** | Single writer, multiple readers | Great for learning, simpler than MVCC |
| **Typing** | Dynamic (manifest typing) | Flexible but requires discipline |
| **Best For** | Learning, mobile apps, embedded systems | Levels 1-2 perfect match |

---

## 🔤 **Essential Syntax Reference**

### **Data Types (Simplified):**
```sql
-- Core types (manifest typing - type affinity)
INTEGER     -- Whole numbers
REAL        -- Floating point numbers
TEXT        -- Strings
BLOB        : Binary data
NULL        -- Missing information

-- Type affinity examples
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,  -- Auto-incrementing
    name TEXT,                             -- Strings
    age INTEGER,                           -- Whole numbers
    salary REAL,                           -- Decimal numbers
    profile_pic BLOB,                      -- Images/files
    notes TEXT                             -- Text content
);
```

### **Table Operations:**
```sql
-- Create table (simple)
CREATE TABLE employees (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    department TEXT DEFAULT 'General',
    salary REAL,
    hire_date TEXT  -- SQLite uses TEXT for dates
);

-- Create table with constraints
CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    price REAL CHECK(price > 0),
    category TEXT,
    in_stock INTEGER DEFAULT 1
);

-- Alter table (limited support)
ALTER TABLE employees ADD COLUMN email TEXT;
ALTER TABLE products RENAME TO inventory_items;

-- Drop table
DROP TABLE IF EXISTS temp_data;
```

### **CRUD Operations:**
```sql
-- INSERT
INSERT INTO employees (name, department, salary) 
VALUES ('John Doe', 'Sales', 50000.00);

INSERT INTO products (name, price, category) 
VALUES ('Laptop', 999.99, 'Electronics'),
       ('Mouse', 29.99, 'Accessories');

-- SELECT
SELECT * FROM employees;
SELECT name, salary FROM employees WHERE department = 'Sales';
SELECT DISTINCT department FROM employees;
SELECT name, salary * 1.1 AS new_salary FROM employees;

-- UPDATE
UPDATE employees SET salary = salary * 1.05 WHERE department = 'Engineering';
UPDATE products SET price = price * 0.9 WHERE category = 'Clearance';

-- DELETE
DELETE FROM employees WHERE id = 5;
DELETE FROM products WHERE in_stock = 0;
```

---

## 🎯 **SQLite-Specific Features**

### **Date & Time Handling:**
```sql
-- SQLite uses TEXT/REAL/INTEGER for dates
-- Store as TEXT (ISO8601 recommended)
INSERT INTO events (name, event_date) 
VALUES ('Meeting', '2024-01-15 14:30:00');

-- Date functions
SELECT date('now');                    -- Current date: '2024-01-15'
SELECT datetime('now');                -- Current datetime
SELECT strftime('%Y-%m-%d', 'now');    -- Formatted date
SELECT date('now', '+7 days');         -- Add 7 days
SELECT julianday('2024-12-31') - julianday('2024-01-15');  -- Days between
```

### **Advanced Queries:**
```sql
-- LIMIT for pagination
SELECT * FROM products ORDER BY price DESC LIMIT 10;
SELECT * FROM products LIMIT 10 OFFSET 20;  -- Page 3 (skip 20, take 10)

-- CASE statements
SELECT name, 
       CASE 
           WHEN salary > 70000 THEN 'High'
           WHEN salary > 40000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_band
FROM employees;

-- String functions
SELECT UPPER(name), LOWER(department) FROM employees;
SELECT name, LENGTH(name) AS name_length FROM employees;
SELECT SUBSTR(name, 1, 3) AS initials FROM employees;
SELECT REPLACE(description, 'old', 'new') FROM products;
```

### **Aggregations:**
```sql
-- Basic aggregations
SELECT COUNT(*) FROM employees;
SELECT AVG(salary) FROM employees;
SELECT SUM(sales) FROM transactions WHERE year = 2024;
SELECT MIN(price), MAX(price) FROM products;

-- GROUP BY
SELECT department, AVG(salary) as avg_salary 
FROM employees 
GROUP BY department;

SELECT category, COUNT(*) as product_count, AVG(price) as avg_price
FROM products 
GROUP BY category 
HAVING COUNT(*) > 5;
```

---

## 🔗 **Joins in SQLite**

```sql
-- Sample tables for join examples
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    amount REAL,
    order_date TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- INNER JOIN (most common)
SELECT customers.name, orders.amount, orders.order_date
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id;

-- LEFT JOIN (all customers, even without orders)
SELECT customers.name, COUNT(orders.order_id) as order_count
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id;

-- Multiple joins
SELECT c.name, p.product_name, oi.quantity
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;
```

---

## 🛠️ **Browser-Based Tools & Practice**

### **Recommended Online Platforms:**
1. **SQLite Online** - Direct `.db` file upload
2. **Replit** - Full development environment with SQLite
3. **SQL Fiddle** - Schema sharing and testing
4. **DB Browser for SQLite** (desktop) - GUI management

### **Quick Practice Setup:**
```sql
-- Copy-paste this into any SQLite online tool
CREATE TABLE students (
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    major TEXT,
    gpa REAL,
    graduation_year INTEGER
);

INSERT INTO students (name, major, gpa, graduation_year) VALUES
('Alice Smith', 'Computer Science', 3.8, 2024),
('Bob Johnson', 'Mathematics', 3.5, 2025),
('Carol Williams', 'Physics', 3.9, 2024);

-- Practice queries
SELECT * FROM students WHERE gpa > 3.7;
SELECT major, AVG(gpa) FROM students GROUP BY major;
```

---

## ⚠️ **SQLite Limitations & Workarounds**

| Limitation | Workaround | Impact on Learning |
| :--- | :--- | :--- |
| **No stored procedures** | Use application logic | Learn fundamentals first |
| **Limited ALTER TABLE** | Create new table, copy data | Understand schema design |
| **Single writer** | Good for learning concurrency basics | Simpler than enterprise DBs |
| **No built-in JSON** | Use TEXT with JSON functions | Focus on relational concepts |

---

## 📚 **Learning Path Integration**

### **Level 1 Focus:**
- Basic SELECT, INSERT, UPDATE, DELETE
- WHERE clauses with AND/OR
- Simple aggregations (COUNT, SUM, AVG)
- Basic JOIN understanding

### **Level 2 Focus:**
- Complex JOIN patterns
- Subqueries and EXISTS
- GROUP BY with HAVING
- Indexes for performance

### **Level 3 Transition:**
```sql
-- SQLite syntax
CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);

-- PostgreSQL equivalent
CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(255));

-- MSSQL equivalent  
CREATE TABLE users (id INT IDENTITY(1,1) PRIMARY KEY, name NVARCHAR(255));
```

---

## ✅ **SQLite Quick Reference Card**

### **Essential Commands:**
```sql
-- File operations
.open database.db      -- Open/create database file
.tables                -- List all tables
.schema table_name     -- Show table structure
.mode column           -- Better output formatting
.headers on            -- Show column headers
.output results.txt    -- Export results to file

-- Import/Export
.import file.csv table_name -- Import CSV
.dump                   -- Export entire database as SQL
.read file.sql         -- Execute SQL from file
```

### **Common Functions:**
- `ABS(x)` - Absolute value
- `ROUND(x, y)` - Round to y decimals
- `RANDOM()` - Random number
- `COALESCE(x, y)` - First non-null value
- `NULLIF(x, y)` - NULL if x=y, else x
- `IFNULL(x, y)` - y if x is NULL

---

## 🎯 **When to Use SQLite**

### **Perfect Scenarios:**
✅ **Learning & Education** - Zero setup, immediate practice  
✅ **Mobile Applications** - Built into iOS/Android  
✅ **Prototyping** - Quick proof of concepts  
✅ **Small Websites** - Low to medium traffic  
✅ **Embedded Systems** - IoT devices, appliances  
✅ **Testing** - Isolated test databases  

### **Consider Other Platforms When:**
❌ **High Concurrency** - Many simultaneous writers  
❌ **Enterprise Features** - Stored procedures, advanced security  
❌ **Complex Data Types** - Native JSON, geospatial  
❌ **Team Collaboration** - Multiple developers need shared instance  

---

## 🔄 **Migration Ready Patterns**

### **SQLite → PostgreSQL/MSSQL Compatibility Tips:**
```sql
-- Use standard SQL when possible
-- Instead of SQLite-specific:
SELECT * FROM t LIMIT 10 OFFSET 20;

-- Use ANSI SQL for easier migration:
SELECT * FROM t FETCH FIRST 10 ROWS ONLY OFFSET 20 ROWS;

-- Avoid SQLite date handling quirks
-- SQLite (works but non-standard):
INSERT INTO events (date) VALUES ('2024-01-15');

-- Better (explicit function):
INSERT INTO events (date) VALUES (DATE('2024-01-15'));
```

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

*SQLite Cheatsheet v1.0 - Your factory floor reference for browser-based SQL learning.*
