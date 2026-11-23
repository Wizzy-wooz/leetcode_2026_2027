-- 3673. Find Zombie Sessions
-- https://leetcode.com/problems/find-zombie-sessions/
--
-- app_events(event_id, user_id, event_timestamp, event_type, session_id, event_value)
-- Write a solution to identify zombie sessions, sessions where users appear active but show
-- abnormal behavior patterns. A session is considered a zombie session if it meets ALL the
-- following criteria:
-- The session duration is more than 30 minutes.
-- Has at least 5 scroll events.
-- The click-to-scroll ratio is less than 0.20 .
-- No purchases were made during the session.
-- Return the result table ordered by scroll_count in descending order, then by session_id in
-- ascending order.

SELECT
  session_id,
  user_id,
  DATE_SUB('MINUTE', MIN(event_timestamp), MAX(event_timestamp)) AS session_duration_minutes,
  SUM(event_type = 'scroll') AS scroll_count
FROM app_events
GROUP BY
  session_id,
  user_id
HAVING
  session_duration_minutes >= 30
  AND SUM(event_type = 'click') / NULLIF(SUM(event_type = 'scroll'), 0) < 0.2
  AND SUM(event_type = 'purchase') = 0
  AND SUM(event_type = 'scroll') >= 5
ORDER BY
  scroll_count DESC,
  session_id NULLS FIRST;
