-- 3058. Friends With No Mutual Friends
-- https://leetcode.com/problems/friends-with-no-mutual-friends/
--
-- Friends(user_id1, user_id2)
-- Write a solution to find all pairs of users who are friends with each other and have no mutual
-- friends.
-- Return the result table ordered by user_id1, user_id2 in ascending order.

WITH T AS (
  SELECT
    user_id1,
    user_id2
  FROM Friends
  UNION ALL
  SELECT
    user_id2,
    user_id1
  FROM Friends
)
SELECT
  user_id1,
  user_id2
FROM Friends
WHERE
  NOT (user_id1, user_id2) IN (
    SELECT
      t1.user_id1,
      t2.user_id1
    FROM T AS t1
    JOIN T AS t2
      ON t1.user_id2 = t2.user_id2
  )
ORDER BY
  1 NULLS FIRST,
  2 NULLS FIRST;
