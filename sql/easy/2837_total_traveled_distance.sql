-- 2837. Total Traveled Distance
-- https://leetcode.com/problems/total-traveled-distance/
--
-- Users(user_id, name)
-- Rides(ride_id, user_id, distance)
-- Write a solution to calculate the distance traveled by each user. If there is a user who hasn't
-- completed any rides, then their distance should be considered as 0. Output the user_id, name
-- and total traveled distance.
-- Return the result table ordered by user_id in ascending order.
-- The result format is in the following example.

SELECT
  user_id,
  name,
  COALESCE(SUM(distance), 0) AS "traveled distance"
FROM Users
LEFT JOIN Rides
  USING (user_id)
GROUP BY
  1,
  name
ORDER BY
  1 NULLS FIRST;
