-- 3126. Server Utilization Time
-- https://leetcode.com/problems/server-utilization-time/
--
-- Servers(server_id, status_time, session_status)
-- Write a solution to find the total time when servers were running. The output should be rounded
-- down to the nearest number of full days.
-- Return the result table in any order.

WITH T AS (
  SELECT
    server_id,
    status_time,
    session_status,
    SUM(CASE WHEN session_status = 'start' THEN 1 ELSE -1 END) OVER (
      PARTITION BY server_id
      ORDER BY status_time NULLS FIRST, session_status NULLS FIRST
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS depth
  FROM Servers
)
SELECT
  FLOOR(SUM(DATE_SUB('SECOND', start_time, stop_time)) / NULLIF(86400, 0)) AS total_uptime_days
FROM (
  SELECT
    s.status_time AS start_time,
    MIN(t.status_time) AS stop_time
  FROM T AS s
  JOIN T AS t
    ON s.server_id = t.server_id
    AND t.session_status = 'stop'
    AND t.depth = s.depth - 1
    AND t.status_time > s.status_time
  WHERE
    s.session_status = 'start'
  GROUP BY
    s.server_id,
    s.status_time
) AS p;
