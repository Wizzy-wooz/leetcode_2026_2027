-- 1596. The Most Frequently Ordered Products for Each Customer
-- https://leetcode.com/problems/the-most-frequently-ordered-products-for-each-customer/
--
-- Customers(customer_id, name)
-- Orders(order_id, order_date, customer_id, product_id)
-- Products(product_id, product_name, price)
-- Write a solution to find the most frequently ordered product(s) for each customer.
-- The result table should have the product_id and product_name for each customer_id who ordered
-- at least one order.
-- Return the result table in any order.

WITH T AS (
  SELECT
    customer_id,
    product_id,
    RANK() OVER (PARTITION BY customer_id ORDER BY COUNT(1) DESC) AS rk
  FROM Orders
  GROUP BY
    1,
    2
)
SELECT
  customer_id,
  product_id,
  product_name
FROM T
JOIN Products
  USING (product_id)
WHERE
  rk = 1;
