-- 1285. Find the Start and End Number of Continuous Ranges
-- https://leetcode.com/problems/find-the-start-and-end-number-of-continuous-ranges/
--
-- Logs(log_id)
-- Write a solution to find the start and end number of continuous ranges in the table Logs.
-- Return the result table ordered by start_id.

WITH T AS (
  SELECT
    log_id,
    SUM(delta) OVER (ORDER BY log_id NULLS FIRST) AS pid
  FROM (
    SELECT
      log_id,
      CASE
        WHEN (
          log_id - LAG(log_id) OVER (ORDER BY log_id NULLS FIRST)
        ) = 1
        THEN 0
        ELSE 1
      END AS delta
    FROM Logs
  ) AS t
)
SELECT
  MIN(log_id) AS start_id,
  MAX(log_id) AS end_id
FROM T
GROUP BY
  pid;
