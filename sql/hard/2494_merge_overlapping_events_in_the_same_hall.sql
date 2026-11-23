-- 2494. Merge Overlapping Events in the Same Hall
-- https://leetcode.com/problems/merge-overlapping-events-in-the-same-hall/
--
-- HallEvents(hall_id, start_day, end_day)
-- Write a solution to merge all the overlapping events that are held in the same hall. Two events
-- overlap if they have at least one day in common.
-- Return the result table in any order.
-- The result format is in the following example.

WITH S AS (
  SELECT
    hall_id,
    start_day,
    end_day,
    MAX(end_day) OVER (PARTITION BY hall_id ORDER BY start_day NULLS FIRST) AS cur_max_end_day
  FROM HallEvents
), T AS (
  SELECT
    *,
    CASE
      WHEN start_day <= LAG(cur_max_end_day) OVER (PARTITION BY hall_id ORDER BY start_day NULLS FIRST)
      THEN 0
      ELSE 1
    END AS start
  FROM S
), P AS (
  SELECT
    *,
    SUM(start) OVER (PARTITION BY hall_id ORDER BY start_day NULLS FIRST) AS gid
  FROM T
)
SELECT
  hall_id,
  MIN(start_day) AS start_day,
  MAX(end_day) AS end_day
FROM P
GROUP BY
  hall_id,
  gid;
