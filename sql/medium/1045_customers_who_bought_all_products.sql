-- 1045. Customers Who Bought All Products
-- https://leetcode.com/problems/customers-who-bought-all-products/
--
-- Customer(customer_id, product_key)
-- Product(product_key)
-- Write a solution to report the customer ids from the Customer table that bought all the
-- products in the Product table.
-- Return the result table in any order.
-- The result format is in the following example.

SELECT
  customer_id
FROM Customer
GROUP BY
  1
HAVING
  COUNT(DISTINCT product_key) = (
    SELECT
      COUNT(1)
    FROM Product
  );
