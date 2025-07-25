Create Database Result;
Use Result;

-- CREATE STUDENT TABLE
CREATE TABLE Students (StudentID INT PRIMARY KEY,Name VARCHAR(100),DOB DATE,Gender VARCHAR(10),
Department VARCHAR(50));

-- CREATE COURSE TABLE
CREATE TABLE Courses (CourseID INT PRIMARY KEY,CourseName VARCHAR(100),Credits INT,Semester INT);

-- CREATE GRADES TABLE
CREATE TABLE Grades (GradeID INT PRIMARY KEY AUTO_INCREMENT,StudentID INT,CourseID INT,Marks DECIMAL(5,2),
Grade CHAR(2),FOREIGN KEY (StudentID) REFERENCES Students(StudentID),FOREIGN KEY (CourseID) REFERENCES Courses(CourseID));

-- CREATE SEMESTER TABLE
CREATE TABLE Semesters (SemesterID INT PRIMARY KEY,SemesterName VARCHAR(50),StartDate DATE,EndDate DATE);

-- CREATE RESULT TABLE
CREATE TABLE Results (ResultID INT PRIMARY KEY AUTO_INCREMENT,StudentID INT,SemesterID INT,GPA DECIMAL(4,2),
FOREIGN KEY (StudentID) REFERENCES Students(StudentID),FOREIGN KEY (SemesterID) REFERENCES Semesters(SemesterID));

-- INSERT STUDENT
INSERT INTO Students (StudentID, Name, DOB, Gender, Department) VALUES
(1, 'Bhavesh Khushu', '2003-07-03', 'Male', 'Computer Science'),
(2, 'Akshada Veer', '2002-09-30', 'Female', 'Electronics'),
(3, 'Nihal Pathan', '2002-07-20', 'Male', 'Mechanical'),
(4, 'Samradnyi Patil', '2003-04-13', 'Female', 'Civil'),
(5, 'Arjun Iyer', '2003-07-10', 'Male', 'Electrical'),
(6, 'Arwa Master', '2003-12-28', 'Female', 'Computer Science'),
(7, 'Arihant Jadhav', '2003-07-17', 'Male', 'Electronics'),
(8, 'Shifa Khan', '2002-10-23', 'Female', 'Civil'),
(9, 'Ansar Khan ', '2003-10-17', 'Male', 'Mechanical'),
(10, 'Afroz Shaikh', '2002-10-08', 'Female', 'Electrical'),
(11, 'Raj Patil', '2002-01-07', 'Male', 'Computer Science'),
(12, 'Alisha Pathan', '2003-01-23', 'Female', 'Electronics'),
(13, 'Khaja Shaikh', '2003-07-11', 'Male', 'Civil'),
(14, 'Rechal Makasare', '2001-09-19', 'Female', 'Mechanical'),
(15, 'Inshal Shaikh', '2002-08-09', 'Male', 'Electrical'),
(16, 'Madiha Sayyed', '2003-05-22', 'Female', 'Computer Science'),
(17, 'Sarvar Shaikh', '2003-09-23', 'Male', 'Electronics'),
(18, 'Afziya Patel', '2002-06-06', 'Female', 'Civil'),
(19, 'Afzaan Sayyed', '2002-09-01', 'Male', 'Mechanical'),
(20, 'Noor Khan', '2003-02-02', 'Female', 'Electrical');

-- INSERT COURSES
INSERT INTO Courses (CourseID, CourseName, Credits, Semester) VALUES
(1, 'Math 101', 4, 1),
(2, 'CS 201', 3, 2),
(3, 'EE 110', 3, 1),
(4, 'Physics 205', 4, 3),
(5, 'Chem 120', 2, 1),
(6, 'CS 305', 4, 5),
(7, 'ME 240', 3, 4),
(8, 'Math 310', 4, 6),
(9, 'CS 410', 4, 7),
(10, 'EE 300', 3, 5);

-- Insert Grades
INSERT INTO Grades (GradeID, StudentID, CourseID, Marks, Grade) VALUES
(1, 1, 1, 88.50, 'A'),
(2, 1, 2, 76.00, 'B'),
(3, 2, 1, 45.00, 'D'),
(4, 2, 3, 91.00, 'A'),
(5, 3, 4, 63.25, 'C'),
(6, 3, 2, 78.00, 'B'),
(7, 4, 5, 59.00, 'D'),
(8, 4, 6, 83.50, 'B'),
(9, 5, 7, 66.75, 'C'),
(10, 5, 8, 90.00, 'A'),
(11, 6, 9, 72.20, 'B'),
(12, 6, 1, 88.90, 'A'),
(13, 7, 2, 60.10, 'C'),
(14, 7, 3, 77.00, 'B'),
(15, 8, 4, 54.00, 'D'),
(16, 8, 6, 82.75, 'B'),
(17, 9, 5, 69.00, 'C'),
(18, 9, 7, 92.10, 'A'),
(19, 10, 8, 58.00, 'D'),
(20, 10, 9, 95.00, 'A'),
(21, 11, 10, 74.30, 'B'),
(22, 11, 1, 67.50, 'C'),
(23, 12, 2, 84.00, 'B'),
(24, 12, 3, 70.00, 'B'),
(25, 13, 4, 36.00, 'F'),
(26, 13, 5, 55.00, 'D'),
(27, 14, 6, 79.20, 'B'),
(28, 14, 7, 87.00, 'A'),
(29, 15, 8, 93.00, 'A'),
(30, 15, 9, 64.00, 'C'),
(31, 16, 10, 50.00, 'D'),
(32, 16, 1, 80.00, 'B'),
(33, 17, 2, 42.00, 'F'),
(34, 17, 3, 65.00, 'C'),
(35, 18, 4, 71.00, 'B'),
(36, 18, 5, 48.00, 'D'),
(37, 19, 6, 82.00, 'B'),
(38, 19, 7, 85.00, 'B'),
(39, 20, 8, 97.00, 'A'),
(40, 20, 9, 91.50, 'A'),
(41, 1, 10, 79.00, 'B'),
(42, 2, 1, 38.00, 'F'),
(43, 3, 2, 66.00, 'C'),
(44, 4, 3, 83.00, 'B'),
(45, 5, 4, 90.00, 'A'),
(46, 6, 5, 71.00, 'B'),
(47, 7, 6, 75.50, 'B'),
(48, 8, 7, 63.00, 'C'),
(49, 9, 8, 59.00, 'D'),
(50, 10, 9, 87.00, 'A');

-- Insert Semesters
INSERT INTO Semesters (SemesterID, SemesterName, StartDate, EndDate) VALUES
(1, 'Semester 1', '2022-07-01', '2022-12-01'),
(2, 'Semester 2', '2023-01-01', '2023-06-01'),
(3, 'Semester 3', '2023-07-01', '2023-12-01'),
(4, 'Semester 4', '2024-01-01', '2024-06-01');

-- Insert Results 
INSERT INTO Results (ResultID, StudentID, SemesterID, GPA) VALUES
(1, 1, 1, 8.7),
(2, 1, 2, 9.0),
(3, 2, 1, 6.5),
(4, 2, 2, 8.3),
(5, 3, 1, 7.1),
(6, 4, 2, 8.0),
(7, 5, 1, 9.1),
(8, 5, 3, 9.5),
(9, 6, 1, 8.6),
(10, 6, 2, 9.2),
(11, 7, 1, 7.4),
(12, 8, 2, 8.7),
(13, 9, 3, 6.8),
(14, 10, 4, 9.3),
(15, 11, 2, 7.9),
(16, 12, 1, 8.0),
(17, 13, 3, 5.6),
(18, 14, 1, 8.5),
(19, 15, 2, 9.4),
(20, 16, 1, 8.9),
(21, 17, 2, 6.1),
(22, 18, 3, 7.7),
(23, 19, 4, 8.2),
(24, 20, 2, 9.8),
(25, 20, 4, 9.9),
(26, 3, 4, 7.4),
(27, 4, 4, 8.3),
(28, 5, 4, 9.0),
(29, 6, 4, 9.1),
(30, 7, 3, 7.3);

-- GPA based on (Grade Points × Credits) / Total Credits

-- Example GPA calculation query:
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

CREATE TRIGGER calculate_gpa
AFTER INSERT ON Grades
FOR EACH ROW
BEGIN
    -- Trigger logic to update GPA
END;

SELECT SemesterID, StudentID, GPA,
       RANK() OVER (PARTITION BY SemesterID ORDER BY GPA DESC) AS place_secured
FROM Results;

SELECT StudentID,
       COUNT(CASE WHEN Grade = 'F' THEN 1 END) AS FailedCourses,
       CASE WHEN COUNT(CASE WHEN Grade = 'F' THEN 1 END) = 0 THEN 'Pass' ELSE 'Fail' END AS Status
FROM Grades
GROUP BY StudentID;

SELECT s.SemesterName, st.Name, r.GPA
FROM Results r
JOIN Semesters s ON r.SemesterID = s.SemesterID
JOIN Students st ON r.StudentID = st.StudentID
ORDER BY s.SemesterID, r.GPA DESC;

CREATE TABLE Users (
  UserID INT PRIMARY KEY AUTO_INCREMENT,
  Username VARCHAR(50) UNIQUE,
  Password VARCHAR(100),
  Role ENUM('admin', 'student'),
  StudentID INT NULL
);

-- Admin user
INSERT INTO Users (Username, Password, Role, StudentID) VALUES ('admin1', 'admin123', 'admin', NULL);

-- Student user linked to StudentID = 1 (Bhavesh Khushu)
INSERT INTO Users (Username, Password, Role, StudentID) VALUES ('student1', 'pass123', 'student', 1);

-- Add more student users if needed
INSERT INTO Users (Username, Password, Role, StudentID)
VALUES ('student2', 'pass234', 'student', 2),
       ('student3', 'pass345', 'student', 3);

show tables;




