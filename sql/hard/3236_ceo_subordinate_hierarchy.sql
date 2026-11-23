-- 3236. CEO Subordinate Hierarchy
-- https://leetcode.com/problems/ceo-subordinate-hierarchy/
--
-- Employees(employee_id, employee_name, manager_id, salary)
-- Write a solution to find subordinates of the CEO (both direct and indirect), along with their
-- level in the hierarchy and their salary difference from the CEO.
-- The result should have the following columns:
-- subordinate_id: The employee_id of the subordinate
-- subordinate_name: The name of the subordinate
-- hierarchy_level: The level of the subordinate in the hierarchy (1 for direct reports, 2 for
-- their direct reports, and so on)
-- salary_difference: The difference between the subordinate's salary and the CEO's salary
-- Return the result table ordered by hierarchy_level ascending, and then by subordinate_id
-- ascending.

WITH RECURSIVE T AS (
  SELECT
    employee_id,
    employee_name,
    0 AS hierarchy_level,
    manager_id,
    salary
  FROM Employees
  WHERE
    manager_id IS NULL
  UNION ALL
  SELECT
    e.employee_id,
    e.employee_name,
    hierarchy_level + 1 AS hierarchy_level,
    e.manager_id,
    e.salary
  FROM T AS t
  JOIN Employees AS e
    ON t.employee_id = e.manager_id
), P AS (
  SELECT
    salary
  FROM Employees
  WHERE
    manager_id IS NULL
)
SELECT
  employee_id AS subordinate_id,
  employee_name AS subordinate_name,
  hierarchy_level,
  t.salary - p.salary AS salary_difference
FROM T AS t
CROSS JOIN P AS p
WHERE
  hierarchy_level <> 0
ORDER BY
  3 NULLS FIRST,
  1 NULLS FIRST;
