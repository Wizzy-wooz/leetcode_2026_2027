-- 1084. Sales Analysis III
-- https://leetcode.com/problems/sales-analysis-iii/
--
-- Product(product_id, product_name, unit_price)
-- Sales(seller_id, product_id, buyer_id, sale_date, quantity, price)
-- Write a solution to report the products that were only sold in the first quarter of 2019. That
-- is, between 2019-01-01 and 2019-03-31 inclusive.
-- Return the result table in any order.

SELECT
  product_id,
  product_name
FROM Sales
JOIN Product
  USING (product_id)
GROUP BY
  1,
  product_name
HAVING
  COUNT(1) = SUM(sale_date BETWEEN '2019-01-01' AND '2019-03-31');
