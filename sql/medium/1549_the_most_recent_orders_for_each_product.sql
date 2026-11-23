-- 1549. The Most Recent Orders for Each Product
-- https://leetcode.com/problems/the-most-recent-orders-for-each-product/
--
-- Customers(customer_id, name)
-- Orders(order_id, order_date, customer_id, product_id)
-- Products(product_id, product_name, price)
-- Write a solution to find the most recent order(s) of each product.
-- Return the result table ordered by product_name in ascending order and in case of a tie by the
-- product_id in ascending order. If there still a tie, order them by order_id in ascending order.

WITH T AS (
  SELECT
    *,
    RANK() OVER (PARTITION BY product_id ORDER BY order_date DESC) AS rk
  FROM Orders
  JOIN Products
    USING (product_id)
)
SELECT
  product_name,
  product_id,
  order_id,
  order_date
FROM T
WHERE
  rk = 1
ORDER BY
  1 NULLS FIRST,
  2 NULLS FIRST,
  3 NULLS FIRST;
