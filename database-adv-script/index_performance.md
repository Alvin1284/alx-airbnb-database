# Query Performance and Indexes

## Before Index Query
-- Query without index:
-- EXPLAIN SELECT * FROM Booking b
JOIN User u ON b.user_id = u.user_id
WHERE b.start_date >= '2025-06-01' AND b.end_date <= '2025-06-30';
