-- 1378. Replace Employee ID With The Unique Identifier
-- https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/
--
-- Employees(id, name)
-- EmployeeUNI(id, unique_id)
-- Write a solution to show the unique ID of each user, If a user does not have a unique ID
-- replace just show null.
-- Return the result table in any order.

SELECT
  unique_id,
  name
FROM Employees
LEFT JOIN EmployeeUNI
  USING (id);
