-- Initial complex query
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    b.total_price,
    -- User details
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    -- Property details
    p.property_id,
    p.name as property_name,
    p.location,
    p.pricepernight,
    -- Host details
    h.first_name as host_first_name,
    h.last_name as host_last_name,
    h.email as host_email,
    -- Payment details
    py.payment_id,
    py.amount as payment_amount,
    py.payment_method,
    py.payment_date
FROM 
    booking b
    INNER JOIN user u ON b.user_id = u.user_id
    INNER JOIN property p ON b.property_id = p.property_id
    INNER JOIN user h ON p.host_id = h.user_id
    LEFT JOIN payment py ON b.booking_id = py.booking_id
ORDER BY 
    b.start_date DESC;

-- analyze performance
EXPLAIN 
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    p.property_id,
    p.name as property_name,
    p.location,
    p.pricepernight,
    h.first_name as host_first_name,
    h.last_name as host_last_name,
    h.email as host_email,
    py.payment_id,
    py.amount as payment_amount,
    py.payment_method,
    py.payment_date
FROM 
    booking b
    INNER JOIN user u ON b.user_id = u.user_id
    INNER JOIN property p ON b.property_id = p.property_id
    INNER JOIN user h ON p.host_id = h.user_id
    LEFT JOIN payment py ON b.booking_id = py.booking_id
ORDER BY 
    b.start_date DESC;

-- Optimized query with specific columns and better indexing
CREATE INDEX idx_booking_dates ON booking(start_date, end_date);
CREATE INDEX idx_booking_user ON booking(user_id);
CREATE INDEX idx_booking_property ON booking(property_id);
CREATE INDEX idx_property_host ON property(host_id);
CREATE INDEX idx_payment_booking ON payment(booking_id);

-- Optimized query
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    b.total_price,
    -- User details
    u.first_name,
    u.last_name,
    u.email,
    -- Property details
    p.name as property_name,
    p.location,
    -- Host details
    h.first_name as host_first_name,
    h.last_name as host_last_name,
    -- Payment details
    py.amount as payment_amount,
    py.payment_method
FROM 
    booking b
    INNER JOIN user u ON b.user_id = u.user_id
    INNER JOIN property p ON b.property_id = p.property_id
    INNER JOIN user h ON p.host_id = h.user_id
    LEFT JOIN payment py ON b.booking_id = py.booking_id
WHERE 
    b.start_date >= '2024-01-01' 
    AND b.start_date <= '2024-12-31'
ORDER BY 
    b.start_date DESC
LIMIT 100;

-- analyze optimized query
EXPLAIN 
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    b.total_price,
    u.first_name,
    u.last_name,
    u.email,
    p.name as property_name,
    p.location,
    h.first_name as host_first_name,
    h.last_name as host_last_name,
    py.amount as payment_amount,
    py.payment_method
FROM 
    booking b
    INNER JOIN user u ON b.user_id = u.user_id
    INNER JOIN property p ON b.property_id = p.property_id
    INNER JOIN user h ON p.host_id = h.user_id
    LEFT JOIN payment py ON b.booking_id = py.booking_id
WHERE 
    b.start_date >= '2024-01-01'
    AND b.start_date <= '2024-12-31'
ORDER BY 
    b.start_date DESC
LIMIT 100; 