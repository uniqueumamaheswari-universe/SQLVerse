
**"The Tethers of the SQLVerse"**

If we shatter our data into different tables, how do we make sure they stay connected? We use **Foreign Keys**.

### ⚓ The Anchor: Primary Key (PK)
A Primary Key (like `category_id`) is the **unique ID** in the home table. It is the "Source of Truth."

### 🔗 The Tether: Foreign Key (FK)
A Foreign Key is that same ID "visiting" another table. 
* In the `categories` table, `category_id` is the **Primary Key**.
* In the `products` table, `category_id` is a **Foreign Key**.



### 🛡️ Referential Integrity: The Safety Net
This is a set of rules the database enforces to prevent "Orphaned Data."
* **The Rule:** You cannot add a product with `category_id = 99` if category 99 doesn't exist in the Categories table.
* **The Guardrail:** You cannot delete a category if there are still products linked to it. 

**This ensures the bridges (Joins) you build in Module 4 will never lead to a "404 Not Found" destination.**