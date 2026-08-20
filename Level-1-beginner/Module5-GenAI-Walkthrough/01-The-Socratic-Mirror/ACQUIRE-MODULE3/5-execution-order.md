### ⚡ The Logical Execution Hierarchy

To avoid the single most common mistake in SQL analysis—trying to filter aggregate functions inside a `WHERE` clause—you must internalize the exact order in which the database engine processes your code:

1. FROM       ──> Identifies source tables
2. JOIN       ──> Links related tables together
3. WHERE      ──> Filters individual RAW rows (BEFORE aggregation)
4. GROUP BY   ──> Collapses rows into dimensional buckets
5. HAVING     ──> Filters SUMMARY buckets (AFTER aggregation)
6. SELECT     ──> Projects requested columns & calculates expressions
7. ORDER BY   ──> Sorts the final filtered summary output
