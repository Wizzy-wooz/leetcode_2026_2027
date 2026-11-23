-- 1369. Get the Second Most Recent Activity
-- https://leetcode.com/problems/get-the-second-most-recent-activity/
--
-- UserActivity(username, activity, startDate, endDate)
-- Write a solution to show the second most recent activity of each user.
-- If the user only has one activity, return that one. A user cannot perform more than one
-- activity at the same time.
-- Return the result table in any order.

SELECT
  username,
  activity,
  startdate,
  enddate
FROM (
  SELECT
    *,
    RANK() OVER (PARTITION BY username ORDER BY startdate DESC) AS rk,
    COUNT(username) OVER (PARTITION BY username) AS cnt
  FROM UserActivity
) AS a
WHERE
  a.rk = 2 OR a.cnt = 1;
