-- 1075. Project Employees I
-- https://leetcode.com/problems/project-employees-i/
--
-- Project(project_id, employee_id)
-- Employee(employee_id, name, experience_years)
-- Write an SQL query that reports the average experience years of all the employees for each
-- project, rounded to 2 digits.
-- Return the result table in any order.

SELECT
  project_id,
  ROUND(AVG(experience_years), 2) AS average_years
FROM Project
JOIN Employee
  USING (employee_id)
GROUP BY
  1;
