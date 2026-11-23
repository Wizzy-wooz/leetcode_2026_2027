-- 2893. Calculate Orders Within Each Interval
-- https://leetcode.com/problems/calculate-orders-within-each-interval/
--
-- Orders(minute, order_count)
-- Write a query to calculate total orders within each interval. Each interval is defined as a
-- combination of 6 minutes.
-- Minutes 1 to 6 fall within interval 1, while minutes 7 to 12 belong to interval 2, and so
-- forth.
-- Return the result table ordered by interval_no in ascending order.

SELECT
  (
    minute + 5
  ) // 6 AS interval_no,
  SUM(order_count) AS total_orders
FROM Orders
GROUP BY
  1
ORDER BY
  1 NULLS FIRST;
