

## ⚡ **MS SQL Server Cheatsheet: Azure Axis**

### 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost

---

## 🏢 **The Browser Office: Tab 6 - The Operations Floor**

**Tab 6: The Operations Floor**  
*⚡ Azure Axis - The enterprise operations nerve center*

**🚀 Kickstart: Any Computer, Any Browser, Anytime.**  
**🌍 Destination: Any country, Any city, Any Platform.**

**Your enterprise-grade, Microsoft-integrated database powerhouse.**  
Race through corporate data with lightning speed, deep Windows integration, and enterprise-grade reliability. The backbone of Fortune 500 data operations.

---

## 📋 **Core MSSQL Characteristics**

| Aspect | SQL Server Implementation | Enterprise Advantage |
| :--- | :--- | :--- |
| **Architecture** | Thread-based, Windows-integrated | Deep OS integration, performance |
| **Concurrency** | Lock-based with isolation levels | Predictable, controlled access |
| **Typing** | Rich type system with CLR integration | .NET type compatibility |
| **Ecosystem** | Full Microsoft stack integration | BI, Reporting, Analytics suite |
| **Best For** | Enterprise applications, Windows shops, BI | Corporate environments |

---

## 🔤 **Essential T-SQL Syntax Reference**

### **Data Types (Enterprise-Grade):**
```sql
-- Exact numerics
INT, BIGINT, SMALLINT, TINYINT          -- Integer types
DECIMAL(p,s), NUMERIC(p,s)              -- Exact decimals
MONEY, SMALLMONEY                       -- Currency (avoid for new work)

-- Approximate numerics
FLOAT(n), REAL                          -- Floating point

-- Character strings
CHAR(n), VARCHAR(n), VARCHAR(MAX)       -- Fixed/variable length
TEXT (deprecated)                       -- Use VARCHAR(MAX)

-- Unicode strings
NCHAR(n), NVARCHAR(n), NVARCHAR(MAX)    -- Unicode support
NTEXT (deprecated)                      -- Use NVARCHAR(MAX)

-- Date and time
DATE, TIME, DATETIME, DATETIME2         -- Date/time types
DATETIMEOFFSET                          -- Timezone-aware
SMALLDATETIME                           -- Legacy, limited precision

-- Specialized types
UNIQUEIDENTIFIER                        -- GUIDs
HIERARCHYID                             -- Hierarchical data
XML                                     -- XML documents
GEOMETRY, GEOGRAPHY                     -- Spatial data
ROWVERSION                              -- Automatic versioning
```

### **Table Operations with T-SQL Features:**
```sql
-- Create table with T-SQL specific features
CREATE TABLE dbo.Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(255) UNIQUE,
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID),
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    HireDate DATE DEFAULT GETDATE(),
    ManagerID INT NULL REFERENCES Employees(EmployeeID),
    CreatedDate DATETIME2 DEFAULT SYSUTCDATETIME(),
    ModifiedDate DATETIME2 DEFAULT SYSUTCDATETIME(),
    RowVersion ROWVERSION
);

-- Create table with filegroup specification
CREATE TABLE dbo.LargeTable (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
    Data NVARCHAR(MAX),
    CreatedDate DATETIME2
) ON [PRIMARY] TEXTIMAGE_ON [SECONDARY];

-- Create temporal table (SQL Server 2016+)
CREATE TABLE dbo.EmployeeHistory (
    EmployeeID INT NOT NULL,
    Name NVARCHAR(100) NOT NULL,
    Position NVARCHAR(50),
    Salary DECIMAL(10,2),
    ValidFrom DATETIME2 GENERATED ALWAYS AS ROW START,
    ValidTo DATETIME2 GENERATED ALWAYS AS ROW END,
    PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo)
) WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.EmployeeHistoryArchive));

-- Create computed column
CREATE TABLE dbo.Products (
    ProductID INT IDENTITY PRIMARY KEY,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    TotalPrice AS (Quantity * UnitPrice) PERSISTED
);
```

### **T-SQL CRUD Operations:**
```sql
-- INSERT with OUTPUT clause
INSERT INTO dbo.Employees (FirstName, LastName, Email, Salary)
OUTPUT inserted.EmployeeID, inserted.CreatedDate
VALUES ('John', 'Doe', 'john.doe@company.com', 75000.00);

-- INSERT multiple rows (2008+)
INSERT INTO dbo.Products (ProductName, CategoryID, UnitPrice)
VALUES 
    ('Laptop', 1, 999.99),
    ('Mouse', 1, 29.99),
    ('Keyboard', 1, 79.99);

-- MERGE statement (UPSERT)
MERGE dbo.CustomerTarget AS Target
USING dbo.CustomerSource AS Source
ON Target.CustomerID = Source.CustomerID
WHEN MATCHED THEN
    UPDATE SET 
        Target.Name = Source.Name,
        Target.Email = Source.Email,
        Target.ModifiedDate = GETDATE()
WHEN NOT MATCHED BY TARGET THEN
    INSERT (CustomerID, Name, Email, CreatedDate)
    VALUES (Source.CustomerID, Source.Name, Source.Email, GETDATE())
WHEN NOT MATCHED BY SOURCE THEN
    DELETE
OUTPUT $action, inserted.*, deleted.*;

-- UPDATE with FROM clause
UPDATE e
SET e.Salary = e.Salary * 1.10,
    e.ModifiedDate = GETDATE()
FROM dbo.Employees e
INNER JOIN dbo.Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Engineering';

-- DELETE with OUTPUT
DELETE FROM dbo.AuditLog
OUTPUT deleted.*
WHERE CreatedDate < DATEADD(YEAR, -1, GETDATE());
```

---

## 🎯 **T-SQL Specific Features**

### **Stored Procedures:**
```sql
-- Create stored procedure
CREATE OR ALTER PROCEDURE dbo.GetEmployeeSales
    @EmployeeID INT,
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        e.FirstName + ' ' + e.LastName AS EmployeeName,
        COUNT(o.OrderID) AS OrderCount,
        SUM(o.TotalAmount) AS TotalSales
    FROM dbo.Employees e
    INNER JOIN dbo.Orders o ON e.EmployeeID = o.EmployeeID
    WHERE e.EmployeeID = @EmployeeID
      AND o.OrderDate BETWEEN @StartDate AND @EndDate
    GROUP BY e.FirstName, e.LastName;
    
    RETURN @@ROWCOUNT;
END;

-- Execute with parameters
EXEC dbo.GetEmployeeSales 
    @EmployeeID = 123,
    @StartDate = '2024-01-01',
    @EndDate = '2024-12-31';

-- Stored procedure with OUTPUT parameter
CREATE PROCEDURE dbo.GetEmployeeCount
    @DepartmentID INT,
    @EmployeeCount INT OUTPUT
AS
BEGIN
    SELECT @EmployeeCount = COUNT(*)
    FROM dbo.Employees
    WHERE DepartmentID = @DepartmentID;
END;

-- Execute with OUTPUT parameter
DECLARE @Count INT;
EXEC dbo.GetEmployeeCount @DepartmentID = 5, @EmployeeCount = @Count OUTPUT;
SELECT @Count AS EmployeeCount;
```

### **Functions:**
```sql
-- Scalar function
CREATE FUNCTION dbo.CalculateBonus
    (@Salary DECIMAL(10,2), @PerformanceRating INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @Bonus DECIMAL(10,2);
    
    IF @PerformanceRating >= 4
        SET @Bonus = @Salary * 0.15;
    ELSE IF @PerformanceRating >= 3
        SET @Bonus = @Salary * 0.10;
    ELSE
        SET @Bonus = @Salary * 0.05;
    
    RETURN @Bonus;
END;

-- Table-valued function
CREATE FUNCTION dbo.GetDepartmentEmployees
    (@DepartmentID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        EmployeeID,
        FirstName + ' ' + LastName AS FullName,
        Email,
        HireDate
    FROM dbo.Employees
    WHERE DepartmentID = @DepartmentID
      AND Active = 1
);

-- Use table-valued function
SELECT * FROM dbo.GetDepartmentEmployees(5);
```

### **Triggers:**
```sql
-- AFTER INSERT trigger
CREATE TRIGGER dbo.trg_EmployeeAudit
ON dbo.Employees
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO dbo.EmployeeAudit (
            EmployeeID, Action, ChangedBy, ChangedDate
        )
        SELECT 
            i.EmployeeID,
            CASE 
                WHEN d.EmployeeID IS NULL THEN 'INSERT'
                ELSE 'UPDATE'
            END,
            SUSER_SNAME(),
            GETDATE()
        FROM inserted i
        LEFT JOIN deleted d ON i.EmployeeID = d.EmployeeID;
    END
    ELSE
    BEGIN
        INSERT INTO dbo.EmployeeAudit (
            EmployeeID, Action, ChangedBy, ChangedDate
        )
        SELECT 
            d.EmployeeID,
            'DELETE',
            SUSER_SNAME(),
            GETDATE()
        FROM deleted d;
    END
END;

-- INSTEAD OF trigger
CREATE TRIGGER dbo.trg_InsteadOfDelete
ON dbo.ImportantData
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE dbo.ImportantData
    SET IsDeleted = 1,
        DeletedDate = GETDATE()
    WHERE ID IN (SELECT ID FROM deleted);
    
    RAISERROR('Records marked as deleted instead of physically removed.', 10, 1);
END;
```

---

## ⚡ **Performance & Optimization**

### **Indexing Strategies:**
```sql
-- Clustered index (controls physical order)
CREATE CLUSTERED INDEX idx_Orders_OrderDate 
ON dbo.Orders(OrderDate);

-- Non-clustered index
CREATE NONCLUSTERED INDEX idx_Employees_DepartmentID
ON dbo.Employees(DepartmentID)
INCLUDE (FirstName, LastName, Email);

-- Filtered index (SQL Server 2008+)
CREATE NONCLUSTERED INDEX idx_Active_Employees
ON dbo.Employees(DepartmentID, LastName)
WHERE Active = 1;

-- Columnstore index (analytics)
CREATE COLUMNSTORE INDEX idx_CS_Sales
ON dbo.Sales(ProductID, CustomerID, SaleDate, Quantity, Amount);

-- Index with options
CREATE UNIQUE NONCLUSTERED INDEX idx_Unique_Email
ON dbo.Employees(Email)
WITH (
    FILLFACTOR = 70,
    ONLINE = ON,  -- Enterprise edition
    DATA_COMPRESSION = PAGE
);

-- Index maintenance
ALTER INDEX ALL ON dbo.Employees REBUILD;
ALTER INDEX idx_Employees_DepartmentID ON dbo.Employees REORGANIZE;
UPDATE STATISTICS dbo.Employees WITH FULLSCAN;
```

### **Query Analysis & Execution Plans:**
```sql
-- Show actual execution plan (SSMS)
SET SHOWPLAN_XML ON;
GO
SELECT * FROM dbo.Employees WHERE DepartmentID = 5;
GO
SET SHOWPLAN_XML OFF;

-- STATISTICS IO and TIME
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
SELECT * FROM dbo.LargeTable WHERE Status = 'Active';
SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;

-- Dynamic Management Views (DMVs)
-- Find missing indexes
SELECT 
    migs.avg_total_user_cost * (migs.avg_user_impact / 100.0) * (migs.user_seeks + migs.user_scans) AS improvement_measure,
    'CREATE INDEX [missing_index_' + CONVERT (VARCHAR, mig.index_group_handle) + '_' + CONVERT (VARCHAR, mid.index_handle) + '_' + LEFT (PARSENAME(mid.statement, 1), 32) + ']' + ' ON ' + mid.statement + ' (' + ISNULL (mid.equality_columns, '') + CASE WHEN mid.equality_columns IS NOT NULL AND mid.inequality_columns IS NOT NULL THEN ',' ELSE '' END + ISNULL (mid.inequality_columns, '') + ')' + ISNULL (' INCLUDE (' + mid.included_columns + ')', '') AS create_index_statement,
    migs.*, mid.database_id, mid.[object_id]
FROM sys.dm_db_missing_index_groups mig
INNER JOIN sys.dm_db_missing_index_group_stats migs ON migs.group_handle = mig.index_group_handle
INNER JOIN sys.dm_db_missing_index_details mid ON mig.index_handle = mid.index_handle
WHERE mid.database_id = DB_ID()
ORDER BY migs.avg_total_user_cost * migs.avg_user_impact * (migs.user_seeks + migs.user_scans) DESC;

-- Query performance stats
SELECT 
    qs.execution_count,
    qs.total_worker_time/qs.execution_count AS avg_cpu_time,
    qs.total_elapsed_time/qs.execution_count AS avg_elapsed_time,
    SUBSTRING(st.text, (qs.statement_start_offset/2)+1, 
        ((CASE qs.statement_end_offset
            WHEN -1 THEN DATALENGTH(st.text)
            ELSE qs.statement_end_offset
        END - qs.statement_start_offset)/2) + 1) AS query_text
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) st
ORDER BY qs.total_worker_time DESC;
```

---

## 🏢 **Enterprise Features**

### **Partitioning:**
```sql
-- Create partition function
CREATE PARTITION FUNCTION pf_SalesDate (DATE)
AS RANGE RIGHT FOR VALUES (
    '2024-01-01', '2024-04-01', '2024-07-01', '2024-10-01'
);

-- Create partition scheme
CREATE PARTITION SCHEME ps_SalesDate
AS PARTITION pf_SalesDate
TO ([PRIMARY], [FG_Q2], [FG_Q3], [FG_Q4], [FG_NEXT]);

-- Create partitioned table
CREATE TABLE dbo.SalesPartitioned (
    SaleID INT IDENTITY PRIMARY KEY,
    SaleDate DATE NOT NULL,
    Amount DECIMAL(10,2),
    CustomerID INT
) ON ps_SalesDate(SaleDate);

-- Query specific partition
SELECT * FROM dbo.SalesPartitioned
WHERE $PARTITION.pf_SalesDate(SaleDate) = 2;

-- Switch partition
ALTER TABLE dbo.SalesPartitioned
SWITCH PARTITION 5 TO dbo.SalesArchive;
```

### **Always On Availability Groups:**
```sql
-- Check AG status
SELECT 
    ag.name AS ag_name,
    ar.replica_server_name,
    ars.role_desc,
    ars.synchronization_health_desc,
    ars.synchronization_state_desc
FROM sys.dm_hadr_availability_group_states ags
INNER JOIN sys.availability_groups ag ON ag.group_id = ags.group_id
INNER JOIN sys.dm_hadr_availability_replica_states ars ON ars.group_id = ag.group_id
INNER JOIN sys.availability_replicas ar ON ar.replica_id = ars.replica_id;

-- Failover (execute on primary)
ALTER AVAILABILITY GROUP [AG_Name] FAILOVER;

-- Add database to AG
ALTER AVAILABILITY GROUP [AG_Name]
ADD DATABASE [YourDatabase];
```

---

## ☁️ **Azure SQL Integration**

### **Azure SQL Database Specifics:**
```sql
-- Elastic pools
-- Create in Azure Portal, then:
CREATE DATABASE [DatabaseInPool]
AS COPY OF [source_database]
SERVICE_OBJECTIVE = ELASTIC_POOL (name = [ElasticPoolName]);

-- Hyperscale features
-- Auto-scales storage, fast backups
CREATE DATABASE [HyperscaleDB]
( EDITION = 'Hyperscale', SERVICE_OBJECTIVE = 'HS_Gen5_2' );

-- Serverless compute
CREATE DATABASE [ServerlessDB]
( 
    EDITION = 'GeneralPurpose',
    SERVICE_OBJECTIVE = 'GP_S_Gen5_1',
    AUTO_PAUSE_DELAY = 60  -- Minutes of inactivity before pause
);

-- Geo-replication
-- Set up in Azure Portal, then query:
SELECT 
    database_id,
    role_desc,
    replication_state_desc
FROM sys.dm_database_copies;
```

### **Security & Compliance:**
```sql
-- Always Encrypted
-- Configure in SSMS or Azure Portal
-- Then query with Column Encryption Setting = Enabled

-- Dynamic Data Masking
ALTER TABLE dbo.Customers
ALTER COLUMN CreditCardNumber ADD MASKED WITH (FUNCTION = 'partial(0,"XXXX-XXXX-XXXX-",4)');

ALTER TABLE dbo.Employees  
ALTER COLUMN Salary ADD MASKED WITH (FUNCTION = 'random(1000, 50000)');

-- Row Level Security
CREATE SECURITY POLICY dbo.EmployeeSecurityPolicy
ADD FILTER PREDICATE dbo.fn_securitypredicate(EmployeeID) ON dbo.Employees,
ADD BLOCK PREDICATE dbo.fn_securitypredicate(EmployeeID) ON dbo.Employees
WITH (STATE = ON);

-- Transparent Data Encryption
-- Enable in Azure Portal or with:
ALTER DATABASE [YourDatabase] SET ENCRYPTION ON;
```

---

## 📊 **Business Intelligence Features**

### **Integration Services (SSIS) Patterns:**
```sql
-- Control Flow: Execute SQL Task
-- Data Flow: OLE DB Source → Lookup → Conditional Split → OLE DB Dest

-- Package configuration SQL
SELECT ConfigValue FROM dbo.SSISConfig WHERE ConfigKey = 'ConnectionString';

-- Logging
EXEC dbo.SSISLogPackageStart @PackageName = 'LoadSalesData', @ExecutionID = @ExecutionID OUTPUT;
```

### **Reporting Services (SSRS):**
```sql
-- Dataset query with parameters
SELECT 
    ProductName,
    CategoryName,
    SUM(Quantity) AS TotalQuantity,
    SUM(Amount) AS TotalAmount
FROM dbo.Sales s
INNER JOIN dbo.Products p ON s.ProductID = p.ProductID
INNER JOIN dbo.Categories c ON p.CategoryID = c.CategoryID
WHERE (@CategoryID IS NULL OR p.CategoryID = @CategoryID)
  AND SaleDate BETWEEN @StartDate AND @EndDate
GROUP BY ProductName, CategoryName
ORDER BY TotalAmount DESC;

-- MDX for Analysis Services
SELECT 
    [Measures].[Sales Amount] ON COLUMNS,
    [Product].[Category].Members ON ROWS
FROM [Sales Cube];
```

---

## 🎯 **When to Use SQL Server**

### **Perfect Scenarios:**
✅ **Enterprise Applications** - Corporate Windows environments  
✅ **Business Intelligence** - Power BI, SSRS, SSIS integration  
✅ **.NET Development** - Entity Framework, LINQ integration  
✅ **High Availability** - Always On, Failover Clustering  
✅ **Security Compliance** - TDE, Always Encrypted, Auditing  
✅ **Legacy Systems** - Existing SQL Server infrastructure  

### **Consider PostgreSQL When:**
❌ **Open Source Mandate** - No Microsoft licensing  
❌ **Linux/Unix Environment** - Non-Windows infrastructure  
❌ **JSON-Heavy Workloads** - JSONB superior performance  
❌ **Geospatial Focus** - PostGIS more comprehensive  
❌ **Cost Sensitivity** - Avoiding SQL Server licensing  

---

## 🔄 **Migration Patterns**

### **Cross-Platform Compatibility:**
```sql
-- T-SQL specific → ANSI SQL
-- Instead of:
SELECT TOP 10 * FROM Orders ORDER BY OrderDate DESC;

-- Use for compatibility:
SELECT * FROM Orders ORDER BY OrderDate DESC FETCH FIRST 10 ROWS ONLY;

-- Date functions conversion
-- T-SQL:
SELECT GETDATE(), DATEADD(DAY, 7, GETDATE()), DATEDIFF(DAY, '2024-01-01', GETDATE());

-- PostgreSQL equivalent:
SELECT NOW(), NOW() + INTERVAL '7 days', DATE_PART('day', NOW() - '2024-01-01'::DATE);

-- Identity vs Sequence
-- T-SQL:
CREATE TABLE t (id INT IDENTITY(1,1) PRIMARY KEY);

-- PostgreSQL:
CREATE TABLE t (id SERIAL PRIMARY KEY);

-- MySQL:
CREATE TABLE t (id INT AUTO_INCREMENT PRIMARY KEY);
```

---

## 📋 **Quick Reference: Essential T-SQL Functions**

### **String Functions:**
```sql
CONCAT('Hello', ' ', 'World')          -- 'Hello World'
LEFT('SQL Server', 3)                   -- 'SQL'
RIGHT('SQL Server', 6)                  -- 'Server'
SUBSTRING('SQL Server', 5, 6)           -- 'Server'
REPLACE('SQL Server', 'SQL', 'Microsoft') -- 'Microsoft Server'
LEN('SQL Server')                       -- 10
CHARINDEX('Server', 'SQL Server')       -- 5
UPPER('sql'), LOWER('SQL')              -- 'SQL', 'sql'
TRIM('  SQL Server  ')                  -- 'SQL Server'
FORMAT(1234567.89, 'N2')                -- '1,234,567.89'
```

### **Date Functions:**
```sql
GETDATE(), GETUTCDATE()                 -- Current date/time
SYSDATETIME(), SYSUTCDATETIME()         -- Higher precision
DATEADD(DAY, 7, GETDATE())              -- Add 7 days
DATEDIFF(DAY, '2024-01-01', GETDATE())  -- Days difference
DATEPART(YEAR, GETDATE())               -- Extract year
DATENAME(MONTH, GETDATE())              -- Month name
EOMONTH(GETDATE())                      -- End of month
ISDATE('2024-01-15')                    -- Check if valid date
FORMAT(GETDATE(), 'yyyy-MM-dd HH:mm:ss') -- Format date
```

### **System Functions:**
```sql
@@VERSION                              -- SQL Server version
@@SERVERNAME                           -- Server name
DB_NAME()                              -- Current database
USER_NAME()                            -- Current user
HOST_NAME()                            -- Client computer name
APP_NAME()                             -- Application name
NEWID()                                -- Generate GUID
ROW_NUMBER() OVER (ORDER BY column)    -- Row number
RANK() OVER (PARTITION BY col ORDER BY col2) -- Rank within group
```

---

## 🏁 **Performance Racing Tips**

### **Query Tuning Checklist:**
1. ✅ Use `SET NOCOUNT ON` in stored procedures
2. ✅ Avoid functions on indexed columns in WHERE clause
3. ✅ Use `EXISTS()` instead of `IN()` for subqueries
4. ✅ Implement proper indexing strategy
5. ✅ Use `OPTION (RECOMPILE)` for parameter sniffing issues
6. ✅ Consider `WITH (NOLOCK)` for read-only reporting (understand risks)
7. ✅ Use temp tables for complex multi-step operations
8. ✅ Implement pagination with `OFFSET-FETCH` instead of `TOP`

### **Monitoring Queries:**
```sql
-- Current activity
EXEC sp_who2;
EXEC sp_lock;

-- Blocking chains
SELECT 
    blocking.session_id AS blocking_session_id,
    blocked.session_id AS blocked_session_id,
    blocking_text.text AS blocking_text,
    blocked_text.text AS blocked_text
FROM sys.dm_exec_requests blocked
INNER JOIN sys.dm_exec_requests blocking ON blocked.blocking_session_id = blocking.session_id
CROSS APPLY sys.dm_exec_sql_text(blocked.sql_handle) blocked_text
CROSS APPLY sys.dm_exec_sql_text(blocking.sql_handle) blocking_text
WHERE blocked.blocking_session_id > 0;
```

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

*MS SQL Server Cheatsheet v1.0 - Your operations floor reference for enterprise data velocity.*



