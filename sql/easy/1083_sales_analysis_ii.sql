-- 1083. Sales Analysis II
-- https://leetcode.com/problems/sales-analysis-ii/
--
-- Product(product_id, product_name, unit_price)
-- Sales(seller_id, product_id, buyer_id, sale_date, quantity, price)
-- Write a solution to report the buyers who have bought S8 but not iPhone. Note that S8 and
-- iPhone are products presented in the Product table.
-- Return the result table in any order.

SELECT
  buyer_id
FROM Sales
JOIN Product
  USING (product_id)
GROUP BY
  1
HAVING
  SUM(product_name = 'S8') > 0 AND SUM(product_name = 'iPhone') = 0;
