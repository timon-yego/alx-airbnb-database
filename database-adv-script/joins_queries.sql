-- 1. INNER JOIN: Retrieve all bookings and the respective users who made those bookings
-- Ordered by booking start date and user last name
SELECT 
    b.booking_id, 
    u.user_id, 
    u.first_name, 
    u.last_name, 
    b.start_date, 
    b.end_date, 
    b.total_price, 
    b.status
FROM 
    Booking b
INNER JOIN 
    User u
ON 
    b.user_id = u.user_id
ORDER BY 
    b.start_date ASC, u.last_name ASC;

-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties with no reviews
-- Ordered by property name and review rating
SELECT 
    p.property_id, 
    p.name AS property_name, 
    r.review_id, 
    r.rating, 
    r.comment
FROM 
    Property p
LEFT JOIN 
    Review r
ON 
    p.property_id = r.property_id
ORDER BY 
    p.name ASC, r.rating DESC;

-- 3. FULL OUTER JOIN: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
-- Ordered by user last name and booking start date
-- Note: FULL OUTER JOIN is not supported in some databases like MySQL. Use UNION of LEFT JOIN and RIGHT JOIN as a workaround.
SELECT 
    u.user_id, 
    u.first_name, 
    u.last_name, 
    b.booking_id, 
    b.start_date, 
    b.end_date
FROM 
    User u
LEFT JOIN 
    Booking b
ON 
    u.user_id = b.user_id
UNION
SELECT 
    u.user_id, 
    u.first_name, 
    u.last_name, 
    b.booking_id, 
    b.start_date, 
    b.end_date
FROM 
    User u
RIGHT JOIN 
    Booking b
ON 
    u.user_id = b.user_id
ORDER BY 
    u.last_name ASC, b.start_date ASC;
