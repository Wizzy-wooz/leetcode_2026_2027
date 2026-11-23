-- 614. Second Degree Follower
-- https://leetcode.com/problems/second-degree-follower/
--
-- Follow(followee, follower)
-- A second-degree follower is a user who:
-- follows at least one user, and
-- is followed by at least one user.
-- Write a solution to report the second-degree users and the number of their followers.
-- Return the result table ordered by follower in alphabetical order.

WITH T AS (
  SELECT
    f1.follower AS follower,
    f2.follower AS followee
  FROM Follow AS f1
  JOIN Follow AS f2
    ON f1.follower = f2.followee
)
SELECT
  follower,
  COUNT(DISTINCT followee) AS num
FROM T
GROUP BY
  1
ORDER BY
  1 NULLS FIRST;
