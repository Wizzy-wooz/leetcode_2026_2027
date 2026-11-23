-- 1484. Group Sold Products By The Date
-- https://leetcode.com/problems/group-sold-products-by-the-date/
--
-- Activities(sell_date, product)
-- Write a solution to find for each date the number of different products sold and their names.
-- The sold products names for each date should be sorted lexicographically.
-- Return the result table ordered by sell_date.
-- The result format is in the following example.

SELECT
  sell_date,
  COUNT(DISTINCT product) AS num_sold,
  LISTAGG(DISTINCT product, ',' ORDER BY product) AS products
FROM Activities
GROUP BY
  sell_date
ORDER BY
  sell_date NULLS FIRST;
