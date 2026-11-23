-- 569. Median Employee Salary
-- https://leetcode.com/problems/median-employee-salary/
--
-- Employee(id, company, salary)
-- Write a solution to find the rows that contain the median salary of each company. While
-- calculating the median, when you sort the salaries of the company, break the ties by id.
-- Return the result table in any order.

WITH t AS (
  SELECT
    *,
    ROW_NUMBER() OVER (PARTITION BY company ORDER BY salary ASC NULLS FIRST) AS rk,
    COUNT(id) OVER (PARTITION BY company) AS n
  FROM Employee
)
SELECT
  id,
  company,
  salary
FROM t
WHERE
  rk >= n / NULLIF(2, 0) AND rk <= n / NULLIF(2, 0) + 1;
