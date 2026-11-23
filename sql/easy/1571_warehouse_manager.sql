-- 1571. Warehouse Manager
-- https://leetcode.com/problems/warehouse-manager/
--
-- Warehouse(name, product_id, units)
-- Products(product_id, product_name, Width, Length, Height)
-- Write a solution to report the number of cubic feet of volume the inventory occupies in each
-- warehouse.
-- Return the result table in any order.

SELECT
  name AS warehouse_name,
  SUM(width * length * height * units) AS volume
FROM Warehouse
JOIN Products
  USING (product_id)
GROUP BY
  1;
