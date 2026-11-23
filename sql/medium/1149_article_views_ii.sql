-- 1149. Article Views II
-- https://leetcode.com/problems/article-views-ii/
--
-- Views(article_id, author_id, viewer_id, view_date)
-- Write a solution to find all the people who viewed more than one article on the same date.
-- Return the result table sorted by id in ascending order.

SELECT DISTINCT
  viewer_id AS id
FROM Views
GROUP BY
  viewer_id,
  view_date
HAVING
  COUNT(DISTINCT article_id) > 1
ORDER BY
  1 NULLS FIRST;
