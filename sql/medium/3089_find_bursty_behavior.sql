-- 3089. Find Bursty Behavior
-- https://leetcode.com/problems/find-bursty-behavior/
--
-- Posts(post_id, user_id, post_date)
-- Write a solution to find users who demonstrate bursty behavior in their posting patterns during
-- February 2024. Bursty behavior is defined as any period of 7 consecutive days where a user's
-- posting frequency is at least twice to their average weekly posting frequency for February
-- 2024.
-- Note: Only include the dates from February 1 to February 28 in your analysis, which means you
-- should count February as having exactly 4 weeks.
-- Return the result table orderd by user_id in ascending order.

WITH P AS (
  SELECT
    p1.user_id AS user_id,
    COUNT(1) AS cnt
  FROM Posts AS p1
  JOIN Posts AS p2
    ON p1.user_id = p2.user_id
    AND p2.post_date BETWEEN p1.post_date AND p1.post_date + INTERVAL '6' DAY
  GROUP BY
    p1.user_id,
    p1.post_id
), T AS (
  SELECT
    user_id,
    COUNT(1) / NULLIF(4, 0) AS avg_weekly_posts
  FROM Posts
  WHERE
    post_date BETWEEN '2024-02-01' AND '2024-02-28'
  GROUP BY
    1
)
SELECT
  user_id,
  MAX(cnt) AS max_7day_posts,
  avg_weekly_posts
FROM P
JOIN T
  USING (user_id)
GROUP BY
  1,
  avg_weekly_posts
HAVING
  max_7day_posts >= avg_weekly_posts * 2
ORDER BY
  1 NULLS FIRST;
