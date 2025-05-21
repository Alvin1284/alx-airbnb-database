-- Indexes for User table
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON User(role);

-- Indexes for Property table
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(pricepernight);

-- Indexes for Booking table
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_user_property ON Booking(user_id, property_id);

-- Indexes for Review table
CREATE INDEX idx_review_property_user ON Review(property_id, user_id);
CREATE INDEX idx_review_rating ON Review(rating);

-- Indexes for Message table
CREATE INDEX idx_message_sender_recipient ON Message(sender_id, recipient_id);
CREATE INDEX idx_message_sent_at ON Message(sent_at);

-- Indexes for Payment table
CREATE INDEX idx_payment_booking ON Payment(booking_id);
CREATE INDEX idx_payment_date ON Payment(payment_date);

EXPLAIN SELECT * FROM Booking b
JOIN User u ON b.user_id = u.user_id
WHERE b.start_date >= '2025-06-01' AND b.end_date <= '2025-06-30';