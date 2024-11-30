-- Total number of bookings made by each user using COUNT and GROUP BY
SELECT 
    u.user_id, 
    CONCAT(u.first_name, ' ', u.last_name) AS full_name, 
    COUNT(b.booking_id) AS total_bookings
FROM 
    User u
LEFT JOIN 
    Booking b 
ON 
    u.user_id = b.user_id
GROUP BY 
    u.user_id, u.first_name, u.last_name
ORDER BY 
    total_bookings DESC;

-- Rank properties based on total number of bookings using ROW_NUMBER
SELECT 
    p.property_id, 
    p.name AS property_name, 
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM 
    Property p
LEFT JOIN 
    Booking b 
ON 
    p.property_id = b.property_id
GROUP BY 
    p.property_id, p.name
ORDER BY 
    booking_rank;

