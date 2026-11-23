-- 1965. Employees With Missing Information
-- https://leetcode.com/problems/employees-with-missing-information/
--
-- Employees(employee_id, name)
-- Salaries(employee_id, salary)
-- Write a solution to report the IDs of all the employees with missing information. The
-- information of an employee is missing if:
-- The employee's name is missing, or
-- The employee's salary is missing.
-- Return the result table ordered by employee_id in ascending order.

SELECT
  employee_id
FROM Employees
WHERE
  NOT employee_id IN (
    SELECT
      employee_id
    FROM Salaries
  )
UNION
SELECT
  employee_id
FROM Salaries
WHERE
  NOT employee_id IN (
    SELECT
      employee_id
    FROM Employees
  )
ORDER BY
  1 NULLS FIRST;
