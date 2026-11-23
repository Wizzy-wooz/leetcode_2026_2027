-- 3308. Find Top Performing Driver
-- https://leetcode.com/problems/find-top-performing-driver/
--
-- Drivers(driver_id, name, age, experience, accidents)
-- Vehicles(vehicle_id, driver_id, model, fuel_type, mileage)
-- Trips(trip_id, vehicle_id, distance, duration, rating)
-- Uber is analyzing drivers based on their trips. Write a solution to find the top-performing
-- driver for each fuel type based on the following criteria:
-- A driver's performance is calculated as the average rating across all their trips. Average
-- rating should be rounded to 2 decimal places.
-- If two drivers have the same average rating, the driver with the longer total distance traveled
-- should be ranked higher.
-- If there is still a tie, choose the driver with the fewest accidents.
-- Return the result table ordered by fuel_type in ascending order.

WITH T AS (
  SELECT
    fuel_type,
    driver_id,
    ROUND(AVG(rating), 2) AS rating,
    SUM(distance) AS distance,
    SUM(accidents) AS accidents
  FROM Drivers
  JOIN Vehicles
    USING (driver_id)
  JOIN Trips
    USING (vehicle_id)
  GROUP BY
    fuel_type,
    driver_id
), P AS (
  SELECT
    *,
    RANK() OVER (PARTITION BY fuel_type ORDER BY rating DESC, distance DESC, accidents NULLS FIRST) AS rk
  FROM T
)
SELECT
  fuel_type,
  driver_id,
  rating,
  distance
FROM P
WHERE
  rk = 1
ORDER BY
  1 NULLS FIRST;
