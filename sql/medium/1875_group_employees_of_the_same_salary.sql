-- 1875. Group Employees of the Same Salary
-- https://leetcode.com/problems/group-employees-of-the-same-salary/
--
-- Employees(employee_id, name, salary)
-- A company wants to divide the employees into teams such that all the members on each team have
-- the same salary. The teams should follow these criteria:
-- Each team should consist of at least two employees.
-- All the employees on a team should have the same salary.
-- All the employees of the same salary should be assigned to the same team.
-- If the salary of an employee is unique, we do not assign this employee to any team.
-- A team's ID is assigned based on the rank of the team's salary relative to the other teams'
-- salaries, where the team with the lowest salary has team_id = 1. Note that the salaries for
-- employees not on a team are not included in this ranking.
-- Write a solution to get the team_id of each employee that is in a team.
-- Return the result table ordered by team_id in ascending order. In case of a tie, order it by
-- employee_id in ascending order.
-- The result format is in the following example.

WITH S AS (
  SELECT
    salary
  FROM Employees
  GROUP BY
    salary
  HAVING
    COUNT(1) > 1
), T AS (
  SELECT
    salary,
    ROW_NUMBER() OVER (ORDER BY salary NULLS FIRST) AS team_id
  FROM S
)
SELECT
  e.*,
  t.team_id
FROM Employees AS e
JOIN T AS t
  ON e.salary = t.salary
ORDER BY
  4 NULLS FIRST,
  1 NULLS FIRST;
