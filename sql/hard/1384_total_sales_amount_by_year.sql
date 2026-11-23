-- 1384. Total Sales Amount by Year
-- https://leetcode.com/problems/total-sales-amount-by-year/
--
-- Product(product_id, product_name)
-- Sales(product_id, period_start, period_end, average_daily_sales)
-- Write a solution to report the total sales amount of each item for each year, with
-- corresponding product_name, product_id, report_year, and total_amount.
-- Return the result table ordered by product_id and report_year.

SELECT
  s.product_id,
  p.product_name,
  y.YEAR AS report_year,
  s.average_daily_sales * (
    CASE
      WHEN YEAR(CAST(s.period_end AS DATE)) > CAST(y.YEAR AS BIGINT)
      THEN y.days_of_year
      ELSE DAYOFYEAR(CAST(s.period_end AS DATE))
    END - CASE
      WHEN YEAR(CAST(s.period_start AS DATE)) < CAST(y.YEAR AS BIGINT)
      THEN 1
      ELSE DAYOFYEAR(CAST(s.period_start AS DATE))
    END + 1
  ) AS total_amount
FROM Sales AS s
INNER JOIN (
  SELECT
    '2018' AS YEAR,
    365 AS days_of_year
  UNION ALL
  SELECT
    '2019' AS YEAR,
    365 AS days_of_year
  UNION ALL
  SELECT
    '2020' AS YEAR,
    366 AS days_of_year
) AS y
  ON YEAR(CAST(s.period_start AS DATE)) <= CAST(y.YEAR AS BIGINT)
  AND YEAR(CAST(s.period_end AS DATE)) >= CAST(y.YEAR AS BIGINT)
INNER JOIN Product AS p
  ON p.product_id = s.product_id
ORDER BY
  s.product_id NULLS FIRST,
  CAST(y.YEAR AS BIGINT) NULLS FIRST;
