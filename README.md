# Student Attendance DB – Task 6

This project is an extension of the **Student Attendance Database** for practicing  
**Subqueries and Nested Queries**.

---

## 📂 Files
- **schema.sql** → Base tables (Students, Courses, Enrollments, Attendance)
- **subqueries.sql** → Examples of scalar, correlated, and nested subqueries
- **sample_output.txt** → Notes / Expected results

---

## 🚀 How to Use
1. Open MySQL Workbench or DB Browser for SQLite.
2. Run `schema.sql` to create tables and insert sample data.
3. Run queries from `subqueries.sql`.

---

## 🔑 Concepts Covered
- Scalar subqueries (single value returned)
- Subqueries in `WHERE` using `IN`, `=`, `EXISTS`
- Correlated subqueries
- Subqueries in `FROM` (derived tables)

---

## 📝 Example Queries
```sql
-- Scalar subquery
SELECT name, age
FROM Students
WHERE age = (SELECT MAX(age) FROM Students);

-- IN subquery
SELECT name FROM Students
WHERE id IN (SELECT student_id FROM Enrollments);

-- EXISTS subquery
SELECT name FROM Students s
WHERE EXISTS (
  SELECT 1 FROM Attendance a
  WHERE a.student_id = s.id AND a.status = 'Absent'
);

-- Correlated subquery
SELECT name, age
FROM Students s
WHERE age > (SELECT AVG(age) FROM Students WHERE id <> s.id);

-- Subquery in FROM
SELECT student_id, COUNT(*) AS total_courses
FROM (SELECT * FROM Enrollments) sub
GROUP BY student_id;
