-- Create the partitioned Booking table
CREATE TABLE booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Create Partitions for the Table
CREATE TABLE booking_2024_q1 PARTITION OF booking
    FOR VALUES FROM ('2024-01-01') TO ('2024-04-01');

CREATE TABLE booking_2024_q2 PARTITION OF booking
    FOR VALUES FROM ('2024-04-01') TO ('2024-07-01');

CREATE TABLE booking_2024_q3 PARTITION OF booking
    FOR VALUES FROM ('2024-07-01') TO ('2024-10-01');

CREATE TABLE booking_2024_q4 PARTITION OF booking
    FOR VALUES FROM ('2024-10-01') TO ('2025-01-01');

-- Query Partitioned Table
-- Example Query 1: Fetch Bookings for Q1 2024
EXPLAIN ANALYZE
SELECT * FROM booking
WHERE start_date BETWEEN '2024-01-01' AND '2024-03-31';

-- Example Query 2: Fetch All Bookings Across Partitions
EXPLAIN ANALYZE
SELECT * FROM booking;
