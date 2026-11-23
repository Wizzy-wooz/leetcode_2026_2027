-- 1661. Average Time of Process per Machine
-- https://leetcode.com/problems/average-time-of-process-per-machine/
--
-- Activity(machine_id, process_id, activity_type, timestamp)
-- There is a factory website that has several machines, each running one or more processes. Write
-- a solution to find the average time each machine takes to complete a process.
-- The time to complete a process is the 'end' timestamp minus the 'start' timestamp. The average
-- time is calculated by the total time to complete every process on the machine divided by the
-- number of processes that were run on that machine.
-- The resulting table should have the machine_id along with the average time as processing_time,
-- which should be rounded to 3 decimal places.
-- Return the result table in any order.

SELECT
  machine_id,
  ROUND(AVG(CASE WHEN activity_type = 'start' THEN -timestamp ELSE timestamp END) * 2, 3) AS processing_time
FROM Activity
GROUP BY
  1;
