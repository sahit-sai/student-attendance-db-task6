
CREATE DATABASE IF NOT EXISTS student_attendance;
USE student_attendance;

-- Students table
CREATE TABLE IF NOT EXISTS Students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    age INT
);

-- Courses table
CREATE TABLE IF NOT EXISTS Courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL
);

-- Enrollments table
CREATE TABLE IF NOT EXISTS Enrollments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(id) ON DELETE CASCADE
);

-- Attendance table
CREATE TABLE IF NOT EXISTS Attendance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    attendance_date DATE,
    status VARCHAR(20) DEFAULT 'Absent',
    FOREIGN KEY (student_id) REFERENCES Students(id) ON DELETE CASCADE
);

-- Sample data
INSERT INTO Students (name, email, age) VALUES
('Rahul Sharma', 'rahul@example.com', 20),
('Priya Singh', 'priya@example.com', 21),
('Amit Kumar', NULL, 19),
('Neha Reddy', 'neha@example.com', 22);

INSERT INTO Courses (title) VALUES
('Mathematics'),
('Physics'),
('Computer Science');

INSERT INTO Enrollments (student_id, course_id) VALUES
(1, 1),
(1, 2),
(2, 3);

INSERT INTO Attendance (student_id, attendance_date, status) VALUES
(1, '2025-09-01', 'Present'),
(1, '2025-09-02', 'Absent'),
(2, '2025-09-01', 'Present'),
(3, '2025-09-01', 'Absent');
