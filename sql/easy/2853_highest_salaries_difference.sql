-- 2853. Highest Salaries Difference
-- https://leetcode.com/problems/highest-salaries-difference/
--
-- Salaries(emp_name, department, salary)
-- Write a solution to calculate the difference between the highest salaries in the marketing and
-- engineering department. Output the absolute difference in salaries.
-- Return the result table.
-- The result format is in the following example.

SELECT
  MAX(s) - MIN(s) AS salary_difference
FROM (
  SELECT
    MAX(salary) AS s
  FROM Salaries
  GROUP BY
    department
) AS t;
