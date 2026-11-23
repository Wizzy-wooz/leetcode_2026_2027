-- 3415. Find Products with Three Consecutive Digits
-- https://leetcode.com/problems/find-products-with-three-consecutive-digits/
--
-- Products(product_id, name)
-- Write a solution to find all products whose names contain a sequence of exactly three
-- consecutive digits in a row.
-- Return the result table ordered by product_id in ascending order.
-- Note that the name may contain multiple such sequences, but each should have length three.

SELECT
  product_id,
  name
FROM Products
WHERE
  REGEXP_MATCHES(name, '(^|[^0-9])[0-9]{3}([^0-9]|$)')
ORDER BY
  1 NULLS FIRST;
