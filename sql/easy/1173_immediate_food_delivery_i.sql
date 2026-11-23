-- 1173. Immediate Food Delivery I
-- https://leetcode.com/problems/immediate-food-delivery-i/
--
-- Delivery(delivery_id, customer_id, order_date, customer_pref_delivery_date)
-- If the customer's preferred delivery date is the same as the order date, then the order is
-- called immediate; otherwise, it is called scheduled.
-- Write a solution to find the percentage of immediate orders in the table, rounded to 2 decimal
-- places.

SELECT
  ROUND(SUM(order_date = customer_pref_delivery_date) / NULLIF(COUNT(1), 0) * 100, 2) AS immediate_percentage
FROM Delivery;
