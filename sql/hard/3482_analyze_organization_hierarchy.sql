-- 3482. Analyze Organization Hierarchy
-- https://leetcode.com/problems/analyze-organization-hierarchy/
--
-- Employees(employee_id, employee_name, manager_id, salary, department)
-- Write a solution to analyze the organizational hierarchy and answer the following:
-- Hierarchy Levels: For each employee, determine their level in the organization (CEO is level 1,
-- employees reporting directly to the CEO are level 2, and so on).
-- Team Size: For each employee who is a manager, count the total number of employees under them
-- (direct and indirect reports).
-- Salary Budget: For each manager, calculate the total salary budget they control (sum of
-- salaries of all employees under them, including indirect reports, plus their own salary).
-- Return the result table ordered by the result ordered by level in ascending order, then by
-- budget in descending order, and finally by employee_name in ascending order.

WITH RECURSIVE level_cte AS (
  SELECT
    employee_id,
    manager_id,
    1 AS level,
    salary
  FROM Employees
  UNION ALL
  SELECT
    a.employee_id,
    b.manager_id,
    level + 1,
    a.salary
  FROM level_cte AS a
  JOIN Employees AS b
    ON b.employee_id = a.manager_id
), employee_with_level AS (
  SELECT
    a.employee_id,
    a.employee_name,
    a.salary,
    b.level
  FROM Employees AS a, (
    SELECT
      employee_id,
      level
    FROM level_cte
    WHERE
      manager_id IS NULL
  ) AS b
  WHERE
    a.employee_id = b.employee_id
)
SELECT
  a.employee_id,
  a.employee_name,
  a.level,
  COALESCE(b.team_size, 0) AS team_size,
  a.salary + COALESCE(b.budget, 0) AS budget
FROM employee_with_level AS a
LEFT JOIN (
  SELECT
    manager_id AS employee_id,
    COUNT(*) AS team_size,
    SUM(salary) AS budget
  FROM level_cte
  WHERE
    NOT manager_id IS NULL
  GROUP BY
    manager_id
) AS b
  ON a.employee_id = b.employee_id
ORDER BY
  level NULLS FIRST,
  budget DESC,
  employee_name NULLS FIRST;
