-- 2783. Flight Occupancy and Waitlist Analysis
-- https://leetcode.com/problems/flight-occupancy-and-waitlist-analysis/
--
-- Flights(flight_id, capacity)
-- Passengers(passenger_id, flight_id)
-- Passengers book tickets for flights in advance. If a passenger books a ticket for a flight and
-- there are still empty seats available on the flight, the passenger ticket will be confirmed.
-- However, the passenger will be on a waitlist if the flight is already at full capacity.
-- Write a solution to report the number of passengers who successfully booked a flight (got a
-- seat) and the number of passengers who are on the waitlist for each flight.
-- Return the result table ordered by flight_id in ascending order.
-- The result format is in the following example.

SELECT
  flight_id,
  CASE
    WHEN COUNT(passenger_id) IS NULL OR capacity IS NULL
    THEN NULL
    ELSE LEAST(COUNT(passenger_id), capacity)
  END AS booked_cnt,
  CASE
    WHEN (
      COUNT(passenger_id) - capacity
    ) IS NULL OR 0 IS NULL
    THEN NULL
    ELSE GREATEST(COUNT(passenger_id) - capacity, 0)
  END AS waitlist_cnt
FROM Flights
LEFT JOIN Passengers
  USING (flight_id)
GROUP BY
  1,
  capacity
ORDER BY
  1 NULLS FIRST;
