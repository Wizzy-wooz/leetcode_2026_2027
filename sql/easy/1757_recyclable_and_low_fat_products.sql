-- 1757. Recyclable and Low Fat Products
-- https://leetcode.com/problems/recyclable-and-low-fat-products/
--
-- Products(product_id, low_fats, recyclable)
-- Write a solution to find the ids of products that are both low fat and recyclable.
-- Return the result table in any order.

SELECT
  product_id
FROM Products
WHERE
  low_fats = 'Y' AND recyclable = 'Y';
