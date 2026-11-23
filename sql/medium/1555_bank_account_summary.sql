-- 1555. Bank Account Summary
-- https://leetcode.com/problems/bank-account-summary/
--
-- Users(user_id, user_name, credit)
-- Transactions(trans_id, paid_by, paid_to, amount, transacted_on)
-- Leetcode Bank (LCB) helps its coders in making virtual payments. Our bank records all
-- transactions in the table Transaction, we want to find out the current balance of all users and
-- check whether they have breached their credit limit (If their current credit is less than 0).
-- Write a solution to report.
-- user_id,
-- user_name,
-- credit, current balance after performing transactions, and
-- credit_limit_breached, check credit_limit ("Yes" or "No")
-- Return the result table in any order.
-- The result format is in the following example.

SELECT
  t.user_id,
  user_name,
  SUM(t.credit) AS credit,
  CASE WHEN SUM(t.credit) < 0 THEN 'Yes' ELSE 'No' END AS credit_limit_breached
FROM (
  SELECT
    paid_by AS user_id,
    -amount AS credit
  FROM Transactions
  UNION ALL
  SELECT
    paid_to AS user_id,
    amount AS credit
  FROM Transactions
  UNION ALL
  SELECT
    user_id,
    credit
  FROM Users
) AS t
JOIN Users AS u
  ON t.user_id = u.user_id
GROUP BY
  t.user_id,
  user_name;
