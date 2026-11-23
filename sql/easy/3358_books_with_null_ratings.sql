-- 3358. Books with NULL Ratings
-- https://leetcode.com/problems/books-with-null-ratings/
--
-- books(book_id, title, author, published_year, rating)
-- Write a solution to find all books that have not been rated yet (i.e., have a NULL rating).
-- Return the result table ordered by book_id in ascending order.

SELECT
  book_id,
  title,
  author,
  published_year
FROM books
WHERE
  rating IS NULL
ORDER BY
  1 NULLS FIRST;
