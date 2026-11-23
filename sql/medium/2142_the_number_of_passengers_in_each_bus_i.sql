-- 2142. The Number of Passengers in Each Bus I
-- https://leetcode.com/problems/the-number-of-passengers-in-each-bus-i/
--
-- Buses(bus_id, arrival_time)
-- Passengers(passenger_id, arrival_time)
-- Buses and passengers arrive at the LeetCode station. If a bus arrives at the station at time
-- tbus and a passenger arrived at time tpassenger where tpassenger <= tbus and the passenger did
-- not catch any bus, the passenger will use that bus.
-- Write a solution to report the number of users that used each bus.
-- Return the result table ordered by bus_id in ascending order.
-- The result format is in the following example.

SELECT
  bus_id,
  COUNT(passenger_id) - LAG(COUNT(passenger_id), 1, 0) OVER (ORDER BY b.arrival_time NULLS FIRST) AS passengers_cnt
FROM Buses AS b
LEFT JOIN Passengers AS p
  ON p.arrival_time <= b.arrival_time
GROUP BY
  1,
  b.arrival_time
ORDER BY
  1 NULLS FIRST;
