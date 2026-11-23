-- 1867. Orders With Maximum Quantity Above Average
-- https://leetcode.com/problems/orders-with-maximum-quantity-above-average/
--
-- OrdersDetails(order_id, product_id, quantity)
-- You are running an e-commerce site that is looking for imbalanced orders. An imbalanced order
-- is one whose maximum quantity is strictly greater than the average quantity of every order
-- (including itself).
-- The average quantity of an order is calculated as (total quantity of all products in the order)
-- / (number of different products in the order). The maximum quantity of an order is the highest
-- quantity of any single product in the order.
-- Write a solution to find the order_id of all imbalanced orders.
-- Return the result table in any order.
-- The result format is in the following example.

WITH t AS (
  SELECT
    order_id,
    MAX(quantity) AS max_quantity,
    SUM(quantity) / NULLIF(COUNT(1), 0) AS avg_quantity
  FROM OrdersDetails
  GROUP BY
    order_id
)
SELECT
  order_id
FROM t
WHERE
  max_quantity > (
    SELECT
      MAX(avg_quantity)
    FROM t
  );
