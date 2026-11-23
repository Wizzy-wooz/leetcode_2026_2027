-- 3214. Year on Year Growth Rate
-- https://leetcode.com/problems/year-on-year-growth-rate/
--
-- user_transactions(transaction_id, product_id, spend, transaction_date)
-- Write a solution to calculate the year-on-year growth rate for the total spend for each
-- product.
-- The result table should include the following columns:
-- year: The year of the transaction.
-- product_id: The ID of the product.
-- curr_year_spend: The total spend for the current year.
-- prev_year_spend: The total spend for the previous year.
-- yoy_rate: The year-on-year growth rate percentage, rounded to 2 decimal places.
-- Return the result table ordered by product_id,year in ascending order.

WITH T AS (
  SELECT
    product_id,
    YEAR(CAST(transaction_date AS DATE)) AS year,
    SUM(spend) AS curr_year_spend
  FROM user_transactions
  GROUP BY
    1,
    2
), S AS (
  SELECT
    t1.year,
    t1.product_id,
    t1.curr_year_spend,
    t2.curr_year_spend AS prev_year_spend
  FROM T AS t1
  LEFT JOIN T AS t2
    ON t1.product_id = t2.product_id AND t1.year = t2.year + 1
)
SELECT
  *,
  ROUND((
    curr_year_spend - prev_year_spend
  ) / NULLIF(prev_year_spend, 0) * 100, 2) AS yoy_rate
FROM S
ORDER BY
  2 NULLS FIRST,
  1 NULLS FIRST;
