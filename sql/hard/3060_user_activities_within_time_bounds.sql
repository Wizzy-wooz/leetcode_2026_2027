-- 3060. User Activities within Time Bounds
-- https://leetcode.com/problems/user-activities-within-time-bounds/
--
-- Sessions(user_id, session_start, session_end, session_id, session_type)
-- Write a solution to find the the users who have had at least two session of the same type
-- (either 'Viewer' or 'Streamer') with a maximum gap of 12 hours between sessions.
-- Return the result table ordered by user_id in ascending order.

WITH T AS (
  SELECT
    user_id,
    session_start,
    LAG(session_end) OVER (PARTITION BY user_id, session_type ORDER BY session_end NULLS FIRST) AS prev_session_end
  FROM Sessions
)
SELECT DISTINCT
  user_id
FROM T
WHERE
  session_start <= (
    prev_session_end + INTERVAL '12' HOUR
  );
