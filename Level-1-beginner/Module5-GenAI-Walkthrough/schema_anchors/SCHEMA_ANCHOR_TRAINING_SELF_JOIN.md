# 🗄️ Schema Anchor – Training Institution Self Join

**Database:** `training_institution_self_join.db`  
**Purpose:** Instructor mentorship hierarchy (used for self‑join demonstrations in the Training Institution domain).

---

## Tables

### `instructors`

| Column | Type | Description |
|--------|------|-------------|
| `instructor_id` | INTEGER | Primary key |
| `first_name` | TEXT | Instructor’s first name |
| `last_name` | TEXT | Instructor’s last name |
| `specialization` | TEXT | Area of expertise |
| `taught_by` | INTEGER | Foreign key to `instructors.instructor_id` (self‑reference) |

> 💡 This is a simplified version of the Training Institution schema, focused on the self‑join relationship (instructor → mentor). The full Training Institution schema (with students, courses, enrollments, payments) is already covered by the generic anchor `SCHEMA_ANCHOR_TRAINING_INSTITUTION_SAMPLE.md`.

---

## Self‑Join Relationship

- `instructors` self‑join on `taught_by` → `instructor_id` (mentor → junior instructor)

> 💡 Use this database to demonstrate mentor hierarchies: “Which instructor taught which other instructor?”