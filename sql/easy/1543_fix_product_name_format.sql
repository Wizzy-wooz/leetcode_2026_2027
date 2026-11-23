-- 1543. Fix Product Name Format
-- https://leetcode.com/problems/fix-product-name-format/
--
-- Sales(sale_id, product_name, sale_date)
-- Since table Sales was filled manually in the year 2000, product_name may contain leading and/or
-- trailing white spaces, also they are case-insensitive.
-- Write a solution to report
-- product_name in lowercase without leading or trailing white spaces.
-- sale_date in the format ('YYYY-MM').
-- total the number of times the product was sold in this month.
-- Return the result table ordered by product_name in ascending order. In case of a tie, order it
-- by sale_date in ascending order.

WITH t AS (
  SELECT
    LOWER(TRIM(product_name)) AS product_name,
    STRFTIME(CAST(sale_date AS TIMESTAMP), '%Y-%m') AS sale_date
  FROM Sales
)
SELECT
  product_name,
  sale_date,
  COUNT(1) AS total
FROM t
GROUP BY
  1,
  2
ORDER BY
  1 NULLS FIRST,
  2 NULLS FIRST;
