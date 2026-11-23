-- 610. Triangle Judgement
-- https://leetcode.com/problems/triangle-judgement/
--
-- Triangle(x, y, z)
-- Report for every three line segments whether they can form a triangle.
-- Return the result table in any order.
-- The result format is in the following example.

SELECT
  *,
  CASE WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes' ELSE 'No' END AS triangle
FROM Triangle;
