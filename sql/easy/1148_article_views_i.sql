-- 1148. Article Views I
-- https://leetcode.com/problems/article-views-i/
--
-- Views(article_id, author_id, viewer_id, view_date)
-- Write a solution to find all the authors that viewed at least one of their own articles.
-- Return the result table sorted by id in ascending order.

SELECT DISTINCT
  author_id AS id
FROM Views
WHERE
  author_id = viewer_id
ORDER BY
  1 NULLS FIRST;
