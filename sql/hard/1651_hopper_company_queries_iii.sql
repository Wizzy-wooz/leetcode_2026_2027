-- 1651. Hopper Company Queries III
-- https://leetcode.com/problems/hopper-company-queries-iii/
--
-- Drivers(driver_id, join_date)
-- Rides(ride_id, user_id, requested_at)
-- AcceptedRides(ride_id, driver_id, ride_distance, ride_duration)
-- Write a solution to compute the average_ride_distance and average_ride_duration of every
-- 3-month window starting from January - March 2020 to October - December 2020. Round
-- average_ride_distance and average_ride_duration to the nearest two decimal places.
-- The average_ride_distance is calculated by summing up the total ride_distance values from the
-- three months and dividing it by 3. The average_ride_duration is calculated in a similar way.
-- Return the result table ordered by month in ascending order, where month is the starting
-- month's number (January is 1, February is 2, etc.).

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
    month,
    SUM(COALESCE(ride_distance, 0)) AS ride_distance,
    SUM(COALESCE(ride_duration, 0)) AS ride_duration
  FROM Months AS m
  LEFT JOIN Rides AS r
    ON month = MONTH(CAST(requested_at AS DATE))
    AND YEAR(CAST(requested_at AS DATE)) = 2020
  LEFT JOIN AcceptedRides AS a
    ON r.ride_id = a.ride_id
  GROUP BY
    month
)
SELECT
  month,
  ROUND(
    AVG(ride_distance) OVER (ORDER BY month NULLS FIRST ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING),
    2
  ) AS average_ride_distance,
  ROUND(
    AVG(ride_duration) OVER (ORDER BY month NULLS FIRST ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING),
    2
  ) AS average_ride_duration
FROM Ride
ORDER BY
  month NULLS FIRST
LIMIT 10;
