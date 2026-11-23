-- 2474. Customers With Strictly Increasing Purchases
-- https://leetcode.com/problems/customers-with-strictly-increasing-purchases/
--
-- Orders(order_id, customer_id, order_date, price)
-- Write a solution to report the IDs of the customers with the total purchases strictly
-- increasing yearly.
-- The total purchases of a customer in one year is the sum of the prices of their orders in that
-- year. If for some year the customer did not make any order, we consider the total purchases 0.
-- The first year to consider for each customer is the year of their first order.
-- The last year to consider for each customer is the year of their last order.
-- Return the result table in any order.

SELECT
  customer_id
FROM (
  SELECT
    customer_id,
    YEAR(CAST(order_date AS DATE)),
    SUM(price) AS total,
    YEAR(CAST(order_date AS DATE)) - RANK() OVER (PARTITION BY customer_id ORDER BY SUM(price) NULLS FIRST) AS rk
  FROM Orders
  GROUP BY
    customer_id,
    YEAR(CAST(order_date AS DATE))
) AS t
GROUP BY
  customer_id
HAVING
  COUNT(DISTINCT rk) = 1;
