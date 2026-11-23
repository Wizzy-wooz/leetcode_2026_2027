-- 2720. Popularity Percentage
-- https://leetcode.com/problems/popularity-percentage/
--
-- Friends(user1, user2)
-- Write a solution to find the popularity percentage for each user on Meta/Facebook. The
-- popularity percentage is defined as the total number of friends the user has divided by the
-- total number of users on the platform, then converted into a percentage by multiplying by 100,
-- rounded to 2 decimal places.
-- Return the result table ordered by user1 in ascending order.

WITH F AS (
  SELECT
    *
  FROM Friends
  UNION
  SELECT
    user2,
    user1
  FROM Friends
), T AS (
  SELECT
    COUNT(DISTINCT user1) AS cnt
  FROM F
)
SELECT DISTINCT
  user1,
  ROUND(
    (
      COUNT(1) OVER (PARTITION BY user1)
    ) * 100 / NULLIF((
      SELECT
        cnt
      FROM T
    ), 0),
    2
  ) AS percentage_popularity
FROM F
ORDER BY
  1 NULLS FIRST;
