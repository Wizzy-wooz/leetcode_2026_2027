-- 1327. List the Products Ordered in a Period
-- https://leetcode.com/problems/list-the-products-ordered-in-a-period/
--
-- Products(product_id, product_name, product_category)
-- Orders(product_id, order_date, unit)
-- Write a solution to get the names of products that have at least 100 units ordered in February
-- 2020 and their amount.
-- Return the result table in any order.
-- The result format is in the following example.

SELECT
  product_name,
  SUM(unit) AS unit
FROM Orders AS o
JOIN Products AS p
  ON o.product_id = p.product_id
WHERE
  STRFTIME(CAST(order_date AS TIMESTAMP), '%Y-%m') = '2020-02'
GROUP BY
  o.product_id,
  product_name
HAVING
  unit >= 100;
