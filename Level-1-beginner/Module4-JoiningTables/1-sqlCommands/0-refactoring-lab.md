This folder structure is **immaculate**. It perfectly balances the "Architectural" theory with the "Artisan" execution. 

### 🧐 Structural Critique & Minor Tweaks
I have only **two very small suggestions** to make this 100% bulletproof for a student:

1.  **The "Big Reveal" Sequence:** In `1-sqlCommands`, I would suggest numbering the files so the student knows exactly which "bridge" to cross first.
2.  **Naming Consistency:** In `2-practiceExercises`, I’d add a `0-` prefix to the `normalization-practice` to match the `0-refactoring-lab` in the theory section. This creates a "Mirror Effect" where the student knows the labs are the core milestones.

---

## 🏗️ The Refactoring Lab: "The Evolution of the E‑Store"
**File:** `1-sqlCommands/🧪 0-refactoring-lab.md`

This lab is the "Big Reveal." We are going to take the "Flat" table the student has used since Module 1 and **shatter it** into a professional relational structure.

### 🏛️ Phase 1: The Architect’s Observation
Look at your current `products` table. Notice the **Redundancy**:
* The word "Electronics" is repeated for every gadget.
* The word "Appliances" is repeated for every machine.
* **The Risk:** If you type "Electonrics" once, your Module 3 reports will be wrong.

### 🔨 Phase 2: Deconstruction (The Split)
We will now create a dedicated `categories` table and move the names there.

#### **Step 1: Create the new Category Vault**
```sql
CREATE TABLE categories (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT,
    category_name TEXT NOT NULL UNIQUE
);
```

#### **Step 2: Migrate the Data (The Seed)**
We pull the unique names from your old table into the new one.
```sql
INSERT INTO categories (category_name)
SELECT DISTINCT category FROM products;
```

### 🔗 Phase 3: The Connection (The Foreign Key)
Now we must prepare the `products` table to "talk" to the new categories.

#### **Step 3: Add the Link Column**
```sql
ALTER TABLE products ADD COLUMN category_id INTEGER;
```

#### **Step 4: The Mapping (The "Brain" Work)**
We tell the database: "Look at the name in the products table, find the ID in the categories table, and put that ID in the new column."
```sql
UPDATE products
SET category_id = (
    SELECT c.category_id 
    FROM categories c 
    WHERE c.category_name = products.category
);
```

### 🧹 Phase 4: Removing the Scaffolding
In a real professional environment, we would now drop the old `category` text column from the `products` table because it is **redundant**. 

> ⚠️ **Artisan Note:** In SQLite, "dropping a column" is tricky, so for this lab, we will simply **ignore** the old text column and start using `category_id` for our Joins.

---

## 🔍 The Big Reveal: Your First JOIN
**Business Question:** "Show me all product names and their category names."

Because the text name is no longer in the products table (conceptually), we must **BRIDGE** the tables:

```sql
SELECT p.product_name, c.category_name
FROM products p
JOIN categories c ON p.category_id = c.category_id;
```



---

### 🧠 The Artisan's Reflection
You have just transitioned from a **spreadsheet user** to a **Database Architect**. You are no longer just storing text; you are managing **relationships**.

**Would you like me to move on to drafting the "INNER JOIN" concept file (📘 2-InnerJoin.md), or shall we refine the logic for the "Multiple Tables" web?**



### 🔨 Drafting: 🧪 0-refactoring-lab.md (The E-Store Transformation)

This is the script that performs the **"Big Reveal."** We are going to guide the student through the manual process of splitting their Module 3 "Flat Table" into a professional Relational Schema.

#### **I. The Architect’s Goal**
We are transforming your `products` table from a single list into two linked tables: `products` and `categories`.

#### **II. The Execution (SQL Script)**

**Step 1: Create the new "Source of Truth" (Categories)**
```sql
CREATE TABLE categories (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT,
    category_name TEXT NOT NULL UNIQUE
);
```

**Step 2: Seed the Data**
```sql
INSERT INTO categories (category_name)
SELECT DISTINCT category FROM products;
```

**Step 3: Prepare the Link in the Products Table**
```sql
ALTER TABLE products ADD COLUMN category_id INTEGER;
```

**Step 4: The Logic Bridge (The Update)**
```sql
UPDATE products
SET category_id = (
    SELECT c.category_id 
    FROM categories c 
    WHERE c.category_name = products.category
);
```

#### **III. The Plot Twist: The Training Institution**
While the lab uses the E-Store, your **0-normalization-practice.md** will challenge you with a **Training Institution** dataset. You will have to apply these same steps to split a "Flat Class List" into `Students`, `Courses`, and `Departments`.



---



## ⚓ The Tethers of the SQLVerse

If we shatter our data into different tables, how do we make sure they stay connected? We use **Foreign Keys**.

### ⚓ The Anchor: Primary Key (PK)
A Primary Key (like `category_id`) is the **unique ID** in the home table. It is the “Source of Truth.”

### 🔗 The Tether: Foreign Key (FK)
A Foreign Key is that same ID “visiting” another table.  
- In the `categories` table, `category_id` is the **Primary Key**.  
- In the `products` table, `category_id` is a **Foreign Key**.

### 🛡️ Referential Integrity: The Safety Net
This is a set of rules the database enforces to prevent “Orphaned Data.”
- **The Rule:** You cannot add a product with `category_id = 99` if category 99 doesn’t exist in the Categories table.
- **The Guardrail:** You cannot delete a category if there are still products linked to it.

**This ensures the bridges (Joins) you build in Module 4 will never lead to a “404 Not Found” destination.**

