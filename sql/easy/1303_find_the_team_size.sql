-- 1303. Find the Team Size
-- https://leetcode.com/problems/find-the-team-size/
--
-- Employee(employee_id, team_id)
-- Write a solution to find the team size of each of the employees.
-- Return the result table in any order.
-- The result format is in the following example.

WITH T AS (
  SELECT
    team_id,
    COUNT(1) AS team_size
  FROM Employee
  GROUP BY
    1
)
SELECT
  employee_id,
  team_size
FROM Employee
JOIN T
  USING (team_id);
