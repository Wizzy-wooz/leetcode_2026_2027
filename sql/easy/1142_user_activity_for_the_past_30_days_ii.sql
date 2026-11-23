-- 1142. User Activity for the Past 30 Days II
-- https://leetcode.com/problems/user-activity-for-the-past-30-days-ii/
--
-- Activity(user_id, session_id, activity_date, activity_type)
-- Write a solution to find the average number of sessions per user for a period of 30 days ending
-- 2019-07-27 inclusively, rounded to 2 decimal places. The sessions we want to count for a user
-- are those with at least one activity in that time period.
-- The result format is in the following example.

WITH T AS (
  SELECT
    COUNT(DISTINCT session_id) AS sessions
  FROM Activity
  WHERE
    activity_date <= '2019-07-27'
    AND DATE_DIFF('DAY', activity_date, CAST('2019-07-27' AS DATE)) < 30
  GROUP BY
    user_id
)
SELECT
  COALESCE(ROUND(AVG(sessions), 2), 0) AS average_sessions_per_user
FROM T;
