-- 3642. Find Books with Polarized Opinions
-- https://leetcode.com/problems/find-books-with-polarized-opinions/
--
-- books(book_id, title, author, genre, pages)
-- reading_sessions(session_id, book_id, reader_name, pages_read, session_rating)
-- Write a solution to find books that have polarized opinions - books that receive both very high
-- ratings and very low ratings from different readers.
-- A book has polarized opinions if it has at least one rating ≥ 4 and at least one rating ≤ 2
-- Only consider books that have at least 5 reading sessions
-- Calculate the rating spread as (highest_rating - lowest_rating)
-- Calculate the polarization score as the number of extreme ratings (ratings ≤ 2 or ≥ 4) divided
-- by total sessions
-- Only include books where polarization score ≥ 0.6 (at least 60% extreme ratings)
-- Return the result table ordered by polarization score in descending order, then by title in
-- descending order. The polarization score should be rounded to 2 decimal places.

SELECT
  book_id,
  title,
  author,
  genre,
  pages,
  (
    MAX(session_rating) - MIN(session_rating)
  ) AS rating_spread,
  ROUND((
    SUM(session_rating <= 2) + SUM(session_rating >= 4)
  ) / NULLIF(COUNT(1), 0), 2) AS polarization_score
FROM books
JOIN reading_sessions
  USING (book_id)
GROUP BY
  book_id,
  title,
  author,
  genre,
  pages
HAVING
  COUNT(1) >= 5
  AND MAX(session_rating) >= 4
  AND MIN(session_rating) <= 2
  AND 5 * (
    SUM(session_rating <= 2) + SUM(session_rating >= 4)
  ) >= 3 * COUNT(1)
ORDER BY
  polarization_score DESC,
  title DESC;
