

## 🐘 **PostgreSQL Cheatsheet: Elephantine Enterprise**

### 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost

---

## 🏢 **The Browser Office: Tab 5 - The Command Center**

**Tab 5: The Command Center**  
*🐘 Elephantine Enterprise - Your PostgreSQL cloud command hub*

**🚀 Kickstart: Any Computer, Any Browser, Anytime.**  
**🌍 Destination: Any country, Any city, Any Platform.**

**Your enterprise-grade, cloud-ready database powerhouse.**  
Scale data mountains with robust ACID compliance, extensive features, and cloud-native deployment. The open-source standard for serious applications.

---

## 📋 **Core PostgreSQL Characteristics**

| Aspect | PostgreSQL Implementation | Enterprise Advantage |
| :--- | :--- | :--- |
| **Architecture** | Process-based, client-server | Robust isolation, better crash recovery |
| **Concurrency** | MVCC (Multi-Version Concurrency Control) | High concurrent workloads |
| **Typing** | Strict, extensible type system | Data integrity, custom types |
| **Extensions** | Extensive (PostGIS, JSONB, etc.) | Specialized functionality |
| **Best For** | Web apps, geospatial, JSON documents | Production applications |

---

## 🔤 **Essential Syntax Reference**

### **Data Types (Rich & Strict):**
```sql
-- Numeric types
INTEGER, BIGINT, SMALLINT          -- Whole numbers
DECIMAL(p,s), NUMERIC(p,s)         -- Exact decimals (precision, scale)
REAL, DOUBLE PRECISION             -- Floating point
SERIAL, BIGSERIAL                  -- Auto-incrementing

-- Text types
VARCHAR(n), CHAR(n)                -- Variable/fixed length
TEXT                               -- Unlimited length
ENUM('value1', 'value2')           -- Enumerated types

-- Date/Time
DATE, TIME, TIMESTAMP              -- Date and time types
TIMESTAMPTZ                        -- Timezone-aware timestamp
INTERVAL                           -- Time intervals

-- Specialized types
JSON, JSONB                        -- JSON documents (JSONB is faster)
UUID                               : Universal Unique Identifier
INET, CIDR                         -- Network addresses
TSVECTOR, TSQUERY                  -- Full-text search
GEOMETRY, GEOGRAPHY                -- PostGIS spatial data
```

### **Table Operations with Advanced Features:**
```sql
-- Create table with comprehensive constraints
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    department_id INTEGER REFERENCES departments(id),
    salary DECIMAL(10,2) CHECK (salary > 0),
    hire_date DATE DEFAULT CURRENT_DATE,
    employment_status employment_status_enum DEFAULT 'active',
    profile JSONB,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Partitioned table (PG 10+)
CREATE TABLE sales (
    sale_id SERIAL,
    sale_date DATE NOT NULL,
    amount DECIMAL(10,2),
    region VARCHAR(50)
) PARTITION BY RANGE (sale_date);

-- Create table partition
CREATE TABLE sales_2024_q1 PARTITION OF sales
FOR VALUES FROM ('2024-01-01') TO ('2024-04-01');

-- Create index with options
CREATE INDEX idx_employees_department ON employees(department_id);
CREATE INDEX idx_employees_name_lower ON employees(LOWER(name));
CREATE UNIQUE INDEX idx_unique_email ON employees(email);
CREATE INDEX idx_employees_json ON employees USING gin(profile);
```

### **Advanced CRUD Operations:**
```sql
-- INSERT with RETURNING
INSERT INTO employees (name, email, salary) 
VALUES ('Jane Smith', 'jane@example.com', 75000.00)
RETURNING id, created_at;

-- INSERT from SELECT
INSERT INTO employee_archive 
SELECT * FROM employees 
WHERE hire_date < '2020-01-01';

-- UPDATE with JOIN
UPDATE employees e
SET salary = salary * 1.10
FROM departments d
WHERE e.department_id = d.id 
  AND d.name = 'Engineering';

-- DELETE with CTE
WITH deleted_rows AS (
    DELETE FROM log_entries 
    WHERE created_at < NOW() - INTERVAL '1 year'
    RETURNING *
)
SELECT COUNT(*) as deleted_count FROM deleted_rows;
```

---

## 🎯 **PostgreSQL-Specific Features**

### **Common Table Expressions (CTEs):**
```sql
-- Basic CTE
WITH department_stats AS (
    SELECT 
        department_id,
        COUNT(*) as employee_count,
        AVG(salary) as avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT * FROM department_stats WHERE employee_count > 5;

-- Recursive CTE (hierarchical data)
WITH RECURSIVE org_chart AS (
    -- Anchor member
    SELECT id, name, manager_id, 1 as level
    FROM employees
    WHERE manager_id IS NULL
    
    UNION ALL
    
    -- Recursive member
    SELECT e.id, e.name, e.manager_id, oc.level + 1
    FROM employees e
    INNER JOIN org_chart oc ON e.manager_id = oc.id
)
SELECT * FROM org_chart ORDER BY level, name;
```

### **Window Functions:**
```sql
-- Ranking
SELECT 
    name,
    department,
    salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) as dept_rank,
    ROW_NUMBER() OVER (ORDER BY salary DESC) as overall_rank,
    NTILE(4) OVER (ORDER BY salary) as salary_quartile
FROM employees;

-- Running totals
SELECT 
    order_date,
    amount,
    SUM(amount) OVER (ORDER BY order_date) as running_total,
    AVG(amount) OVER (ORDER BY order_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) as weekly_avg
FROM sales;

-- First/last value
SELECT 
    product_id,
    sale_date,
    amount,
    FIRST_VALUE(amount) OVER (PARTITION BY product_id ORDER BY sale_date) as first_sale,
    LAST_VALUE(amount) OVER (PARTITION BY product_id ORDER BY sale_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as latest_sale
FROM product_sales;
```

### **JSON/JSONB Operations:**
```sql
-- Create table with JSONB
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    attributes JSONB,
    tags JSONB
);

-- Insert JSON data
INSERT INTO products (name, attributes, tags) VALUES (
    'Laptop',
    '{"brand": "Dell", "ram": "16GB", "storage": "512GB SSD"}',
    '["electronics", "computers", "portable"]'
);

-- Query JSON data
SELECT 
    name,
    attributes->>'brand' as brand,
    attributes->>'ram' as memory,
    (attributes->>'storage')::TEXT as storage
FROM products;

-- JSON operators
SELECT * FROM products WHERE attributes @> '{"brand": "Dell"}';
SELECT * FROM products WHERE tags ? 'electronics';
SELECT * FROM products WHERE attributes->>'ram' = '16GB';

-- JSON functions
SELECT jsonb_pretty(attributes) FROM products;
SELECT jsonb_array_length(tags) as tag_count FROM products;
UPDATE products SET attributes = jsonb_set(attributes, '{ram}', '"32GB"') WHERE id = 1;
```

---

## 🔗 **Advanced Joins & Set Operations**

```sql
-- LATERAL JOIN (correlated subquery in FROM)
SELECT 
    d.name as department,
    emp.name as top_earner,
    emp.salary
FROM departments d
CROSS JOIN LATERAL (
    SELECT name, salary
    FROM employees e
    WHERE e.department_id = d.id
    ORDER BY salary DESC
    LIMIT 3
) emp;

-- FULL OUTER JOIN with COALESCE
SELECT 
    COALESCE(e.name, 'No employee') as employee,
    COALESCE(d.name, 'No department') as department
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.id;

-- INTERSECT and EXCEPT
-- Employees in both Engineering and Sales
(SELECT employee_id FROM department_assignments WHERE department = 'Engineering')
INTERSECT
(SELECT employee_id FROM department_assignments WHERE department = 'Sales');

-- Employees only in Engineering
(SELECT employee_id FROM department_assignments WHERE department = 'Engineering')
EXCEPT
(SELECT employee_id FROM department_assignments WHERE department = 'Sales');
```

---

## 🏔️ **Performance & Optimization**

### **Index Types:**
```sql
-- B-tree (default)
CREATE INDEX idx_employees_name ON employees(name);

-- Hash (equality only)
CREATE INDEX idx_employees_email_hash ON employees USING hash(email);

-- GiST (geometric, full-text)
CREATE INDEX idx_locations_geom ON locations USING gist(geometry);

-- GIN (array, JSONB, full-text)
CREATE INDEX idx_products_tags ON products USING gin(tags);
CREATE INDEX idx_products_attributes ON products USING gin(attributes);

-- BRIN (large tables, sorted data)
CREATE INDEX idx_sales_date_brin ON sales USING brin(sale_date);

-- Partial index
CREATE INDEX idx_active_employees ON employees(name) WHERE active = true;

-- Expression index
CREATE INDEX idx_employees_name_lower ON employees(LOWER(name));
```

### **Query Analysis:**
```sql
-- EXPLAIN for query plan
EXPLAIN SELECT * FROM employees WHERE department_id = 5;

-- EXPLAIN ANALYZE for actual performance
EXPLAIN ANALYZE SELECT * FROM employees WHERE department_id = 5;

-- Analyze table statistics
ANALYZE employees;
VACUUM ANALYZE employees;  -- Clean up and analyze

-- Show query activity
SELECT * FROM pg_stat_activity;
SELECT * FROM pg_stat_user_tables;

-- Find slow queries
SELECT query, calls, total_time, mean_time
FROM pg_stat_statements
ORDER BY mean_time DESC
LIMIT 10;
```

---

## ☁️ **Cloud & Deployment Features**

### **Connection String Format:**
```bash
# Neon.tech format
postgresql://username:password@ep-cool-darkness-123456.us-east-2.aws.neon.tech/dbname?sslmode=require

# Standard format
host=ep-cool-darkness-123456.us-east-2.aws.neon.tech
port=5432
dbname=dbname
user=username
password=password
sslmode=require
```

### **Backup & Restore:**
```bash
# pg_dump for backup
pg_dump -h localhost -U username dbname > backup.sql

# pg_dumpall for all databases
pg_dumpall -h localhost -U username > alldbs.sql

# pg_restore for binary format
pg_dump -Fc dbname > backup.custom
pg_restore -d dbname backup.custom

# psql for restore
psql -h localhost -U username dbname < backup.sql
```

---

## 📊 **Monitoring & Maintenance**

### **Key System Views:**
```sql
-- Table statistics
SELECT schemaname, tablename, n_live_tup, n_dead_tup
FROM pg_stat_user_tables;

-- Index usage
SELECT schemaname, tablename, indexname, idx_scan, idx_tup_read, idx_tup_fetch
FROM pg_stat_user_indexes;

-- Database size
SELECT pg_database.datname, pg_size_pretty(pg_database_size(pg_database.datname)) AS size
FROM pg_database;

-- Table size with indexes
SELECT 
    tablename,
    pg_size_pretty(pg_total_relation_size(quote_ident(tablename))) as total_size,
    pg_size_pretty(pg_relation_size(quote_ident(tablename))) as table_size,
    pg_size_pretty(pg_total_relation_size(quote_ident(tablename)) - pg_relation_size(quote_ident(tablename))) as index_size
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY pg_total_relation_size(quote_ident(tablename)) DESC;
```

---

## 🎯 **When to Use PostgreSQL**

### **Perfect Scenarios:**
✅ **Web Applications** - Robust, scalable backend  
✅ **Geospatial Data** - PostGIS extension excellence  
✅ **JSON Documents** - JSONB with indexing  
✅ **Complex Queries** - Advanced SQL features  
✅ **Open Source Projects** - No licensing costs  
✅ **Data Warehousing** - With Citus extension  

### **Consider MSSQL When:**
❌ **Windows Ecosystem** - Deep .NET integration needed  
❌ **Enterprise BI** - Power BI, SSRS, SSIS required  
❌ **Corporate Policy** - Microsoft stack mandate  
❌ **Legacy Integration** - Existing MSSQL infrastructure  

---

## 🔄 **Migration Patterns**

### **SQLite → PostgreSQL:**
```sql
-- SQLite
CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);

-- PostgreSQL equivalent
CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(255));

-- Migration functions
CREATE OR REPLACE FUNCTION migrate_sqlite_date(sqlite_date TEXT)
RETURNS DATE AS $$
BEGIN
    RETURN sqlite_date::DATE;
EXCEPTION
    WHEN others THEN
        RETURN NULL;
END;
$$ LANGUAGE plpgsql;
```

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

*PostgreSQL Cheatsheet v1.0 - Your command center reference for scaling data mountains.*
