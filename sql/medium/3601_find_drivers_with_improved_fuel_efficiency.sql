-- 3601. Find Drivers with Improved Fuel Efficiency
-- https://leetcode.com/problems/find-drivers-with-improved-fuel-efficiency/
--
-- drivers(driver_id, driver_name)
-- trips(trip_id, driver_id, trip_date, distance_km, fuel_consumed)
-- Write a solution to find drivers whose fuel efficiency has improved by comparing their average
-- fuel efficiency in the first half of the year with the second half of the year.
-- Calculate fuel efficiency as distance_km / fuel_consumed for each trip
-- First half: January to June, Second half: July to December
-- Only include drivers who have trips in both halves of the year
-- Calculate the efficiency improvement as (second_half_avg - first_half_avg)
-- Round all results to 2 decimal places
-- Return the result table ordered by efficiency improvement in descending order, then by driver
-- name in ascending order.

WITH T AS (
  SELECT
    driver_id,
    AVG(distance_km / NULLIF(fuel_consumed, 0)) AS half_avg,
    CASE WHEN MONTH(CAST(trip_date AS DATE)) <= 6 THEN 1 ELSE 2 END AS half
  FROM trips
  GROUP BY
    driver_id,
    half
)
SELECT
  t1.driver_id,
  d.driver_name,
  ROUND(t1.half_avg, 2) AS first_half_avg,
  ROUND(t2.half_avg, 2) AS second_half_avg,
  ROUND(t2.half_avg - t1.half_avg, 2) AS efficiency_improvement
FROM T AS t1
JOIN T AS t2
  ON t1.driver_id = t2.driver_id AND t1.half < t2.half AND t1.half_avg < t2.half_avg
JOIN drivers AS d
  ON t1.driver_id = d.driver_id
ORDER BY
  efficiency_improvement DESC,
  d.driver_name NULLS FIRST;
