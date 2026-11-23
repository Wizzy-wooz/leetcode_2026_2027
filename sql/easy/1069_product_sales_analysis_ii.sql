-- 1069. Product Sales Analysis II
-- https://leetcode.com/problems/product-sales-analysis-ii/
--
-- Sales(sale_id, product_id, year, quantity, price)
-- Product(product_id, product_name)
-- Write a solution that reports the total quantity sold for every product id.
-- Return the resulting table in any order.

SELECT
  product_id,
  SUM(quantity) AS total_quantity
FROM Sales
GROUP BY
  1;
