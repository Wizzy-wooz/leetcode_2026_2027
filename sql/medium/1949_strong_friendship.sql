-- 1949. Strong Friendship
-- https://leetcode.com/problems/strong-friendship/
--
-- Friendship(user1_id, user2_id)
-- A friendship between a pair of friends x and y is strong if x and y have at least three common
-- friends.
-- Write a solution to find all the strong friendships.
-- Note that the result table should not contain duplicates with user1_id < user2_id.
-- Return the result table in any order.

WITH t AS (
  SELECT
    *
  FROM Friendship
  UNION ALL
  SELECT
    user2_id,
    user1_id
  FROM Friendship
)
SELECT
  t1.user1_id,
  t1.user2_id,
  COUNT(1) AS common_friend
FROM t AS t1
JOIN t AS t2
  ON t1.user2_id = t2.user1_id
JOIN t AS t3
  ON t1.user1_id = t3.user1_id
WHERE
  t3.user2_id = t2.user2_id AND t1.user1_id < t1.user2_id
GROUP BY
  t1.user1_id,
  t1.user2_id
HAVING
  COUNT(1) >= 3;
