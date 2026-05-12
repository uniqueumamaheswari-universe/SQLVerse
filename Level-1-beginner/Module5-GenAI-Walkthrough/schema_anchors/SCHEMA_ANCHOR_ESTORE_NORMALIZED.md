# 🗄️ Schema Anchor – Normalized E‑Store

**Database:** `level1_estore_normalized_MODULE4.db`  
**Purpose:** E‑commerce after normalisation (used for join demonstrations in Module 4 concept files).

---

## Tables

### `categories`

| Column | Type | Description |
|--------|------|-------------|
| `category_id` | INTEGER | Primary key |
| `category_name` | TEXT | e.g., 'Electronics', 'Appliances', 'Books', 'Garden', 'Toys' |

### `products`

| Column | Type | Description |
|--------|------|-------------|
| `product_id` | INTEGER | Primary key |
| `product_name` | TEXT | Name of the product |
| `price` | REAL | Price in INR |
| `category_id` | INTEGER | Foreign key to `categories.category_id` |

### `customers`

| Column | Type | Description |
|--------|------|-------------|
| `customer_id` | INTEGER | Primary key |
| `name` | TEXT | Customer full name |
| `email` | TEXT | Email address |
| `city` | TEXT | City of residence |

### `orders`

| Column | Type | Description |
|--------|------|-------------|
| `order_id` | INTEGER | Primary key |
| `customer_id` | INTEGER | Foreign key to `customers.customer_id` |
| `order_date` | DATE | Date of order |

### `order_items`

| Column | Type | Description |
|--------|------|-------------|
| `order_item_id` | INTEGER | Primary key |
| `order_id` | INTEGER | Foreign key to `orders.order_id` |
| `product_id` | INTEGER | Foreign key to `products.product_id` |
| `quantity` | INTEGER | Number of units ordered |

---

## Relationships

- `categories` (1) ←→ (M) `products` (one‑to‑many)
- `customers` (1) ←→ (M) `orders` (one‑to‑many)
- `orders` (1) ←→ (M) `order_items` (one‑to‑many)
- `products` (1) ←→ (M) `order_items` (one‑to‑many)

> 💡 This is the **normalised** version of the E‑Store. Use it for join demonstrations in Module 4 concept files.