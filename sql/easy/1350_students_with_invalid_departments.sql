-- 1350. Students With Invalid Departments
-- https://leetcode.com/problems/students-with-invalid-departments/
--
-- Departments(id, name)
-- Students(id, name, department_id)
-- Find the id and the name of all students who are enrolled in departments that no longer exist.
-- Return the result table in any order.

SELECT
  id,
  name
FROM Students
WHERE
  NOT department_id IN (
    SELECT
      id
    FROM Departments
  );
