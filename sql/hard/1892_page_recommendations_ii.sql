-- 1892. Page Recommendations II
-- https://leetcode.com/problems/page-recommendations-ii/
--
-- Friendship(user1_id, user2_id)
-- Likes(user_id, page_id)
-- You are implementing a page recommendation system for a social media website. Your system will
-- recommend a page to user_id if the page is liked by at least one friend of user_id and is not
-- liked by user_id.
-- Write a solution to find all the possible page recommendations for every user. Each
-- recommendation should appear as a row in the result table with these columns:
-- user_id: The ID of the user that your system is making the recommendation to.
-- page_id: The ID of the page that will be recommended to user_id.
-- friends_likes: The number of the friends of user_id that like page_id.
-- Return the result table in any order.

WITH S AS (
  SELECT
    *
  FROM Friendship
  UNION
  SELECT
    user2_id,
    user1_id
  FROM Friendship
)
SELECT
  user1_id AS user_id,
  page_id,
  COUNT(1) AS friends_likes
FROM S AS s
LEFT JOIN Likes AS l
  ON s.user2_id = l.user_id
WHERE
  NOT EXISTS(
    SELECT
      1
    FROM Likes AS l2
    WHERE
      user1_id = l2.user_id AND l.page_id = l2.page_id
  )
GROUP BY
  user1_id,
  page_id;
