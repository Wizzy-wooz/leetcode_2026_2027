-- 2084. Drop Type 1 Orders for Customers With Type 0 Orders
-- https://leetcode.com/problems/drop-type-1-orders-for-customers-with-type-0-orders/
--
-- Orders(order_id, customer_id, order_type)
-- Write a solution to report all the orders based on the following criteria:
-- If a customer has at least one order of type 0, do not report any order of type 1 from that
-- customer.
-- Otherwise, report all the orders of the customer.
-- Return the result table in any order.

WITH T AS (
  SELECT DISTINCT
    customer_id
  FROM Orders
  WHERE
    order_type = 0
)
SELECT
  *
FROM Orders AS o
WHERE
  order_type = 0
  OR NOT EXISTS(
    SELECT
      1
    FROM T AS t
    WHERE
      t.customer_id = o.customer_id
  );
