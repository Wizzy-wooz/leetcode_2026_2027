-- 3057. Employees Project Allocation
-- https://leetcode.com/problems/employees-project-allocation/
--
-- Project(project_id, employee_id, workload)
-- Employees(employee_id, name, team)
-- Write a solution to find the employees who are allocated to projects with a workload that
-- exceeds the average workload of all employees for their respective teams
-- Return the result table ordered by employee_id, project_id in ascending order.

WITH T AS (
  SELECT
    team,
    AVG(workload) AS avg_workload
  FROM Project
  JOIN Employees
    USING (employee_id)
  GROUP BY
    1
)
SELECT
  employee_id,
  project_id,
  name AS employee_name,
  workload AS project_workload
FROM Project
JOIN Employees
  USING (employee_id)
JOIN T
  USING (team)
WHERE
  workload > avg_workload
ORDER BY
  1 NULLS FIRST,
  2 NULLS FIRST;
