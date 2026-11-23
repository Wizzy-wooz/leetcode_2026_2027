-- 2986. Find Third Transaction
-- https://leetcode.com/problems/find-third-transaction/
--
-- Transactions(user_id, spend, transaction_date)
-- Write a solution to find the third transaction (if they have at least three transactions) of
-- every user, where the spending on the preceding two transactions is lower than the spending on
-- the third transaction.
-- Return the result table by user_id in ascending order.

WITH T AS (
  SELECT
    *,
    RANK() OVER (PARTITION BY user_id ORDER BY transaction_date NULLS FIRST) AS rk,
    spend > (
      LAG(spend) OVER (PARTITION BY user_id ORDER BY transaction_date NULLS FIRST)
    )
    AND spend > (
      LAG(spend, 2) OVER (PARTITION BY user_id ORDER BY transaction_date NULLS FIRST)
    ) AS st
  FROM Transactions
)
SELECT
  user_id,
  spend AS third_transaction_spend,
  transaction_date AS third_transaction_date
FROM T
WHERE
  rk = 3 AND st = 1;
