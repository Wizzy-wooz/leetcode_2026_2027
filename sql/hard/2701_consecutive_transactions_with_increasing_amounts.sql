-- 2701. Consecutive Transactions with Increasing Amounts
-- https://leetcode.com/problems/consecutive-transactions-with-increasing-amounts/
--
-- Transactions(transaction_id, customer_id, transaction_date, amount)
-- Write an SQL query to find the customers who have made consecutive transactions with increasing
-- amount for at least three consecutive days. Include the customer_id, start date of the
-- consecutive transactions period and the end date of the consecutive transactions period. There
-- can be multiple consecutive transactions by a customer.
-- Return the result table ordered by customer_id, consecutive_start, consecutive_end in ascending
-- order.

WITH T AS (
  SELECT
    t1.*,
    SUM(CASE WHEN t2.customer_id IS NULL THEN 1 ELSE 0 END) OVER (ORDER BY t1.customer_id NULLS FIRST, t1.transaction_date NULLS FIRST) AS s
  FROM Transactions AS t1
  LEFT JOIN Transactions AS t2
    ON t1.customer_id = t2.customer_id
    AND t1.amount > t2.amount
    AND DATE_DIFF('DAY', t2.transaction_date, t1.transaction_date) = 1
)
SELECT
  customer_id,
  MIN(transaction_date) AS consecutive_start,
  MAX(transaction_date) AS consecutive_end
FROM T
GROUP BY
  customer_id,
  s
HAVING
  COUNT(1) >= 3
ORDER BY
  customer_id NULLS FIRST;
