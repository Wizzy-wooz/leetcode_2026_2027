-- 2985. Calculate Compressed Mean
-- https://leetcode.com/problems/calculate-compressed-mean/
--
-- Orders(order_id, item_count, order_occurrences)
-- Write a solution to calculate the average number of items per order, rounded to 2 decimal
-- places.
-- Return the result table in any order.

SELECT
  ROUND(SUM(item_count * order_occurrences) / NULLIF(SUM(order_occurrences), 0), 2) AS average_items_per_order
FROM Orders;
