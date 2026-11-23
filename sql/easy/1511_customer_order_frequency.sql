-- 1511. Customer Order Frequency
-- https://leetcode.com/problems/customer-order-frequency/
--
-- Customers(customer_id, name, country)
-- Product(product_id, description, price)
-- Orders(order_id, customer_id, product_id, order_date, quantity)
-- Write a solution to report the customer_id and customer_name of customers who have spent at
-- least $100 in each month of June and July 2020.
-- Return the result table in any order.
-- The result format is in the following example.

SELECT
  customer_id,
  name
FROM Orders
JOIN Product
  USING (product_id)
JOIN Customers
  USING (customer_id)
WHERE
  YEAR(CAST(order_date AS DATE)) = 2020
GROUP BY
  1,
  name
HAVING
  SUM(CASE WHEN MONTH(CAST(order_date AS DATE)) = 6 THEN quantity * price ELSE 0 END) >= 100
  AND SUM(CASE WHEN MONTH(CAST(order_date AS DATE)) = 7 THEN quantity * price ELSE 0 END) >= 100;
