-- 1777. Product's Price for Each Store
-- https://leetcode.com/problems/products-price-for-each-store/
--
-- Products(product_id, store, price)
-- Find the price of each product in each store.
-- Return the result table in any order.

SELECT
  product_id,
  SUM(CASE WHEN store = 'store1' THEN price ELSE NULL END) AS store1,
  SUM(CASE WHEN store = 'store2' THEN price ELSE NULL END) AS store2,
  SUM(CASE WHEN store = 'store3' THEN price ELSE NULL END) AS store3
FROM Products
GROUP BY
  1;
