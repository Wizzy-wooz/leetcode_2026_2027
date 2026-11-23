-- 3564. Seasonal Sales Analysis
-- https://leetcode.com/problems/seasonal-sales-analysis/
--
-- sales(sale_id, product_id, sale_date, quantity, price)
-- products(product_id, product_name, category)
-- Write a solution to find the most popular product category for each season. The seasons are
-- defined as:
-- Winter: December, January, February
-- Spring: March, April, May
-- Summer: June, July, August
-- Fall: September, October, November
-- The popularity of a category is determined by the total quantity sold in that season. If there
-- is a tie, select the category with the highest total revenue (quantity × price). If there is
-- still a tie, return the lexicographically smaller category.
-- Return the result table ordered by season in ascending order.

WITH SeasonalSales AS (
  SELECT
    CASE
      WHEN MONTH(CAST(sale_date AS DATE)) IN (12, 1, 2)
      THEN 'Winter'
      WHEN MONTH(CAST(sale_date AS DATE)) IN (3, 4, 5)
      THEN 'Spring'
      WHEN MONTH(CAST(sale_date AS DATE)) IN (6, 7, 8)
      THEN 'Summer'
      WHEN MONTH(CAST(sale_date AS DATE)) IN (9, 10, 11)
      THEN 'Fall'
    END AS season,
    category,
    SUM(quantity) AS total_quantity,
    SUM(quantity * price) AS total_revenue
  FROM sales
  JOIN products
    USING (product_id)
  GROUP BY
    1,
    2
), TopCategoryPerSeason AS (
  SELECT
    *,
    RANK() OVER (
      PARTITION BY season
      ORDER BY total_quantity DESC, total_revenue DESC, category ASC NULLS FIRST
    ) AS rk
  FROM SeasonalSales
)
SELECT
  season,
  category,
  total_quantity,
  total_revenue
FROM TopCategoryPerSeason
WHERE
  rk = 1
ORDER BY
  1 NULLS FIRST;
