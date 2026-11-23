-- 1193. Monthly Transactions I
-- https://leetcode.com/problems/monthly-transactions-i/
--
-- Transactions(id, country, state, amount, trans_date)
-- Write an SQL query to find for each month and country, the number of transactions and their
-- total amount, the number of approved transactions and their total amount.
-- Return the result table in any order.

SELECT
  STRFTIME(CAST(trans_date AS TIMESTAMP), '%Y-%m') AS month,
  country,
  COUNT(1) AS trans_count,
  SUM(state = 'approved') AS approved_count,
  SUM(amount) AS trans_total_amount,
  SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY
  1,
  2;
