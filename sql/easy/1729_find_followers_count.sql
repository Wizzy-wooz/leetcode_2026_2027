-- 1729. Find Followers Count
-- https://leetcode.com/problems/find-followers-count/
--
-- Followers(user_id, follower_id)
-- Write a solution that will, for each user, return the number of followers.
-- Return the result table ordered by user_id in ascending order.
-- The result format is in the following example.

SELECT
  user_id,
  COUNT(1) AS followers_count
FROM Followers
GROUP BY
  1
ORDER BY
  1 NULLS FIRST;
