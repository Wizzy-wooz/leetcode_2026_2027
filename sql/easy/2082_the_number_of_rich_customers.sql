-- 2082. The Number of Rich Customers
-- https://leetcode.com/problems/the-number-of-rich-customers/
--
-- Store(bill_id, customer_id, amount)
-- Write a solution to report the number of customers who had at least one bill with an amount
-- strictly greater than 500.

SELECT
  COUNT(DISTINCT customer_id) AS rich_count
FROM Store
WHERE
  amount > 500;
