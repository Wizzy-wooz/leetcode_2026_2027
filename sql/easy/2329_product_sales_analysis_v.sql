-- 2329. Product Sales Analysis V
-- https://leetcode.com/problems/product-sales-analysis-v/
--
-- Sales(sale_id, product_id, user_id, quantity)
-- Product(product_id, price)
-- Write a solution to report the spending of each user.
-- Return the resulting table ordered by spending in descending order. In case of a tie, order
-- them by user_id in ascending order.

SELECT
  user_id,
  SUM(quantity * price) AS spending
FROM Sales
JOIN Product
  USING (product_id)
GROUP BY
  1
ORDER BY
  2 DESC,
  1 NULLS FIRST;
