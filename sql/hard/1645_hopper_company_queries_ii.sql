-- 1645. Hopper Company Queries II
-- https://leetcode.com/problems/hopper-company-queries-ii/
--
-- Drivers(driver_id, join_date)
-- Rides(ride_id, user_id, requested_at)
-- AcceptedRides(ride_id, driver_id, ride_distance, ride_duration)
-- Write a solution to report the percentage of working drivers (working_percentage) for each
-- month of 2020 where:
-- Note that if the number of available drivers during a month is zero, we consider the
-- working_percentage to be 0.
-- Return the result table ordered by month in ascending order, where month is the month's number
-- (January is 1, February is 2, etc.). Round working_percentage to the nearest 2 decimal places.
-- The result format is in the following example.

WITH RECURSIVE Month AS (
  SELECT
    1 AS month
  UNION
  SELECT
    month + 1
  FROM Month
  WHERE
    month < 12
), S AS (
  SELECT
    month,
    driver_id,
    join_date
  FROM Month AS m
  LEFT JOIN Drivers AS d
    ON YEAR(CAST(d.join_date AS DATE)) < 2020
    OR (
      YEAR(CAST(d.join_date AS DATE)) = 2020
      AND MONTH(CAST(d.join_date AS DATE)) <= month
    )
), T AS (
  SELECT
    driver_id,
    requested_at
  FROM Rides
  JOIN AcceptedRides
    USING (ride_id)
  WHERE
    YEAR(CAST(requested_at AS DATE)) = 2020
)
SELECT
  month,
  COALESCE(
    ROUND(COUNT(DISTINCT t.driver_id) * 100 / NULLIF(COUNT(DISTINCT s.driver_id), 0), 2),
    0
  ) AS working_percentage
FROM S AS s
LEFT JOIN T AS t
  ON s.driver_id = t.driver_id
  AND s.join_date <= t.requested_at
  AND s.month = MONTH(CAST(t.requested_at AS DATE))
GROUP BY
  1;
