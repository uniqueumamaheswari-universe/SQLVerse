# 🗄️ Schema Anchor – E‑Store Self Join

**Database:** `level1_estore_self_join.db`  
**Purpose:** Employee hierarchy and product series (used for self‑join demonstrations).

---

## Tables

### `employees`

| Column | Type | Description |
|--------|------|-------------|
| `employee_id` | INTEGER | Primary key |
| `name` | TEXT | Employee full name |
| `manager_id` | INTEGER | Foreign key to `employees.employee_id` (self‑reference) |

### `products`

| Column | Type | Description |
|--------|------|-------------|
| `product_id` | INTEGER | Primary key |
| `product_name` | TEXT | Name of the product |
| `price` | REAL | Price in INR |
| `series_id` | INTEGER | Foreign key to `product_series.series_id` |

### `product_series`

| Column | Type | Description |
|--------|------|-------------|
| `series_id` | INTEGER | Primary key |
| `series_name` | TEXT | Name of the product series |

---

## Relationships

- `employees` self‑join on `manager_id` → `employee_id` (hierarchy)
- `product_series` (1) ←→ (M) `products` (one‑to‑many)

> 💡 Use this database for self‑join examples: employee‑manager relationships and product series comparisons.