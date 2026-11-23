-- 1635. Hopper Company Queries I
-- https://leetcode.com/problems/hopper-company-queries-i/
--
-- Drivers(driver_id, join_date)
-- Rides(ride_id, user_id, requested_at)
-- AcceptedRides(ride_id, driver_id, ride_distance, ride_duration)
-- Write a solution to report the following statistics for each month of 2020:
-- The number of drivers currently with the Hopper company by the end of the month
-- (active_drivers).
-- The number of accepted rides in that month (accepted_rides).
-- Return the result table ordered by month in ascending order, where month is the month's number
-- (January is 1, February is 2, etc.).

WITH RECURSIVE Months AS (
  SELECT
    1 AS month
  UNION ALL
  SELECT
    month + 1
  FROM Months
  WHERE
    month < 12
), Ride AS (
  SELECT
    MONTH(CAST(requested_at AS DATE)) AS month,
    COUNT(1) AS cnt
  FROM Rides AS r
  JOIN AcceptedRides AS a
    ON r.ride_id = a.ride_id AND YEAR(CAST(requested_at AS DATE)) = 2020
  GROUP BY
    month
)
SELECT
  m.month,
  COUNT(driver_id) AS active_drivers,
  COALESCE(r.cnt, 0) AS accepted_rides
FROM Months AS m
LEFT JOIN Drivers AS d
  ON (
    m.month >= MONTH(CAST(d.join_date AS DATE))
    AND YEAR(CAST(d.join_date AS DATE)) = 2020
  )
  OR YEAR(CAST(d.join_date AS DATE)) < 2020
LEFT JOIN Ride AS r
  ON m.month = r.month
GROUP BY
  m.month,
  r.cnt;
