-- 1251. Average Selling Price
-- https://leetcode.com/problems/average-selling-price/
--
-- Prices(product_id, start_date, end_date, price)
-- UnitsSold(product_id, purchase_date, units)
-- Write a solution to find the average selling price for each product. average_price should be
-- rounded to 2 decimal places. If a product does not have any sold units, its average selling
-- price is assumed to be 0.
-- Return the result table in any order.
-- The result format is in the following example.

SELECT
  p.product_id,
  COALESCE(ROUND(SUM(price * units) / NULLIF(SUM(units), 0), 2), 0) AS average_price
FROM Prices AS p
LEFT JOIN UnitsSold AS u
  ON p.product_id = u.product_id AND purchase_date BETWEEN start_date AND end_date
GROUP BY
  1;
