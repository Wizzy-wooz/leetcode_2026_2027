-- 1082. Sales Analysis I
-- https://leetcode.com/problems/sales-analysis-i/
--
-- Product(product_id, product_name, unit_price)
-- Sales(seller_id, product_id, buyer_id, sale_date, quantity, price)
-- Write a solution that reports the best seller by total sales price, If there is a tie, report
-- them all.
-- Return the result table in any order.
-- The result format is in the following example.

SELECT
  seller_id
FROM Sales
GROUP BY
  seller_id
HAVING
  SUM(price) >= ALL (
    SELECT
      SUM(price)
    FROM Sales
    GROUP BY
      seller_id
  );
