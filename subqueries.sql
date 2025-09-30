
USE student_attendance;

-- 1. Scalar subquery: oldest student
SELECT name, age
FROM Students
WHERE age = (SELECT MAX(age) FROM Students);

-- 2. IN subquery: students who enrolled in courses
SELECT name
FROM Students
WHERE id IN (SELECT student_id FROM Enrollments);

-- 3. EXISTS subquery: students with at least one absence
SELECT name
FROM Students s
WHERE EXISTS (
  SELECT 1 FROM Attendance a
  WHERE a.student_id = s.id AND a.status = 'Absent'
);

-- 4. Correlated subquery: students older than avg of others
SELECT name, age
FROM Students s
WHERE age > (SELECT AVG(age) FROM Students WHERE id <> s.id);

-- 5. Subquery in FROM (derived table): count courses per student
SELECT student_id, COUNT(*) AS total_courses
FROM (SELECT * FROM Enrollments) sub
GROUP BY student_id;

-- 6. Nested subquery: students enrolled in "Physics"
SELECT name
FROM Students
WHERE id IN (
  SELECT student_id FROM Enrollments
  WHERE course_id = (SELECT id FROM Courses WHERE title = 'Physics')
);
