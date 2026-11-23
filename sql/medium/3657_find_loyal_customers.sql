-- 3657. Find Loyal Customers
-- https://leetcode.com/problems/find-loyal-customers/
--
-- customer_transactions(transaction_id, customer_id, transaction_date, amount, transaction_type)
-- Write a solution to find loyal customers. A customer is considered loyal if they meet ALL the
-- following criteria:
-- Made at least 3 purchase transactions.
-- Have been active for at least 30 days.
-- Their refund rate is less than 20% .
-- Refund rate is the proportion of transactions that are refunds, calculated as the number of
-- refund transactions divided by the total number of transactions (purchases plus refunds).
-- Return the result table ordered by customer_id in ascending order.

SELECT
  customer_id
FROM customer_transactions
GROUP BY
  1
HAVING
  COUNT(1) >= 3
  AND SUM(transaction_type = 'refund') / NULLIF(COUNT(1), 0) < 0.2
  AND DATE_DIFF('DAY', MIN(transaction_date), MAX(transaction_date)) >= 30
ORDER BY
  1 NULLS FIRST;
