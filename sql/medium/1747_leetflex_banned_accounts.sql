-- 1747. Leetflex Banned Accounts
-- https://leetcode.com/problems/leetflex-banned-accounts/
--
-- LogInfo(account_id, ip_address, login, logout)
-- Write a solution to find the account_id of the accounts that should be banned from Leetflex. An
-- account should be banned if it was logged in at some moment from two different IP addresses.
-- Return the result table in any order.
-- The result format is in the following example.

SELECT DISTINCT
  a.account_id
FROM LogInfo AS a
JOIN LogInfo AS b
  ON a.account_id = b.account_id
  AND a.ip_address <> b.ip_address
  AND a.login BETWEEN b.login AND b.logout;
