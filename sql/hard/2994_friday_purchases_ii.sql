-- 2994. Friday Purchases II
-- https://leetcode.com/problems/friday-purchases-ii/
--
-- Purchases(user_id, purchase_date, amount_spend)
-- Write a solution to calculate the total spending by users on each Friday of every week in
-- November 2023. If there are no purchases on a particular Friday of a week, it will be
-- considered as 0.
-- Return the result table ordered by week of month in ascending order.

WITH RECURSIVE T AS (
  SELECT
    CAST('2023-11-01' AS DATE) AS purchase_date
  UNION
  SELECT
    purchase_date + INTERVAL '1' DAY
  FROM T
  WHERE
    purchase_date < '2023-11-30'
)
SELECT
  CEIL(DAYOFMONTH(CAST(purchase_date AS DATE)) / NULLIF(7, 0)) AS week_of_month,
  purchase_date,
  COALESCE(SUM(amount_spend), 0) AS total_amount
FROM T
LEFT JOIN Purchases
  USING (purchase_date)
WHERE
  DAYOFWEEK(CAST(purchase_date AS DATE)) = 5
GROUP BY
  2
ORDER BY
  1 NULLS FIRST;
