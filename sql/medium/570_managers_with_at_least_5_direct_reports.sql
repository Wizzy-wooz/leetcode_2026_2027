-- 570. Managers with at Least 5 Direct Reports
-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/
--
-- Employee(id, name, department, managerId)
-- Write a solution to find managers with at least five direct reports.
-- Return the result table in any order.

SELECT
  name
FROM Employee
JOIN (
  SELECT
    managerId AS id,
    COUNT(1) AS cnt
  FROM Employee
  GROUP BY
    1
  HAVING
    cnt >= 5
) AS t
  USING (id);
