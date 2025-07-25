-- Create Database AirlineReservation;
-- Use AirlineReservation;

/*CREATE TABLE Flights (flight_id INT PRIMARY KEY AUTO_INCREMENT,flight_number VARCHAR(10) UNIQUE,origin VARCHAR(50),
destination VARCHAR(50),departure_time DATETIME,arrival_time DATETIME);

CREATE TABLE Customers (customer_id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(100),email VARCHAR(100) UNIQUE,phone VARCHAR(15));

CREATE TABLE Seats (seat_id INT PRIMARY KEY AUTO_INCREMENT,flight_id INT,seat_number VARCHAR(5),is_booked BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (flight_id) REFERENCES Flights(flight_id));
  
  CREATE TABLE Bookings (booking_id INT PRIMARY KEY AUTO_INCREMENT,customer_id INT,flight_id INT,seat_id INT,booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  status ENUM('Booked', 'Cancelled') DEFAULT 'Booked',FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),FOREIGN KEY (seat_id) REFERENCES Seats(seat_id));
  
  INSERT INTO Flights (flight_number, origin, destination, departure_time, arrival_time) VALUES
('AI101', 'Mumbai', 'Delhi', '2025-07-25 08:00:00', '2025-07-25 10:00:00'),
('6E203', 'Delhi', 'Bangalore', '2025-07-26 09:30:00', '2025-07-26 12:00:00');

INSERT INTO Customers (name, email, phone) VALUES
('Riya Jadhav', 'riya@example.com', '9876543210'),
('Bob Davis', 'bob@example.com', '9988776655'),
('Aman Patel', 'aman@example.com', '9123456789'),
('Evan Johnson', 'evan@example.com', '9345678912'),
('Siyona Ethan ', 'siyona@example.com', '9567891234'),
('Arya Jagtap', 'arya@example.com', '9765432109'),
('Rahul Roy', 'rahul@example.com', '9456123789'),
('Hannah Khan', 'hannah@example.com', '9234567891'),
('Maaz Sayyed', 'maaz@example.com', '9834567812'),
('Jasmine Khan', 'jasmine@example.com', '9789123456');

-- Seats for Flight 1 (AI101)
INSERT INTO Seats (flight_id, seat_number) VALUES
(1, '1A'),
(1, '1B'),
(1, '1C'),
(1, '2A'),
(1, '2B');

-- Seats for Flight 2 (6E203)
INSERT INTO Seats (flight_id, seat_number) VALUES
(2, '1A'),
(2, '1B'),
(2, '1C'),
(2, '2A'),
(2, '2B');

SELECT seat_number FROM Seats
WHERE flight_id = 1 AND is_booked = FALSE;

SELECT * FROM Flights
WHERE origin = 'Mumbai' AND destination = 'Delhi';

DELIMITER //

CREATE TRIGGER after_booking
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
  UPDATE Seats SET is_booked = TRUE WHERE seat_id = NEW.seat_id;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER after_cancellation
AFTER UPDATE ON Bookings
FOR EACH ROW
BEGIN
  IF NEW.status = 'Cancelled' THEN
    UPDATE Seats SET is_booked = FALSE WHERE seat_id = NEW.seat_id;
  END IF;
END //

DELIMITER ;

CREATE VIEW BookingSummary AS
SELECT b.booking_id, c.name AS customer_name, f.flight_number, s.seat_number, b.status
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
JOIN Flights f ON b.flight_id = f.flight_id
JOIN Seats s ON b.seat_id = s.seat_id;

-- SHOW TABLES;
DESCRIBE Flights;
DESCRIBE Customers;
DESCRIBE Seats;
DESCRIBE Bookings;

-- SELECT * FROM Flights;
-- SELECT * FROM Customers;
SELECT seat_number FROM Seats
WHERE flight_id = 1 AND is_booked = FALSE;

SELECT * FROM Flights
WHERE origin = 'Mumbai' AND destination = 'Delhi';

INSERT INTO Bookings (customer_id, flight_id, seat_id)
VALUES (1, 1, 1);  -- Riya Jadhav, Flight 1 (AI101), Seat 1A

SELECT * FROM Seats WHERE seat_id = 1;

UPDATE Bookings SET status = 'Cancelled' WHERE booking_id = 1;

SELECT * FROM Seats WHERE seat_id = 1;
*/

SELECT * FROM BookingSummary;













