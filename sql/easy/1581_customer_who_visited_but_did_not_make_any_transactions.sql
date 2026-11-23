-- 1581. Customer Who Visited but Did Not Make Any Transactions
-- https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/
--
-- Visits(visit_id, customer_id)
-- Transactions(transaction_id, visit_id, amount)
-- Write a solution to find the IDs of the users who visited without making any transactions and
-- the number of times they made these types of visits.
-- Return the result table sorted in any order.
-- The result format is in the following example.

SELECT
  customer_id,
  COUNT(1) AS count_no_trans
FROM Visits
WHERE
  NOT visit_id IN (
    SELECT
      visit_id
    FROM Transactions
  )
GROUP BY
  1;
