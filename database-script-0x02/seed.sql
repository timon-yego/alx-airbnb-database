-- Populating User table with sample data
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('uuid-001', 'John', 'Doe', 'john.doe@example.com', 'hashed_password1', '1234567890', 'guest', CURRENT_TIMESTAMP),
('uuid-002', 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password2', '0987654321', 'host', CURRENT_TIMESTAMP),
('uuid-003', 'Admin', 'User', 'admin@example.com', 'hashed_password3', NULL, 'admin', CURRENT_TIMESTAMP);

-- Populating Property table with sample data
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('uuid-101', 'uuid-002', 'Cozy Cottage', 'A beautiful cottage in the countryside.', 'Countryside, Kenya', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('uuid-102', 'uuid-002', 'City Apartment', 'A modern apartment in the city center.', 'City Center, Kenya', 200.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Populating Booking table with sample data
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('uuid-201', 'uuid-101', 'uuid-001', '2024-12-01', '2024-12-05', 600.00, 'confirmed', CURRENT_TIMESTAMP),
('uuid-202', 'uuid-102', 'uuid-001', '2024-12-10', '2024-12-15', 1000.00, 'pending', CURRENT_TIMESTAMP);

-- Populating Payment table with sample data
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('uuid-301', 'uuid-201', 600.00, CURRENT_TIMESTAMP, 'credit_card'),
('uuid-302', 'uuid-202', 1000.00, CURRENT_TIMESTAMP, 'paypal');

-- Populating Review table with sample data
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('uuid-401', 'uuid-101', 'uuid-001', 5, 'Amazing stay, highly recommend!', CURRENT_TIMESTAMP),
('uuid-402', 'uuid-102', 'uuid-001', 4, 'Great location but a bit noisy.', CURRENT_TIMESTAMP);

-- Populating Message table with sample data
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('uuid-501', 'uuid-001', 'uuid-002', 'Hello, is the cottage available for December?', CURRENT_TIMESTAMP),
('uuid-502', 'uuid-002', 'uuid-001', 'Yes, it is available. Let me know if you have any questions.', CURRENT_TIMESTAMP);
