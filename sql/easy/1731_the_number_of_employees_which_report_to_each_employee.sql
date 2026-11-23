-- 1731. The Number of Employees Which Report to Each Employee
-- https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/
--
-- Employees(employee_id, name, reports_to, age)
-- For this problem, we will consider a manager an employee who has at least 1 other employee
-- reporting to them.
-- Write a solution to report the ids and the names of all managers, the number of employees who
-- report directly to them, and the average age of the reports rounded to the nearest integer.
-- Return the result table ordered by employee_id.
-- The result format is in the following example.

SELECT
  e2.employee_id,
  e2.name,
  COUNT(1) AS reports_count,
  ROUND(AVG(e1.age)) AS average_age
FROM Employees AS e1
JOIN Employees AS e2
  ON e1.reports_to = e2.employee_id
GROUP BY
  1,
  e2.name
ORDER BY
  1 NULLS FIRST;
