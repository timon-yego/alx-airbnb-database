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
    property_id,
    property_name,
    COUNT(booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(booking_id) DESC) AS rank
FROM 
    bookings
JOIN 
    properties
ON 
    bookings.property_id = properties.property_id
GROUP BY 
    property_id, property_name;

-- Rank properties based on total number of bookings using RANK
SELECT 
    property_id,
    property_name,
    COUNT(booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(booking_id) DESC) AS rank
FROM 
    bookings
JOIN 
    properties
ON 
    bookings.property_id = properties.property_id
GROUP BY 
    property_id, property_name;

