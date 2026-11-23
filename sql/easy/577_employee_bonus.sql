-- 577. Employee Bonus
-- https://leetcode.com/problems/employee-bonus/
--
-- Employee(empId, name, supervisor, salary)
-- Bonus(empId, bonus)
-- Write a solution to report the name and bonus amount of each employee who satisfies either of
-- the following:
-- The employee has a bonus less than 1000.
-- The employee did not get any bonus.
-- Return the result table in any order.
-- The result format is in the following example.

SELECT
  name,
  bonus
FROM Employee
LEFT JOIN Bonus
  USING (empId)
WHERE
  COALESCE(bonus, 0) < 1000;
