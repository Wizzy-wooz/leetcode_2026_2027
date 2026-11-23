-- 1132. Reported Posts II
-- https://leetcode.com/problems/reported-posts-ii/
--
-- Actions(user_id, post_id, action_date, action, extra)
-- Removals(post_id, remove_date)
-- Write a solution to find the average daily percentage of posts that got removed after being
-- reported as spam, rounded to 2 decimal places.
-- The result format is in the following example.

WITH T AS (
  SELECT
    COUNT(DISTINCT t2.post_id) / NULLIF(COUNT(DISTINCT t1.post_id), 0) * 100 AS percent
  FROM Actions AS t1
  LEFT JOIN Removals AS t2
    ON t1.post_id = t2.post_id
  WHERE
    extra = 'spam'
  GROUP BY
    action_date
)
SELECT
  ROUND(AVG(percent), 2) AS average_daily_percent
FROM T;
