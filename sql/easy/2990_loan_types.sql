-- 2990. Loan Types
-- https://leetcode.com/problems/loan-types/
--
-- Loans(loan_id, user_id, loan_type)
-- Write a solution to find all distinct user_id's that have at least one Refinance loan type and
-- at least one Mortgage loan type.
-- Return the result table ordered by user_id in ascending order.

SELECT
  user_id
FROM Loans
GROUP BY
  1
HAVING
  SUM(loan_type = 'Refinance') > 0 AND SUM(loan_type = 'Mortgage') > 0
ORDER BY
  1 NULLS FIRST;
