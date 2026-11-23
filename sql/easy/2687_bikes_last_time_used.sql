-- 2687. Bikes Last Time Used
-- https://leetcode.com/problems/bikes-last-time-used/
--
-- Bikes(ride_id, bike_number, start_time, end_time)
-- Write a solution to find the last time when each bike was used.
-- Return the result table ordered by the bikes that were most recently used.
-- The result format is in the following example.

SELECT
  bike_number,
  MAX(end_time) AS end_time
FROM Bikes
GROUP BY
  bike_number
ORDER BY
  end_time DESC;
