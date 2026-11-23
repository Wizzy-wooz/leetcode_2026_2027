-- 3521. Find Product Recommendation Pairs
-- https://leetcode.com/problems/find-product-recommendation-pairs/
--
-- ProductPurchases(user_id, product_id, quantity)
-- ProductInfo(product_id, category, price)
-- Amazon wants to implement the Customers who bought this also bought... feature based on co-
-- purchase patterns. Write a solution to :
-- Identify distinct product pairs frequently purchased together by the same customers (where
-- product1_id < product2_id)
-- For each product pair, determine how many customers purchased both products
-- A product pair is considered for recommendation if at least 3 different customers have
-- purchased both products.
-- Return the result table ordered by customer_count in descending order, and in case of a tie, by
-- product1_id in ascending order, and then by product2_id in ascending order.

WITH pairs AS (
  SELECT
    a.product_id AS product1_id,
    b.product_id AS product2_id,
    COUNT(DISTINCT a.user_id) AS customer_count
  FROM ProductPurchases AS a
  JOIN ProductPurchases AS b
    ON a.user_id = b.user_id AND a.product_id < b.product_id
  GROUP BY ALL
  HAVING
    customer_count >= 3
)
SELECT
  p.product1_id,
  p.product2_id,
  a.category AS product1_category,
  b.category AS product2_category,
  p.customer_count
FROM pairs AS p
JOIN ProductInfo AS a
  ON a.product_id = p.product1_id
JOIN ProductInfo AS b
  ON b.product_id = p.product2_id
ORDER BY
  customer_count DESC,
  product1_id,
  product2_id;
