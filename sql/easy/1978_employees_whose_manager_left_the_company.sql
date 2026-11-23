-- 1978. Employees Whose Manager Left the Company
-- https://leetcode.com/problems/employees-whose-manager-left-the-company/
--
-- Employees(employee_id, name, manager_id, salary)
-- Find the IDs of the employees whose salary is strictly less than $30000 and whose manager left
-- the company. When a manager leaves the company, their information is deleted from the Employees
-- table, but the reports still have their manager_id set to the manager that left.
-- Return the result table ordered by employee_id.

SELECT
  e1.employee_id
FROM Employees AS e1
LEFT JOIN Employees AS e2
  ON e1.manager_id = e2.employee_id
WHERE
  e1.salary < 30000 AND NOT e1.manager_id IS NULL AND e2.employee_id IS NULL
ORDER BY
  1 NULLS FIRST;
