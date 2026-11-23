-- 620. Not Boring Movies
-- https://leetcode.com/problems/not-boring-movies/
--
-- Cinema(id, movie, description, rating)
-- Write a solution to report the movies with an odd-numbered ID and a description that is not
-- "boring".
-- Return the result table ordered by rating in descending order.
-- The result format is in the following example.

SELECT
  *
FROM Cinema
WHERE
  description <> 'boring' AND id & 1 = 1
ORDER BY
  4 DESC;
