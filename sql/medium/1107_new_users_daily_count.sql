-- 1107. New Users Daily Count
-- https://leetcode.com/problems/new-users-daily-count/
--
-- Traffic(user_id, activity, activity_date)
-- Write a solution to reports for every date within at most 90 days from today, the number of
-- users that logged in for the first time on that date. Assume today is 2019-06-30.
-- Return the result table in any order.

WITH T AS (
  SELECT
    user_id,
    MIN(activity_date) OVER (PARTITION BY user_id) AS login_date
  FROM Traffic
  WHERE
    activity = 'login'
)
SELECT
  login_date,
  COUNT(DISTINCT user_id) AS user_count
FROM T
WHERE
  DATE_DIFF('DAY', login_date, CAST('2019-06-30' AS DATE)) <= 90
GROUP BY
  1;
