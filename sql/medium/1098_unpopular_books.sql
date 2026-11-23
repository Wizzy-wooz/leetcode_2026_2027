-- 1098. Unpopular Books
-- https://leetcode.com/problems/unpopular-books/
--
-- Books(book_id, name, available_from)
-- Orders(order_id, book_id, quantity, dispatch_date)
-- Write a solution to report the books that have sold less than 10 copies in the last year,
-- excluding books that have been available for less than one month from today. Assume today is
-- 2019-06-23.
-- Return the result table in any order.

SELECT
  book_id,
  name
FROM Books
LEFT JOIN Orders
  USING (book_id)
WHERE
  available_from < '2019-05-23'
GROUP BY
  1,
  name
HAVING
  SUM(CASE WHEN dispatch_date >= '2018-06-23' THEN quantity ELSE 0 END) < 10;
