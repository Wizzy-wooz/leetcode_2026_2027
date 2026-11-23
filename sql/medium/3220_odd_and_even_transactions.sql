-- 3220. Odd and Even Transactions
-- https://leetcode.com/problems/odd-and-even-transactions/
--
-- transactions(transaction_id, amount, transaction_date)
-- Write a solution to find the sum of amounts for odd and even transactions for each day. If
-- there are no odd or even transactions for a specific date, display as 0.
-- Return the result table ordered by transaction_date in ascending order.

SELECT
  transaction_date,
  SUM(CASE WHEN amount % NULLIF(2, 0) = 1 THEN amount ELSE 0 END) AS odd_sum,
  SUM(CASE WHEN amount % NULLIF(2, 0) = 0 THEN amount ELSE 0 END) AS even_sum
FROM transactions
GROUP BY
  1
ORDER BY
  1 NULLS FIRST;
