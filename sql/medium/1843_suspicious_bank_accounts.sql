-- 1843. Suspicious Bank Accounts
-- https://leetcode.com/problems/suspicious-bank-accounts/
--
-- Accounts(account_id, max_income)
-- Transactions(transaction_id, account_id, type, amount, day)
-- A bank account is suspicious if the total income exceeds the max_income for this account for
-- two or more consecutive months. The total income of an account in some month is the sum of all
-- its deposits in that month (i.e., transactions of the type 'Creditor').
-- Write a solution to report the IDs of all suspicious bank accounts.
-- Return the result table in any order.

WITH months AS (
  SELECT
    account_id,
    DATE_TRUNC('MONTH', day) AS m
  FROM Transactions
  JOIN Accounts
    USING (account_id)
  WHERE
    type = 'Creditor'
  GROUP BY
    account_id,
    m,
    max_income
  HAVING
    SUM(amount) > max_income
)
SELECT DISTINCT
  a.account_id
FROM months AS a
JOIN months AS b
  ON a.account_id = b.account_id AND b.m = a.m + INTERVAL '1' MONTH;
