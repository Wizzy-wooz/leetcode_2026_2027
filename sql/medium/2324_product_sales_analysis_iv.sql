-- 2324. Product Sales Analysis IV
-- https://leetcode.com/problems/product-sales-analysis-iv/
--
-- Sales(sale_id, product_id, user_id, quantity)
-- Product(product_id, price)
-- Write a solution that reports for each user the product id on which the user spent the most
-- money. In case the same user spent the most money on two or more products, report all of them.
-- Return the resulting table in any order.
-- The result format is in the following example.

WITH T AS (
  SELECT
    user_id,
    product_id,
    RANK() OVER (PARTITION BY user_id ORDER BY SUM(quantity * price) DESC) AS rk
  FROM Sales
  JOIN Product
    USING (product_id)
  GROUP BY
    1,
    2
)
SELECT
  user_id,
  product_id
FROM T
WHERE
  rk = 1;
