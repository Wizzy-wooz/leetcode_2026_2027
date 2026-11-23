-- 1565. Unique Orders and Customers Per Month
-- https://leetcode.com/problems/unique-orders-and-customers-per-month/
--
-- Orders(order_id, order_date, customer_id, invoice)
-- Write a solution to find the number of unique orders and the number of unique customers with
-- invoices > $20 for each different month.
-- Return the result table sorted in any order.
-- The result format is in the following example.

SELECT
  STRFTIME(CAST(order_date AS TIMESTAMP), '%Y-%m') AS month,
  COUNT(order_id) AS order_count,
  COUNT(DISTINCT customer_id) AS customer_count
FROM Orders
WHERE
  invoice > 20
GROUP BY
  1;
