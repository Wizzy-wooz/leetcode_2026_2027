-- 2995. Viewers Turned Streamers
-- https://leetcode.com/problems/viewers-turned-streamers/
--
-- Sessions(user_id, session_start, session_end, session_id, session_type)
-- Write a solution to find the number of streaming sessions for users whose first session was as
-- a viewer.
-- Return the result table ordered by count of streaming sessions, user_id in descending order.

WITH T AS (
  SELECT
    user_id,
    session_type,
    RANK() OVER (PARTITION BY user_id ORDER BY session_start NULLS FIRST) AS rk
  FROM Sessions
)
SELECT
  user_id,
  COUNT(1) AS sessions_count
FROM T AS t
JOIN Sessions AS s
  USING (user_id)
WHERE
  rk = 1 AND t.session_type = 'Viewer' AND s.session_type = 'Streamer'
GROUP BY
  1
ORDER BY
  2 DESC,
  1 DESC;
