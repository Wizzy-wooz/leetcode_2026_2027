-- 1917. Leetcodify Friends Recommendations
-- https://leetcode.com/problems/leetcodify-friends-recommendations/
--
-- Listens(user_id, song_id, day)
-- Friendship(user1_id, user2_id)
-- Recommend friends to Leetcodify users. We recommend user x to user y if:
-- Users x and y are not friends, and
-- Users x and y listened to the same three or more different songs on the same day.
-- Note that friend recommendations are unidirectional, meaning if user x and user y should be
-- recommended to each other, the result table should have both user x recommended to user y and
-- user y recommended to user x. Also, note that the result table should not contain duplicates
-- (i.e., user y should not be recommended to user x multiple times.).
-- Return the result table in any order.

WITH T AS (
  SELECT
    user1_id,
    user2_id
  FROM Friendship
  UNION
  SELECT
    user2_id AS user1_id,
    user1_id AS user2_id
  FROM Friendship
)
SELECT DISTINCT
  l1.user_id,
  l2.user_id AS recommended_id
FROM Listens AS l1, Listens AS l2
WHERE
  l1.day = l2.day
  AND l1.song_id = l2.song_id
  AND l1.user_id <> l2.user_id
  AND NOT EXISTS(
    SELECT
      1
    FROM T AS t
    WHERE
      l1.user_id = t.user1_id AND l2.user_id = t.user2_id
  )
GROUP BY
  l1.day,
  l1.user_id,
  l2.user_id
HAVING
  COUNT(DISTINCT l1.song_id) >= 3;
