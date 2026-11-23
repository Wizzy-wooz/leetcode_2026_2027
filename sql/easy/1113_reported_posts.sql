-- 1113. Reported Posts
-- https://leetcode.com/problems/reported-posts/
--
-- Actions(user_id, post_id, action_date, action, extra)
-- Write a solution to report the number of posts reported yesterday for each report reason.
-- Assume today is 2019-07-05.
-- Return the result table in any order.
-- The result format is in the following example.

SELECT
  extra AS report_reason,
  COUNT(DISTINCT post_id) AS report_count
FROM Actions
WHERE
  action_date = '2019-07-04' AND action = 'report'
GROUP BY
  1;
