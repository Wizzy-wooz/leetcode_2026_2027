-- 612. Shortest Distance in a Plane
-- https://leetcode.com/problems/shortest-distance-in-a-plane/
--
-- Point2D(x, y)
-- The distance between two points p1(x1, y1) and p2(x2, y2) is sqrt((x2 - x1)2 + (y2 - y1)2).
-- Write a solution to report the shortest distance between any two points from the Point2D table.
-- Round the distance to two decimal points.
-- The result format is in the following example.

SELECT
  ROUND(SQRT(POWER(p1.x - p2.x, 2) + POWER(p1.y - p2.y, 2)), 2) AS shortest
FROM Point2D AS p1
JOIN Point2D AS p2
  ON p1.x <> p2.x OR p1.y <> p2.y
ORDER BY
  1 NULLS FIRST
LIMIT 1;
