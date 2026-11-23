-- 1264. Page Recommendations
-- https://leetcode.com/problems/page-recommendations/
--
-- Friendship(user1_id, user2_id)
-- Likes(user_id, page_id)
-- Write a solution to recommend pages to the user with user_id = 1 using the pages that your
-- friends liked. It should not recommend pages you already liked.
-- Return result table in any order without duplicates.
-- The result format is in the following example.

WITH T AS (
  SELECT
    user1_id AS user_id
  FROM Friendship
  WHERE
    user2_id = 1
  UNION
  SELECT
    user2_id AS user_id
  FROM Friendship
  WHERE
    user1_id = 1
)
SELECT DISTINCT
  page_id AS recommended_page
FROM T
JOIN Likes
  USING (user_id)
WHERE
  NOT page_id IN (
    SELECT
      page_id
    FROM Likes
    WHERE
      user_id = 1
  );
