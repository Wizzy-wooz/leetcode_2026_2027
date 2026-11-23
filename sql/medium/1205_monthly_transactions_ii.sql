-- 1205. Monthly Transactions II
-- https://leetcode.com/problems/monthly-transactions-ii/
--
-- Transactions(id, country, state, amount, trans_date)
-- Chargebacks(trans_id, trans_date)
-- Write a solution to find for each month and country: the number of approved transactions and
-- their total amount, the number of chargebacks, and their total amount.
-- Note: In your solution, given the month and country, ignore rows with all zeros.
-- Return the result table in any order.

WITH T AS (
  SELECT
    *
  FROM Transactions
  UNION
  SELECT
    id,
    country,
    'chargeback',
    amount,
    c.trans_date
  FROM Transactions AS t
  JOIN Chargebacks AS c
    ON t.id = c.trans_id
)
SELECT
  STRFTIME(CAST(trans_date AS TIMESTAMP), '%Y-%m') AS month,
  country,
  SUM(state = 'approved') AS approved_count,
  SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_amount,
  SUM(state = 'chargeback') AS chargeback_count,
  SUM(CASE WHEN state = 'chargeback' THEN amount ELSE 0 END) AS chargeback_amount
FROM T
GROUP BY
  1,
  2
HAVING
  approved_amount OR chargeback_amount;
