-- 1398. Customers Who Bought Products A and B but Not C
-- https://leetcode.com/problems/customers-who-bought-products-a-and-b-but-not-c/
--
-- Customers(customer_id, customer_name)
-- Orders(order_id, customer_id, product_name)
-- Write a solution to report the customer_id and customer_name of customers who bought products
-- "A", "B" but did not buy the product "C" since we want to recommend them to purchase this
-- product.
-- Return the result table ordered by customer_id.
-- The result format is in the following example.

SELECT
  customer_id,
  customer_name
FROM Customers
LEFT JOIN Orders
  USING (customer_id)
GROUP BY
  1,
  customer_name
HAVING
  SUM(product_name = 'A') > 0
  AND SUM(product_name = 'B') > 0
  AND SUM(product_name = 'C') = 0
ORDER BY
  1 NULLS FIRST;
