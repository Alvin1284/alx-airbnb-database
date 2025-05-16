-- Subqueries
-- 1. Retrieve all properties with a rating greater than 4.0
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight
FROM 
    Property p
WHERE 
    (
        SELECT AVG(r.rating)
        FROM Review r
        WHERE r.property_id = p.property_id
    ) > 4.0;

-- correlated subquery
-- 2. Retrieve all users who have made more than 3 bookings
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    User u
WHERE 
    (
        SELECT COUNT(*)
        FROM Booking b
        WHERE b.user_id = u.user_id
    ) > 3;

