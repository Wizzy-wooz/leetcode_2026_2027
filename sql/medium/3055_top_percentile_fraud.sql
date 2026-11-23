-- 3055. Top Percentile Fraud
-- https://leetcode.com/problems/top-percentile-fraud/
--
-- Fraud(policy_id, state, fraud_score)
-- The Leetcode Insurance Corp has developed an ML-driven predictive model to detect the
-- likelihood of fraudulent claims. Consequently, they allocate their most seasoned claim
-- adjusters to address the top 5% of claims flagged by this model.
-- Write a solution to find the top 5 percentile of claims from each state.
-- Return the result table ordered by state in ascending order, fraud_score in descending order,
-- and policy_id in ascending order.

WITH T AS (
  SELECT
    *,
    PERCENT_RANK() OVER (PARTITION BY state ORDER BY fraud_score DESC) AS rk
  FROM Fraud
)
SELECT
  policy_id,
  state,
  fraud_score
FROM T
WHERE
  rk <= 0.05
ORDER BY
  2 NULLS FIRST,
  3 DESC,
  1 NULLS FIRST;
