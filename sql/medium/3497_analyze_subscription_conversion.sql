-- 3497. Analyze Subscription Conversion
-- https://leetcode.com/problems/analyze-subscription-conversion/
--
-- UserActivity(user_id, activity_date, activity_type, activity_duration)
-- A subscription service wants to analyze user behavior patterns. The company offers a 7-day free
-- trial, after which users can subscribe to a paid plan or cancel. Write a solution to:
-- Find users who converted from free trial to paid subscription
-- Calculate each user's average daily activity duration during their free trial period (rounded
-- to 2 decimal places)
-- Calculate each user's average daily activity duration during their paid subscription period
-- (rounded to 2 decimal places)
-- Return the result table ordered by user_id in ascending order.

WITH T AS (
  SELECT
    user_id,
    activity_type,
    ROUND(SUM(activity_duration) / NULLIF(COUNT(1), 0), 2) AS duration
  FROM UserActivity
  WHERE
    activity_type <> 'cancelled'
  GROUP BY
    user_id,
    activity_type
), F AS (
  SELECT
    user_id,
    duration AS trial_avg_duration
  FROM T
  WHERE
    activity_type = 'free_trial'
), P AS (
  SELECT
    user_id,
    duration AS paid_avg_duration
  FROM T
  WHERE
    activity_type = 'paid'
)
SELECT
  user_id,
  trial_avg_duration,
  paid_avg_duration
FROM F
JOIN P
  USING (user_id)
ORDER BY
  1 NULLS FIRST;
