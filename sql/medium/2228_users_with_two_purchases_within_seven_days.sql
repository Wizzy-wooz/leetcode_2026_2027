-- 2228. Users With Two Purchases Within Seven Days
-- https://leetcode.com/problems/users-with-two-purchases-within-seven-days/
--
-- Purchases(purchase_id, user_id, purchase_date)
-- Write a solution to report the IDs of the users that made any two purchases at most 7 days
-- apart.
-- Return the result table ordered by user_id.

WITH t AS (
  SELECT
    user_id,
    DATE_DIFF(
      'DAY',
      LAG(purchase_date, 1) OVER (PARTITION BY user_id ORDER BY purchase_date NULLS FIRST),
      purchase_date
    ) AS d
  FROM Purchases
)
SELECT DISTINCT
  user_id
FROM t
WHERE
  d <= 7
ORDER BY
  user_id NULLS FIRST;
