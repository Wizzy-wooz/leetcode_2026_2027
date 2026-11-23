-- 1795. Rearrange Products Table
-- https://leetcode.com/problems/rearrange-products-table/
--
-- Products(product_id, store1, store2, store3)
-- Write a solution to rearrange the Products table so that each row has (product_id, store,
-- price). If a product is not available in a store, do not include a row with that product_id and
-- store combination in the result table.
-- Return the result table in any order.

SELECT
  product_id,
  'store1' AS store,
  store1 AS price
FROM Products
WHERE
  NOT store1 IS NULL
UNION
SELECT
  product_id,
  'store2' AS store,
  store2 AS price
FROM Products
WHERE
  NOT store2 IS NULL
UNION
SELECT
  product_id,
  'store3' AS store,
  store3 AS price
FROM Products
WHERE
  NOT store3 IS NULL;
