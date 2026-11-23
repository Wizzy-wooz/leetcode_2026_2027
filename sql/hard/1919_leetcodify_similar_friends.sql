-- 1919. Leetcodify Similar Friends
-- https://leetcode.com/problems/leetcodify-similar-friends/
--
-- Listens(user_id, song_id, day)
-- Friendship(user1_id, user2_id)
-- Write a solution to report the similar friends of Leetcodify users. A user x and user y are
-- similar friends if:
-- Users x and y are friends, and
-- Users x and y listened to the same three or more different songs on the same day.
-- Return the result table in any order. Note that you must return the similar pairs of friends
-- the same way they were represented in the input (i.e., always user1_id < user2_id).
-- The result format is in the following example.

SELECT DISTINCT
  user1_id,
  user2_id
FROM Friendship AS f
LEFT JOIN Listens AS l1
  ON user1_id = l1.user_id
LEFT JOIN Listens AS l2
  ON user2_id = l2.user_id
WHERE
  l1.song_id = l2.song_id AND l1.day = l2.day
GROUP BY
  1,
  2,
  l1.day
HAVING
  COUNT(DISTINCT l1.song_id) >= 3;
