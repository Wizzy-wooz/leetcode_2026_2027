-- 1076. Project Employees II
-- https://leetcode.com/problems/project-employees-ii/
--
-- Project(project_id, employee_id)
-- Employee(employee_id, name, experience_years)
-- Write a solution to report all the projects that have the most employees.
-- Return the result table in any order.

SELECT
  project_id
FROM Project
GROUP BY
  1
HAVING
  COUNT(1) >= ALL (
    SELECT
      COUNT(1)
    FROM Project
    GROUP BY
      project_id
  );
