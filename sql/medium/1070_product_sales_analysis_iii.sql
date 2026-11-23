-- 1070. Product Sales Analysis III
-- https://leetcode.com/problems/product-sales-analysis-iii/
--
-- Sales(sale_id, product_id, year, quantity, price)
-- Write a solution to find all sales that occurred in the first year each product was sold.
-- For each product_id, identify the earliest year it appears in the Sales table.
-- Return all sales entries for that product in that year.
-- Return a table with the following columns: product_id, first_year, quantity, and price. Return
-- the result in any order.

SELECT
  product_id,
  year AS first_year,
  quantity,
  price
FROM Sales
WHERE
  (product_id, year) IN (
    SELECT
      product_id,
      MIN(year) AS year
    FROM Sales
    GROUP BY
      product_id
  );
