# ✅ Database Normalization to Third Normal Form (3NF)

## 🎯 Objective
Ensure that the database schema follows **3NF** to eliminate redundancy, ensure data integrity, and optimize storage.

---

## 🧱 Step-by-Step Normalization Process

### 🔹 1NF (First Normal Form)
✅ Achieved  
- Each table has a primary key.  
- All attributes contain only **atomic values**.  
- No repeating groups or arrays.

### 🔹 2NF (Second Normal Form)
✅ Achieved  
- All **non-key attributes** are fully functionally dependent on the **entire primary key**.  
- Since all tables have single-column primary keys, there is no issue of partial dependencies.

### 🔹 3NF (Third Normal Form)
✅ Achieved  
- There are **no transitive dependencies** .non-key attributes do **not** depend on other non-key attributes.  
- Example: In the `User` table, `role` is an ENUM and is dependent only on the primary key (`user_id`).  
- In `Property`, `pricepernight`, `location`, etc., are attributes of the property and dependent on `property_id`.

---

## ✅ Final Normalized Tables Overview

### User
- Stores distinct users.
- `email` is unique to avoid duplication.
- Roles are enforced via ENUM.

### Property
- Linked to the host (a User).
- Independent from Booking, Payment, or Review logic.

### Booking
- Links a User and a Property with booking dates and status.
- `total_price` is likely derived but can be stored for record-keeping.

### Payment
- Linked only to `Booking`, ensuring payment data is independent and normalized.
- Avoids duplication of payment methods per user/booking.

### Review
- Connects a User and a Property with normalized feedback fields.
- No duplicate or nested reviews.

### Message
- Simple structure with sender and recipient relationships, no redundancy.

---

## ✅ Conclusion

The current database schema adheres to **3NF**. All tables are normalized:
- There are **no repeating groups**, **no partial dependencies**, and **no transitive dependencies**.
- Relationships are clearly defined using **foreign keys**, and constraints enforce data integrity.
