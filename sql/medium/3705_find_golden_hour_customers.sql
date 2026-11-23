-- 3705. Find Golden Hour Customers
-- https://leetcode.com/problems/find-golden-hour-customers/
--
-- restaurant_orders(order_id, customer_id, order_timestamp, order_amount, payment_method, order_rating)
-- Write a solution to find golden hour customers - customers who consistently order during peak
-- hours and provide high satisfaction. A customer is a golden hour customer if they meet ALL the
-- following criteria:
-- Made at least 3 orders.
-- At least 60% of their orders are during peak hours (11:00-14:00 or 18:00-21:00).
-- Their average rating for rated orders is at least 4.0, round it to 2 decimal places.
-- Have rated at least 50% of their orders.
-- Return the result table ordered by average_rating in descending order, then by
-- customer_id​​​​​​​ in descending order.

SELECT
  customer_id,
  COUNT(1) AS total_orders,
  ROUND(
    SUM(
      CAST(order_timestamp AS TIME) BETWEEN '11:00:00' AND '14:00:00'
      OR CAST(order_timestamp AS TIME) BETWEEN '18:00:00' AND '21:00:00'
    ) / NULLIF(COUNT(1), 0) * 100
  ) AS peak_hour_percentage,
  ROUND(AVG(order_rating), 2) AS average_rating
FROM restaurant_orders
GROUP BY
  customer_id
HAVING
  total_orders >= 3
  AND 5 * SUM(
    CAST(order_timestamp AS TIME) BETWEEN '11:00:00' AND '14:00:00'
    OR CAST(order_timestamp AS TIME) BETWEEN '18:00:00' AND '21:00:00'
  ) >= 3 * COUNT(1)
  AND average_rating >= 4.0
  AND SUM(NOT order_rating IS NULL) / NULLIF(total_orders, 0) >= 0.5
ORDER BY
  average_rating DESC,
  customer_id DESC;
