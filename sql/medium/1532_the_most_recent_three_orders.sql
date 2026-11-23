-- 1532. The Most Recent Three Orders
-- https://leetcode.com/problems/the-most-recent-three-orders/
--
-- Customers(customer_id, name)
-- Orders(order_id, order_date, customer_id, cost)
-- Write a solution to find the most recent three orders of each user. If a user ordered less than
-- three orders, return all of their orders.
-- Return the result table ordered by customer_name in ascending order and in case of a tie by the
-- customer_id in ascending order. If there is still a tie, order them by order_date in descending
-- order.
-- The result format is in the following example.

WITH T AS (
  SELECT
    *,
    ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS rk
  FROM Orders
  JOIN Customers
    USING (customer_id)
)
SELECT
  name AS customer_name,
  customer_id,
  order_id,
  order_date
FROM T
WHERE
  rk <= 3
ORDER BY
  1 NULLS FIRST,
  2 NULLS FIRST,
  4 DESC;
