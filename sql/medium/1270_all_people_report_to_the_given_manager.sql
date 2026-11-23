-- 1270. All People Report to the Given Manager
-- https://leetcode.com/problems/all-people-report-to-the-given-manager/
--
-- Employees(employee_id, employee_name, manager_id)
-- Write a solution to find employee_id of all employees that directly or indirectly report their
-- work to the head of the company.
-- The indirect relation between managers will not exceed three managers as the company is small.
-- Return the result table in any order.
-- The result format is in the following example.

SELECT
  e1.employee_id
FROM Employees AS e1
JOIN Employees AS e2
  ON e1.manager_id = e2.employee_id
JOIN Employees AS e3
  ON e2.manager_id = e3.employee_id
WHERE
  e1.employee_id <> 1 AND e3.manager_id = 1;
