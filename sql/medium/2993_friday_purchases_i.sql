-- 2993. Friday Purchases I
-- https://leetcode.com/problems/friday-purchases-i/
--
-- Purchases(user_id, purchase_date, amount_spend)
-- Write a solution to calculate the total spending by users on each Friday of every week in
-- November 2023. Output only weeks that include at least one purchase on a Friday.
-- Return the result table ordered by week of month in ascending order.

SELECT
  CEIL(DAYOFMONTH(CAST(purchase_date AS DATE)) / NULLIF(7, 0)) AS week_of_month,
  purchase_date,
  SUM(amount_spend) AS total_amount
FROM Purchases
WHERE
  STRFTIME(CAST(purchase_date AS TIMESTAMP), '%Y%m') = '202311'
  AND DAYOFWEEK(CAST(purchase_date AS DATE)) = 5
GROUP BY
  2
ORDER BY
  1 NULLS FIRST;
