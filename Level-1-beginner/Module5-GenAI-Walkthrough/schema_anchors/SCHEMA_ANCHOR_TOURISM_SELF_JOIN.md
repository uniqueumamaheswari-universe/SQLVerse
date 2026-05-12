# 🗄️ Schema Anchor – Tourism Self Join

**Database:** `tourism_planet_self_join.db`  
**Purpose:** Tour packages, guide mentorship, and customer referrals (used for self‑join practice).

---

## Tables

### `tours`

| Column | Type | Description |
|--------|------|-------------|
| `tour_id` | INTEGER | Primary key |
| `tour_name` | TEXT | Name of the tour |
| `parent_tour_id` | INTEGER | Foreign key to `tours.tour_id` (self‑reference for package tours) |
| `duration_days` | INTEGER | Length of tour in days |
| `base_price` | REAL | Price in INR |

### `guides`

| Column | Type | Description |
|--------|------|-------------|
| `guide_id` | INTEGER | Primary key |
| `first_name` | TEXT | Guide’s first name |
| `last_name` | TEXT | Guide’s last name |
| `mentor_id` | INTEGER | Foreign key to `guides.guide_id` (self‑reference for mentorship) |
| `years_experience` | INTEGER | Years of experience |
| `specialization` | TEXT | Area of expertise |
| `rating` | REAL | Average rating (0–5) |

### `customers`

| Column | Type | Description |
|--------|------|-------------|
| `customer_id` | INTEGER | Primary key |
| `first_name` | TEXT | Customer’s first name |
| `last_name` | TEXT | Customer’s last name |
| `booked_under` | INTEGER | Foreign key to `customers.customer_id` (self‑reference for family bookings) |
| `relationship` | TEXT | 'Primary', 'Spouse', 'Child', etc. |
| `age` | INTEGER | Age in years |
| `loyalty_points` | INTEGER | Points earned |

### `bookings`

| Column | Type | Description |
|--------|------|-------------|
| `booking_id` | INTEGER | Primary key |
| `primary_customer_id` | INTEGER | Foreign key to `customers.customer_id` |
| `suite_type` | TEXT | '2 Bedroom Suite', '3 Bedroom Suite', etc. |
| `check_in_date` | DATE | Check‑in date |
| `check_out_date` | DATE | Check‑out date |
| `total_guests` | INTEGER | Number of guests |
| `total_amount` | REAL | Total amount paid |

### `booking_tours`

| Column | Type | Description |
|--------|------|-------------|
| `booking_tour_id` | INTEGER | Primary key |
| `booking_id` | INTEGER | Foreign key to `bookings.booking_id` |
| `tour_id` | INTEGER | Foreign key to `tours.tour_id` |
| `number_of_people` | INTEGER | Number of people taking this tour |

---

## Relationships

- `tours` self‑join on `parent_tour_id` → `tour_id` (package → sub‑tours)
- `guides` self‑join on `mentor_id` → `guide_id` (senior → junior)
- `customers` self‑join on `booked_under` → `customer_id` (primary booker → dependents)
- `bookings` (1) ←→ (M) `booking_tours` (one‑to‑many)
- `tours` (1) ←→ (M) `booking_tours` (one‑to‑many)

> 💡 Use this database for self‑join practice across three different domains: tourism packages, guide mentorship, and family bookings.