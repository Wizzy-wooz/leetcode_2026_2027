-- 1164. Product Price at a Given Date
-- https://leetcode.com/problems/product-price-at-a-given-date/
--
-- Products(product_id, new_price, change_date)
-- Initially, all products have price 10.
-- Write a solution to find the prices of all products on the date 2019-08-16.
-- Return the result table in any order.

WITH T AS (
  SELECT DISTINCT
    product_id
  FROM Products
), P AS (
  SELECT
    product_id,
    new_price AS price
  FROM Products
  WHERE
    (product_id, change_date) IN (
      SELECT
        product_id,
        MAX(change_date) AS change_date
      FROM Products
      WHERE
        change_date <= '2019-08-16'
      GROUP BY
        1
    )
)
SELECT
  product_id,
  COALESCE(price, 10) AS price
FROM T
LEFT JOIN P
  USING (product_id);
