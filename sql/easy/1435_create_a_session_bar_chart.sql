-- 1435. Create a Session Bar Chart
-- https://leetcode.com/problems/create-a-session-bar-chart/
--
-- Sessions(session_id, duration)
-- You want to know how long a user visits your application. You decided to create bins of
-- "[0-5>", "[5-10>", "[10-15>", and "15 minutes or more" and count the number of sessions on it.
-- Write a solution to report the (bin, total).
-- Return the result table in any order.
-- The result format is in the following example.

SELECT
  '[0-5>' AS bin,
  COUNT(1) AS total
FROM Sessions
WHERE
  duration < 300
UNION
SELECT
  '[5-10>' AS bin,
  COUNT(1) AS total
FROM Sessions
WHERE
  300 <= duration AND duration < 600
UNION
SELECT
  '[10-15>' AS bin,
  COUNT(1) AS total
FROM Sessions
WHERE
  600 <= duration AND duration < 900
UNION
SELECT
  '15 or more' AS bin,
  COUNT(1) AS total
FROM Sessions
WHERE
  900 <= duration;
