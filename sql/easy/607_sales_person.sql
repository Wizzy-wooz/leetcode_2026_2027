-- 607. Sales Person
-- https://leetcode.com/problems/sales-person/
--
-- SalesPerson(sales_id, name, salary, commission_rate, hire_date)
-- Company(com_id, name, city)
-- Orders(order_id, order_date, com_id, sales_id, amount)
-- Write a solution to find the names of all the salespersons who did not have any orders related
-- to the company with the name "RED".
-- Return the result table in any order.

SELECT
  s.name
FROM SalesPerson AS s
LEFT JOIN Orders
  USING (sales_id)
LEFT JOIN Company AS c
  USING (com_id)
GROUP BY
  sales_id,
  s.name
HAVING
  COALESCE(SUM(c.name = 'RED'), 0) = 0;
