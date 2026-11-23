-- 2668. Find Latest Salaries
-- https://leetcode.com/problems/find-latest-salaries/
--
-- Salary(emp_id, firstname, lastname, salary, department_id)
-- Write a solution to find the current salary of each employee assuming that salaries increase
-- each year. Output their emp_id, firstname, lastname, salary, and department_id.
-- Return the result table ordered by emp_id in ascending order.

SELECT
  emp_id,
  firstname,
  lastname,
  MAX(salary) AS salary,
  department_id
FROM Salary
GROUP BY
  emp_id,
  firstname,
  lastname,
  department_id
ORDER BY
  emp_id NULLS FIRST;
