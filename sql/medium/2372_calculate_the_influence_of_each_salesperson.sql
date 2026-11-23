-- 2372. Calculate the Influence of Each Salesperson
-- https://leetcode.com/problems/calculate-the-influence-of-each-salesperson/
--
-- Salesperson(salesperson_id, name)
-- Customer(customer_id, salesperson_id)
-- Sales(sale_id, customer_id, price)
-- Write a solution to report the sum of prices paid by the customers of each salesperson. If a
-- salesperson does not have any customers, the total value should be 0.
-- Return the result table in any order.
-- The result format is shown in the following example.

SELECT
  sp.salesperson_id,
  name,
  COALESCE(SUM(price), 0) AS total
FROM Salesperson AS sp
LEFT JOIN Customer AS c
  ON sp.salesperson_id = c.salesperson_id
LEFT JOIN Sales AS s
  ON s.customer_id = c.customer_id
GROUP BY
  1,
  name;
