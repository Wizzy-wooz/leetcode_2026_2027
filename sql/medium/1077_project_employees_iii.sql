-- 1077. Project Employees III
-- https://leetcode.com/problems/project-employees-iii/
--
-- Project(project_id, employee_id)
-- Employee(employee_id, name, experience_years)
-- Write a solution to report the most experienced employees in each project. In case of a tie,
-- report all employees with the maximum number of experience years.
-- Return the result table in any order.
-- The result format is in the following example.

WITH T AS (
  SELECT
    *,
    RANK() OVER (PARTITION BY project_id ORDER BY experience_years DESC) AS rk
  FROM Project
  JOIN Employee
    USING (employee_id)
)
SELECT
  project_id,
  employee_id
FROM T
WHERE
  rk = 1;
