# Database Normalization to Achieve Third Normal Form (3NF)

## Initial Database Schema

### Entities and Attributes
#### User
- 'user_id' : Primary Key, UUID, Indexed
- 'first_name' : VARCHAR, NOT NULL
- 'last_name' : VARCHAR, NOT NULL
- 'email' : VARCHAR, UNIQUE, NOT NULL
- 'password_hash' : VARCHAR, NOT NULL
- 'phone_number' : VARCHAR, NULL
- 'role' : ENUM (guest, host, admin), NOT NULL
- 'created_at' : TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

#### Property
- `property_id`: Primary Key, UUID, Indexed
- `host_id`: Foreign Key, references `User(user_id)`
- `name`: VARCHAR, NOT NULL
- `description`: TEXT, NOT NULL
- `location`: VARCHAR, NOT NULL
- `price_per_night`: DECIMAL, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- `updated_at`: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

#### Booking
- `booking_id`: Primary Key, UUID, Indexed
- `property_id`: Foreign Key, references `Property(property_id)`
- `user_id`: Foreign Key, references `User(user_id)`
- `start_date`: DATE, NOT NULL
- `end_date`: DATE, NOT NULL
- `total_price`: DECIMAL, NOT NULL
- `status`: ENUM (`pending`, `confirmed`, `canceled`), NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

#### Payment
- `payment_id`: Primary Key, UUID, Indexed
- `booking_id`: Foreign Key, references `Booking(booking_id)`
- `amount`: DECIMAL, NOT NULL
- `payment_date`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- `payment_method`: ENUM (`credit_card`, `paypal`, `stripe`), NOT NULL

#### Review
- `review_id`: Primary Key, UUID, Indexed
- `property_id`: Foreign Key, references `Property(property_id)`
- `user_id`: Foreign Key, references `User(user_id)`
- `rating`: INTEGER, CHECK: `rating >= 1 AND rating <= 5`, NOT NULL
- `comment`: TEXT, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

#### Message
- `message_id`: Primary Key, UUID, Indexed
- `sender_id`: Foreign Key, references `User(user_id)`
- `recipient_id`: Foreign Key, references `User(user_id)`
- `message_body`: TEXT, NOT NULL
- `sent_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

## Normalization Process

### First Normal Form (1NF)
A table is in 1NF if:
- All columns contain atomic values.
- Each column contains values of a single type.
- Each column has a unique name.
- The order of storage does not matter.

**Analysis:**
The initial schema adheres to 1NF as all fields contain atomic values, and there are no repeating groups.

### Second Normal Form (2NF)
A table is in 2NF if:
- It is in 1NF.
- All non-key attributes are fully functionally dependent on the primary key.

**Analysis:**
- In the `Property` table, attributes like `location` and `price_per_night` are fully dependent on `property_id`.
- In the `Booking` table, `total_price` could potentially be recalculated using `price_per_night`, `start_date`, and `end_date`. However, as it simplifies querying and avoids recalculations, it is stored explicitly without violating 2NF.

No partial dependencies exist, so the schema adheres to 2NF.

### Third Normal Form (3NF)
A table is in 3NF if:
- It is in 2NF.
- No transitive dependency exists (non-key attributes depend only on the primary key).

**Analysis and Adjustments:**
1. **User Table**
   - No transitive dependencies. No changes needed.

2. **Property Table**
   - No transitive dependencies. No changes needed.

3. **Booking Table**
   - `total_price` is derived from other attributes but is stored for performance. Retain it as an exception with proper documentation.

4. **Payment Table**
   - No transitive dependencies. No changes needed.

5. **Review Table**
   - No transitive dependencies. No changes needed.

6. **Message Table**
   - No transitive dependencies. No changes needed.

---

## Final Database Schema (3NF)

The schema remains largely unchanged after normalization since it was designed with normalization principles in mind. All tables are in 3NF:

- **User**: Fully normalized.
- **Property**: Fully normalized.
- **Booking**: Retains `total_price` for performance.
- **Payment**: Fully normalized.
- **Review**: Fully normalized.
- Message: Fully normalized.

---

## Summary
The database schema adheres to 3NF, ensuring minimal redundancy and optimal structure for maintaining data integrity and supporting efficient queries. All adjustments have been justified to balance normalization with practical performance considerations.

