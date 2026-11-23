-- 1873. Calculate Special Bonus
-- https://leetcode.com/problems/calculate-special-bonus/
--
-- Employees(employee_id, name, salary)
-- Write a solution to calculate the bonus of each employee. The bonus of an employee is 100% of
-- their salary if the ID of the employee is an odd number and the employee's name does not start
-- with the character 'M'. The bonus of an employee is 0 otherwise.
-- Return the result table ordered by employee_id.
-- The result format is in the following example.

SELECT
  employee_id,
  CASE
    WHEN employee_id % NULLIF(2, 0) = 0
    OR LEFT(name, CASE WHEN 1 < 0 THEN 0 ELSE 1 END) = 'M'
    THEN 0
    ELSE salary
  END AS bonus
FROM employees
ORDER BY
  1 NULLS FIRST;
