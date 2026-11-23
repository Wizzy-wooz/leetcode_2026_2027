-- 1407. Top Travellers
-- https://leetcode.com/problems/top-travellers/
--
-- Users(id, name)
-- Rides(id, user_id, distance)
-- Write a solution to report the distance traveled by each user.
-- Return the result table ordered by travelled_distance in descending order, if two or more users
-- traveled the same distance, order them by their name in ascending order.
-- The result format is in the following example.

SELECT
  name,
  COALESCE(SUM(distance), 0) AS travelled_distance
FROM Users AS u
LEFT JOIN Rides AS r
  ON u.id = r.user_id
GROUP BY
  u.id,
  name
ORDER BY
  2 DESC,
  1 NULLS FIRST;
