-- Index on User table
-- Optimize JOINs using user_id
CREATE INDEX idx_user_user_id ON User(user_id);

-- Index on Booking table
-- Optimize JOINs on user_id and property_id
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Optimize range queries on start_date
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- Index on Property table
-- Optimize JOINs using property_id
CREATE INDEX idx_property_property_id ON Property(property_id);

-- Optimize search queries on property name
CREATE INDEX idx_property_name ON Property(name);

-- Index on Review table (if applicable)
-- Optimize JOINs using property_id
CREATE INDEX idx_review_property_id ON Review(property_id);
