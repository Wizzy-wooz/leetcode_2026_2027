-- 1241. Number of Comments per Post
-- https://leetcode.com/problems/number-of-comments-per-post/
--
-- Submissions(sub_id, parent_id)
-- Write a solution to find the number of comments per post. The result table should contain
-- post_id and its corresponding number_of_comments.
-- The Submissions table may contain duplicate comments. You should count the number of unique
-- comments per post.
-- The Submissions table may contain duplicate posts. You should treat them as one post.
-- The result table should be ordered by post_id in ascending order.

WITH t AS (
  SELECT DISTINCT
    s1.sub_id AS post_id,
    s2.sub_id AS sub_id
  FROM Submissions AS s1
  LEFT JOIN Submissions AS s2
    ON s1.sub_id = s2.parent_id
  WHERE
    s1.parent_id IS NULL
)
SELECT
  post_id,
  COUNT(sub_id) AS number_of_comments
FROM t
GROUP BY
  post_id
ORDER BY
  post_id NULLS FIRST;
