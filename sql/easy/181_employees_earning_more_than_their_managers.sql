-- 181. Employees Earning More Than Their Managers
-- https://leetcode.com/problems/employees-earning-more-than-their-managers/
--
-- Employee(id, name, salary, managerId)
-- Write a solution to find the employees who earn more than their managers.
-- Return the result table in any order.

SELECT
  e1.name AS Employee
FROM Employee AS e1
JOIN Employee AS e2
  ON e1.managerId = e2.id
WHERE
  e1.salary > e2.salary;
