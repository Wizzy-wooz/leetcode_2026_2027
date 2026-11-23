-- 183. Customers Who Never Order
-- https://leetcode.com/problems/customers-who-never-order/
--
-- Customers(id, name)
-- Orders(id, customerId)
-- Write a solution to find all customers who never order anything.
-- Return the result table in any order.

SELECT
  name AS Customers
FROM Customers
WHERE
  NOT id IN (
    SELECT
      customerId
    FROM Orders
  );
