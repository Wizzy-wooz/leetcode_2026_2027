-- 2112. The Airport With the Most Traffic
-- https://leetcode.com/problems/the-airport-with-the-most-traffic/
--
-- Flights(departure_airport, arrival_airport, flights_count)
-- Write a solution to report the ID of the airport with the most traffic. The airport with the
-- most traffic is the airport that has the largest total number of flights that either departed
-- from or arrived at the airport. If there is more than one airport with the most traffic, report
-- them all.
-- Return the result table in any order.
-- The result format is in the following example.

WITH T AS (
  SELECT
    *
  FROM Flights
  UNION
  SELECT
    arrival_airport,
    departure_airport,
    flights_count
  FROM Flights
), P AS (
  SELECT
    departure_airport,
    SUM(flights_count) AS cnt
  FROM T
  GROUP BY
    1
)
SELECT
  departure_airport AS airport_id
FROM P
WHERE
  cnt = (
    SELECT
      MAX(cnt)
    FROM P
  );
