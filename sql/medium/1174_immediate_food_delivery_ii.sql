-- 1174. Immediate Food Delivery II
-- https://leetcode.com/problems/immediate-food-delivery-ii/
--
-- Delivery(delivery_id, customer_id, order_date, customer_pref_delivery_date)
-- If the customer's preferred delivery date is the same as the order date, then the order is
-- called immediate; otherwise, it is called scheduled.
-- The first order of a customer is the order with the earliest order date that the customer made.
-- It is guaranteed that a customer has precisely one first order.
-- Write a solution to find the percentage of immediate orders in the first orders of all
-- customers, rounded to 2 decimal places.
-- The result format is in the following example.

SELECT
  ROUND(AVG(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100, 2) AS immediate_percentage
FROM Delivery
WHERE
  (customer_id, order_date) IN (
    SELECT
      customer_id,
      MIN(order_date)
    FROM Delivery
    GROUP BY
      1
  );
