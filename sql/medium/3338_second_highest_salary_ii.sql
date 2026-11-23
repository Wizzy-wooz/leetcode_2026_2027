-- 3338. Second Highest Salary II
-- https://leetcode.com/problems/second-highest-salary-ii/
--
-- employees(emp_id, salary, dept)
-- Write a solution to find the employees who earn the second-highest salary in each department.
-- If multiple employees have the second-highest salary, include all employees with that salary.
-- Return the result table ordered by emp_id in ascending order.

WITH T AS (
  SELECT
    emp_id,
    dept,
    DENSE_RANK() OVER (PARTITION BY dept ORDER BY salary DESC) AS rk
  FROM Employees
)
SELECT
  emp_id,
  dept
FROM T
WHERE
  rk = 2
ORDER BY
  1 NULLS FIRST;
