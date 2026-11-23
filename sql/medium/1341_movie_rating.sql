-- 1341. Movie Rating
-- https://leetcode.com/problems/movie-rating/
--
-- Movies(movie_id, title)
-- Users(user_id, name)
-- MovieRating(movie_id, user_id, rating, created_at)
-- Write a solution to:
-- Find the name of the user who has rated the greatest number of movies. In case of a tie, return
-- the lexicographically smaller user name.
-- Find the movie name with the highest average rating in February 2020. In case of a tie, return
-- the lexicographically smaller movie name.
-- The result format is in the following example.

(
  SELECT
    name AS results
  FROM Users
  JOIN MovieRating
    USING (user_id)
  GROUP BY
    user_id,
    name
  ORDER BY
    COUNT(1) DESC,
    name NULLS FIRST
  LIMIT 1
)
UNION ALL
(
  SELECT
    title
  FROM MovieRating
  JOIN Movies
    USING (movie_id)
  WHERE
    STRFTIME(CAST(created_at AS TIMESTAMP), '%Y-%m') = '2020-02'
  GROUP BY
    movie_id,
    title
  ORDER BY
    AVG(rating) DESC,
    title NULLS FIRST
  LIMIT 1
);
