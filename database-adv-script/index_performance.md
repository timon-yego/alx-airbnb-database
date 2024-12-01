# Index Performance Optimization

## Overview
This document outlines the creation of indexes on the **User**, **Booking**, and **Property** tables to optimize query performance. We have identified frequently used columns based on queries and created indexes on them.

## Indexes Created
- **User Table**:
  - Index on `user_id` for faster lookups and joins.
  - Index on `email` for quick search queries.
  
- **Booking Table**:
  - Index on `user_id` for efficient lookups and joins with the User table.
  - Index on `property_id` for efficient joins with the Property table.
  - Index on `booking_date` for sorting/filtering queries based on booking date.

- **Property Table**:
  - Index on `property_id` for fast joins with the Booking table.
  - Index on `owner_id` for queries filtering by property owner.
  - Index on `location` and `price` for filtering queries based on these attributes.
  - Index on `rating` for sorting properties by rating.

## Query Performance Measurement

### Before Indexing:
- Query: `SELECT * FROM bookings WHERE user_id = 1;`
  - **Execution Plan**: Full table scan.

### After Indexing:
- Query: `SELECT * FROM bookings WHERE user_id = 1;`
  - **Execution Plan**: Index scan, significantly faster execution time.

## Conclusion
Adding indexes on high-usage columns greatly improved query performance. It is essential to monitor query patterns periodically and refine indexing strategies as the database grows.
