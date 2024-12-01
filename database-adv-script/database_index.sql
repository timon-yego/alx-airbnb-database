-- Index on User table
-- Optimize JOINs using user_id
CREATE INDEX idx_user_user_id ON User(user_id);

-- Analyze performance after creating idx_user_user_id
EXPLAIN ANALYZE 
SELECT b.booking_id, u.first_name, p.name 
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE b.start_date > '2024-01-01';

-- Index on Booking table
-- Optimize JOINs on user_id
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Analyze performance after creating idx_booking_user_id
EXPLAIN ANALYZE 
SELECT b.booking_id, u.first_name, p.name 
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE b.start_date > '2024-01-01';

-- Optimize JOINs on property_id
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Analyze performance after creating idx_booking_property_id
EXPLAIN ANALYZE 
SELECT p.name, COUNT(*) AS total_bookings 
FROM Property p
JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.name
ORDER BY total_bookings DESC;

-- Optimize range queries on start_date
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- Analyze performance after creating idx_booking_start_date
EXPLAIN ANALYZE 
SELECT b.booking_id, u.first_name, p.name 
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE b.start_date > '2024-01-01';

-- Index on Property table
-- Optimize JOINs using property_id
CREATE INDEX idx_property_property_id ON Property(property_id);

-- Analyze performance after creating idx_property_property_id
EXPLAIN ANALYZE 
SELECT p.name, COUNT(*) AS total_bookings 
FROM Property p
JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.name
ORDER BY total_bookings DESC;

-- Optimize search queries on property name
CREATE INDEX idx_property_name ON Property(name);

-- Analyze performance after creating idx_property_name
EXPLAIN ANALYZE 
SELECT * 
FROM Property 
WHERE name LIKE 'Cozy%';

-- Index on Review table 
-- Optimize JOINs using property_id
CREATE INDEX idx_review_property_id ON Review(property_id);

-- Analyze performance after creating idx_review_property_id
EXPLAIN ANALYZE 
SELECT p.name, COUNT(*) AS total_bookings 
FROM Property p
JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.name
ORDER BY total_bookings DESC;
