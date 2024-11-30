-- Non-correlated subquery to find properties where the average rating is greater than 4.0
SELECT 
    p.property_id, 
    p.name AS property_name, 
    p.location, 
    p.pricepernight
FROM 
    Property p
WHERE 
    p.property_id IN (
        SELECT 
            r.property_id
        FROM 
            Review r
        GROUP BY 
            r.property_id
        HAVING 
            AVG(r.rating) > 4.0
    );

-- Correlated subquery to find users who have made more than 3 bookings
SELECT 
    u.user_id, 
    u.first_name, 
    u.last_name, 
    u.email
FROM 
    User u
WHERE 
    (
        SELECT 
            COUNT(*) 
        FROM 
            Booking b
        WHERE 
            b.user_id = u.user_id
    ) > 3;
