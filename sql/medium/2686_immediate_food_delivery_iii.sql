-- 2686. Immediate Food Delivery III
-- https://leetcode.com/problems/immediate-food-delivery-iii/
--
-- Delivery(delivery_id, customer_id, order_date, customer_pref_delivery_date)
-- If the customer's preferred delivery date is the same as the order date, then the order is
-- called immediate, otherwise, it is scheduled.
-- Write a solution to find the percentage of immediate orders on each unique order_date, rounded
-- to 2 decimal places.
-- Return the result table ordered by order_date in ascending order.
-- The result format is in the following example.

SELECT
  order_date,
  ROUND(
    100 * SUM(CASE WHEN customer_pref_delivery_date = order_date THEN 1 ELSE 0 END) / NULLIF(COUNT(*), 0),
    2
  ) AS immediate_percentage
FROM Delivery
GROUP BY
  order_date
ORDER BY
  order_date NULLS FIRST;
