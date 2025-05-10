-- Insert sample users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hashedpassword1', '1234567890', 'host', CURRENT_TIMESTAMP),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hashedpassword2', '0987654321', 'guest', CURRENT_TIMESTAMP),
('33333333-3333-3333-3333-333333333333', 'Carol', 'Davis', 'carol@example.com', 'hashedpassword3', '1112223333', 'admin', CURRENT_TIMESTAMP);

-- Insert sample properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 'Seaside Villa', 'A beautiful seaside villa.', 'Mombasa', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 'City Apartment', 'Modern apartment in city center.', 'Nairobi', 100.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert sample bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', '2025-06-01', '2025-06-05', 600.00, 'confirmed', CURRENT_TIMESTAMP),
('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', '2025-06-10', '2025-06-12', 200.00, 'pending', CURRENT_TIMESTAMP);

-- Insert sample payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('ccccccc1-cccc-cccc-cccc-cccccccccccc', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 600.00, CURRENT_TIMESTAMP, 'credit_card'),
('ccccccc2-cccc-cccc-cccc-cccccccccccc', 'bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 200.00, CURRENT_TIMESTAMP, 'paypal');

-- Insert sample reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('ddddddd1-dddd-dddd-dddd-dddddddddddd', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 5, 'Amazing place, loved it!', CURRENT_TIMESTAMP),
('ddddddd2-dddd-dddd-dddd-dddddddddddd', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 4, 'Great location, very clean.', CURRENT_TIMESTAMP);

-- Insert sample messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('eeeeeee1-eeee-eeee-eeee-eeeeeeeeeeee', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi, is the villa available in July?', CURRENT_TIMESTAMP),
('eeeeeee2-eeee-eeee-eeee-eeeeeeeeeeee', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Yes, it is available!', CURRENT_TIMESTAMP);
