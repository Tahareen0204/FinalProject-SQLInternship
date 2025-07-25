# 📊 Student Result Management System (MySQL)

This project is a **MySQL-based backend system** to manage student records, grades, GPA calculation, and academic reports.
 It simulates how colleges or universities process and store semester results.

---

## 📌 Features

- Student & Course management
- Semester-wise grade tracking
- GPA calculation
- Student ranking per semester
- Pass/Fail report
- Basic user authentication with roles
- Normalized database structure (up to 3NF)
- Views and trigger-ready structure

---

## 🛠️ Tools & Technologies

- MySQL 8.x
- MySQL Workbench
- SQL (DDL, DML, Views, Window Functions)
- ER Diagram (via Workbench)

---

## 🧱 Database Schema

### `Students`
- `StudentID` (PK)
- `Name`
- `DOB`
- `Gender`
- `Department`

### `Courses`
- `CourseID` (PK)
- `CourseName`
- `Credits`
- `Semester`

### `Grades`
- `GradeID` (PK)
- `StudentID` (FK)
- `CourseID` (FK)
- `Marks`
- `Grade` (A-F)

### `Semesters`
- `SemesterID` (PK)
- `SemesterName`
- `StartDate`
- `EndDate`

### `Results`
- `ResultID` (PK)
- `StudentID` (FK)
- `SemesterID` (FK)
- `GPA`

### `Users`
- `UserID` (PK)
- `Username`
- `Password`
- `Role` (admin/student)
- `StudentID` (nullable FK)

---

## 📊 Sample Queries

### 🎓 GPA Calculation
```sql
SELECT StudentID,
       SUM(
         CASE Grade
           WHEN 'A' THEN 10
           WHEN 'B' THEN 8
           WHEN 'C' THEN 6
           WHEN 'D' THEN 4
           WHEN 'F' THEN 0
         END * c.Credits
       ) / SUM(c.Credits) AS GPA
FROM Grades g
JOIN Courses c ON g.CourseID = c.CourseID
GROUP BY StudentID;
```

### 🏅 Rank Students
```sql
SELECT SemesterID, StudentID, GPA,
       RANK() OVER (PARTITION BY SemesterID ORDER BY GPA DESC) AS place_secured
FROM Results;
```

### ✅ Pass/Fail Report
```sql
SELECT StudentID,
       COUNT(CASE WHEN Grade = 'F' THEN 1 END) AS FailedCourses,
       CASE WHEN COUNT(CASE WHEN Grade = 'F' THEN 1 END) = 0 THEN 'Pass' ELSE 'Fail' END AS Status
FROM Grades
GROUP BY StudentID;
```

---

## 🧠 GPA Grading Logic

| Grade | Points |
|-------|--------|
| A     | 10     |
| B     | 8      |
| C     | 6      |
| D     | 4      |
| F     | 0      |

---

## 👨‍💻 Sample Users

| Username | Password | Role     |
|----------|----------|----------|
| admin1   | admin123 | admin    |
| student1 | pass123  | student  |


--------------------------------------------------------------------------------------------------------------------------------------

# Airline Reservation System (MySQL)


#. Tools & Technologies Used:
- MySQL Workbench


### Flights
- `flight_id` (Primary Key)
- `flight_number` (Unique)
- `origin`
- `destination`
- `departure_time`
- `arrival_time`

### Customers
- `customer_id` (Primary Key)
- `name`
- `email` (Unique)
- `phone`

### Seats
- `seat_id` (Primary Key)
- `flight_id` (Foreign Key → Flights)
- `seat_number`
- `is_booked` (Boolean)

### Bookings
- `booking_id` (Primary Key)
- `customer_id` (Foreign Key → Customers)
- `flight_id` (Foreign Key → Flights)
- `seat_id` (Foreign Key → Seats)
- `booking_date` (Default: Current Timestamp)
- `status` (ENUM: 'Booked', 'Cancelled')

##  Data Normalization:
- All tables are normalized to **3NF**.
- Ensures no redundancy, with each non-key attribute fully functionally dependent on the primary key.

## . Sample Data:
- 2 Flights (`AI101`, `6E203`)
- 10 Customers with names and contact details
- 10 Seats (5 per flight)
- Sample booking and cancellation transaction

## . Views & Triggers:

### Views:
- **BookingSummary**: Combines bookings with customer, flight, and seat details.

### Triggers:
- **after_booking**: On new booking, updates corresponding seat to booked.
- **after_cancellation**: On cancellation, marks seat as available again.

##  Sample Queries:
- Search flights from Mumbai to Delhi:
  ```sql
  SELECT * FROM Flights WHERE origin = 'Mumbai' AND destination = 'Delhi';
  ```

- Check available seats for a flight:
  ```sql
  SELECT seat_number FROM Seats WHERE flight_id = 1 AND is_booked = FALSE;
  ```

- Insert a booking:
  ```sql
  INSERT INTO Bookings (customer_id, flight_id, seat_id)
  VALUES (1, 1, 1);
  ```

- Cancel a booking:
  ```sql
  UPDATE Bookings SET status = 'Cancelled' WHERE booking_id = 1;
  ```

- View booking summary:
  ```sql
  SELECT * FROM BookingSummary;
  
  ------------------------------------------------------------------------------------------------------------------------
  
  
# Social Media Analytics System

A MySQL-based backend system to track and analyze user engagement on social media posts, including likes, comments, and engagement scores with triggers and views.

---

## 📂 Database Schema

### 1. `users`
- `user_id` (INT, PK, AUTO_INCREMENT)
- `username` (VARCHAR)
- `email` (VARCHAR)
- `joined_at` (DATETIME, DEFAULT CURRENT_TIMESTAMP)

### 2. `posts`
- `post_id` (INT, PK, AUTO_INCREMENT)
- `user_id` (FK)
- `content` (TEXT)
- `created_at` (DATETIME, DEFAULT CURRENT_TIMESTAMP)
- `like_count` (INT, DEFAULT 0)

### 3. `likes`
- `like_id` (INT, PK, AUTO_INCREMENT)
- `post_id` (FK)
- `user_id` (FK)
- `liked_at` (DATETIME, DEFAULT CURRENT_TIMESTAMP)

### 4. `comments`
- `comment_id` (INT, PK, AUTO_INCREMENT)
- `post_id` (FK)
- `user_id` (FK)
- `content` (TEXT)
- `commented_at` (DATETIME, DEFAULT CURRENT_TIMESTAMP)

---

## 📊 Features

- Track likes and comments on posts
- Trigger to auto-update like count after inserting a like
- View for post engagement (likes + comments)
- Rank posts by engagement using `RANK()` window function

---

## 📌 Sample Queries

- Top 5 posts by engagement score:
```sql
SELECT * FROM post_engagement
ORDER BY engagement_score DESC
LIMIT 5;
```

- Rank all posts by engagement:
```sql
SELECT *,
       RANK() OVER (ORDER BY engagement_score DESC) AS engagement_rank
FROM post_engagement;
```

---

## 🛠️ Triggers

```sql
CREATE TRIGGER update_like_count
AFTER INSERT ON likes
FOR EACH ROW
BEGIN
    UPDATE posts
    SET like_count = like_count + 1
    WHERE post_id = NEW.post_id;
END;
```

---

## 👁️ View: `post_engagement`

```sql
CREATE VIEW post_engagement AS
SELECT
    p.post_id,
    u.username,
    p.content,
    COUNT(DISTINCT l.like_id) AS like_count,
    COUNT(DISTINCT c.comment_id) AS comment_count,
    (COUNT(DISTINCT l.like_id) + COUNT(DISTINCT c.comment_id)) AS engagement_score
FROM posts p
LEFT JOIN users u ON p.user_id = u.user_id
LEFT JOIN likes l ON p.post_id = l.post_id
LEFT JOIN comments c ON p.post_id = c.post_id
GROUP BY p.post_id;
```

---

## 📌 Output Examples

- Post engagement leaderboard
- Likes and comments trend
- Automatic like count management with trigger

---

## ✅ Technologies Used

- MySQL 8+
- Views, Triggers, Window Functions
