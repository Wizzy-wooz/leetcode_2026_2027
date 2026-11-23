-- 1607. Sellers With No Sales
-- https://leetcode.com/problems/sellers-with-no-sales/
--
-- Customer(customer_id, customer_name)
-- Orders(order_id, sale_date, order_cost, customer_id, seller_id)
-- Seller(seller_id, seller_name)
-- Write a solution to report the names of all sellers who did not make any sales in 2020.
-- Return the result table ordered by seller_name in ascending order.

SELECT
  seller_name
FROM Seller
LEFT JOIN Orders
  USING (seller_id)
GROUP BY
  seller_id,
  seller_name
HAVING
  COALESCE(SUM(YEAR(CAST(sale_date AS DATE)) = 2020), 0) = 0
ORDER BY
  1 NULLS FIRST;
