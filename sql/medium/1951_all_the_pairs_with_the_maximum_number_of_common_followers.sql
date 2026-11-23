-- 1951. All the Pairs With the Maximum Number of Common Followers
-- https://leetcode.com/problems/all-the-pairs-with-the-maximum-number-of-common-followers/
--
-- Relations(user_id, follower_id)
-- Write a solution to find all the pairs of users with the maximum number of common followers. In
-- other words, if the maximum number of common followers between any two users is maxCommon, then
-- you have to return all pairs of users that have maxCommon common followers.
-- The result table should contain the pairs user1_id and user2_id where user1_id < user2_id.
-- Return the result table in any order.

WITH t AS (
  SELECT
    r1.user_id AS user1_id,
    r2.user_id AS user2_id,
    RANK() OVER (ORDER BY COUNT(1) DESC) AS rk
  FROM Relations AS r1
  JOIN Relations AS r2
    ON r1.follower_id = r2.follower_id AND r1.user_id < r2.user_id
  GROUP BY
    r1.user_id,
    r2.user_id
)
SELECT
  user1_id,
  user2_id
FROM t
WHERE
  rk = 1;
