-- 2793. Status of Flight Tickets
-- https://leetcode.com/problems/status-of-flight-tickets/
--
-- Flights(flight_id, capacity)
-- Passengers(passenger_id, flight_id, booking_time)
-- Passengers book tickets for flights in advance. If a passenger books a ticket for a flight and
-- there are still empty seats available on the flight, the passenger's ticket will be confirmed.
-- However, the passenger will be on a waitlist if the flight is already at full capacity.
-- Write a solution to determine the current status of flight tickets for each passenger.
-- Return the result table ordered by passenger_id in ascending order.

SELECT
  passenger_id,
  CASE
    WHEN (
      RANK() OVER (PARTITION BY flight_id ORDER BY booking_time NULLS FIRST)
    ) <= capacity
    THEN 'Confirmed'
    ELSE 'Waitlist'
  END AS Status
FROM Passengers
JOIN Flights
  USING (flight_id)
ORDER BY
  passenger_id NULLS FIRST;
