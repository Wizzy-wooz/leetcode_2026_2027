-- 3118. Friday Purchase III
-- https://leetcode.com/problems/friday-purchase-iii/
--
-- Purchases(user_id, purchase_date, amount_spend)
-- Users(user_id, membership)
-- Write a solution to calculate the total spending by Premium and VIP members on each Friday of
-- every week in November 2023. If there are no purchases on a particular Friday by Premium or VIP
-- members, it should be considered as 0.
-- Return the result table ordered by week of the month, and membership in ascending order.

WITH RECURSIVE T AS (
  SELECT
    1 AS week_of_month
  UNION
  SELECT
    week_of_month + 1
  FROM T
  WHERE
    week_of_month < 4
), M AS (
  SELECT
    'Premium' AS membership
  UNION
  SELECT
    'VIP'
), P AS (
  SELECT
    CEIL(DAYOFMONTH(CAST(purchase_date AS DATE)) / NULLIF(7, 0)) AS week_of_month,
    membership,
    amount_spend
  FROM Purchases
  JOIN Users
    USING (user_id)
  WHERE
    purchase_date BETWEEN DATE '2023-11-01' AND DATE '2023-11-30' AND DAYOFWEEK(CAST(purchase_date AS DATE)) = 5
)
SELECT
  week_of_month,
  membership,
  COALESCE(SUM(amount_spend), 0) AS total_amount
FROM T
CROSS JOIN M
LEFT JOIN P
  USING (week_of_month, membership)
GROUP BY
  1,
  2
ORDER BY
  1 NULLS FIRST,
  2 NULLS FIRST;
