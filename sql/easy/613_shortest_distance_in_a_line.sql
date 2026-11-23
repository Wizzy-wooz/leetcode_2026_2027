-- 613. Shortest Distance in a Line
-- https://leetcode.com/problems/shortest-distance-in-a-line/
--
-- Point(x)
-- Find the shortest distance between any two points from the Point table.
-- It is guaranteed that the Point table contains at least two rows.

SELECT
  MIN(p2.x - p1.x) AS shortest
FROM Point AS p1
JOIN Point AS p2
  ON p1.x < p2.x;
