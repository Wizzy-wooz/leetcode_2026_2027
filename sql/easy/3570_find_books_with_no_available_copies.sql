-- 3570. Find Books with No Available Copies
-- https://leetcode.com/problems/find-books-with-no-available-copies/
--
-- library_books(book_id, title, author, genre, publication_year, total_copies)
-- borrowing_records(record_id, book_id, borrower_name, borrow_date, return_date)
-- Write a solution to find all books that are currently borrowed (not returned) and have zero
-- copies available in the library.
-- A book is considered currently borrowed if there exists a borrowing record with a NULL
-- return_date
-- Return the result table ordered by current borrowers in descending order, then by book title in
-- ascending order.

WITH T AS (
  SELECT
    book_id,
    COUNT(1) AS current_borrowers
  FROM borrowing_records
  WHERE
    return_date IS NULL
  GROUP BY
    1
)
SELECT
  book_id,
  title,
  author,
  genre,
  publication_year,
  current_borrowers
FROM library_books
JOIN T
  USING (book_id)
WHERE
  current_borrowers = total_copies
ORDER BY
  6 DESC,
  2 NULLS FIRST;
