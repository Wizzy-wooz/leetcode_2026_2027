-- 2066. Account Balance
-- https://leetcode.com/problems/account-balance/
--
-- Transactions(account_id, day, type, amount)
-- Write a solution to report the balance of each user after each transaction. You may assume that
-- the balance of each account before any transaction is 0 and that the balance will never be
-- below 0 at any moment.
-- Return the result table in ascending order by account_id, then by day in case of a tie.

SELECT
  account_id,
  day,
  SUM(CASE WHEN type = 'Deposit' THEN amount ELSE -amount END) OVER (PARTITION BY account_id ORDER BY day NULLS FIRST) AS balance
FROM Transactions
ORDER BY
  1 NULLS FIRST,
  2 NULLS FIRST;
