-- 1068. Product Sales Analysis I
-- https://leetcode.com/problems/product-sales-analysis-i/
--
-- Sales(sale_id, product_id, year, quantity, price)
-- Product(product_id, product_name)
-- Write a solution to report the product_name, year, and price for each sale_id in the Sales
-- table.
-- Return the resulting table in any order.

SELECT
  product_name,
  year,
  price
FROM Sales
JOIN Product
  USING (product_id);
