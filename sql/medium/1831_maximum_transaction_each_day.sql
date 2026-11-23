-- 1831. Maximum Transaction Each Day
-- https://leetcode.com/problems/maximum-transaction-each-day/
--
-- Transactions(transaction_id, day, amount)
-- Write a solution to report the IDs of the transactions with the maximum amount on their
-- respective day. If in one day there are multiple such transactions, return all of them.
-- Return the result table ordered by transaction_id in ascending order.

WITH T AS (
  SELECT
    transaction_id,
    RANK() OVER (PARTITION BY CAST(day AS DATE) ORDER BY amount DESC) AS rk
  FROM Transactions
)
SELECT
  transaction_id
FROM T
WHERE
  rk = 1
ORDER BY
  1 NULLS FIRST;
