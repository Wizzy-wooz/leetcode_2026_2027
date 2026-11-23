-- 1587. Bank Account Summary II
-- https://leetcode.com/problems/bank-account-summary-ii/
--
-- Users(account, name)
-- Transactions(trans_id, account, amount, transacted_on)
-- Write a solution to report the name and balance of users with a balance higher than 10000. The
-- balance of an account is equal to the sum of the amounts of all transactions involving that
-- account.
-- Return the result table in any order.

SELECT
  name,
  SUM(amount) AS balance
FROM Users
JOIN Transactions
  USING (account)
GROUP BY
  account,
  name
HAVING
  balance > 10000;
