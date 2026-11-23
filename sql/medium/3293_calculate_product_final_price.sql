-- 3293. Calculate Product Final Price
-- https://leetcode.com/problems/calculate-product-final-price/
--
-- Products(product_id, category, price)
-- Discounts(category, discount)
-- Write a solution to find the final price of each product after applying the category discount.
-- If a product's category has no associated discount, its price remains unchanged.
-- Return the result table ordered by product_id in ascending order.

SELECT
  product_id,
  price * (
    100 - COALESCE(discount, 0)
  ) / NULLIF(100, 0) AS final_price,
  category
FROM Products
LEFT JOIN Discounts
  USING (category)
ORDER BY
  1 NULLS FIRST;
