-- 2153. The Number of Passengers in Each Bus II
-- https://leetcode.com/problems/the-number-of-passengers-in-each-bus-ii/
--
-- Buses(bus_id, arrival_time, capacity)
-- Passengers(passenger_id, arrival_time)
-- Buses and passengers arrive at the LeetCode station. If a bus arrives at the station at a time
-- tbus and a passenger arrived at a time tpassenger where tpassenger <= tbus and the passenger
-- did not catch any bus, the passenger will use that bus. In addition, each bus has a capacity.
-- If at the moment the bus arrives at the station there are more passengers waiting than its
-- capacity capacity, only capacity passengers will use the bus.
-- Write a solution to report the number of users that used each bus.
-- Return the result table ordered by bus_id in ascending order.

WITH RECURSIVE arrivals AS (
  SELECT
    b.*,
    ROW_NUMBER() OVER (ORDER BY arrival_time) AS seq,
    (
      SELECT
        COUNT(*)
      FROM Passengers AS p
      WHERE
        p.arrival_time <= b.arrival_time
    ) AS arrived
  FROM Buses AS b
), boarding AS (
  SELECT
    *,
    LEAST(capacity, arrived) AS passengers_cnt,
    LEAST(capacity, arrived) AS boarded
  FROM arrivals
  WHERE
    seq = 1
  UNION ALL
  SELECT
    a.*,
    LEAST(a.capacity, a.arrived - b.boarded),
    b.boarded + LEAST(a.capacity, a.arrived - b.boarded)
  FROM boarding AS b
  JOIN arrivals AS a
    ON a.seq = b.seq + 1
)
SELECT
  bus_id,
  passengers_cnt
FROM boarding
ORDER BY
  bus_id;
