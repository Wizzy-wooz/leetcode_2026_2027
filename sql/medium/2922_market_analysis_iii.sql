-- 2922. Market Analysis III
-- https://leetcode.com/problems/market-analysis-iii/
--
-- Users(seller_id, join_date, favorite_brand)
-- Items(item_id, item_brand)
-- Orders(order_id, order_date, item_id, seller_id)
-- Write a solution to find the top seller who has sold the highest number of unique items with a
-- different brand than their favorite brand. If there are multiple sellers with the same highest
-- count, return all of them.
-- Return the result table ordered by seller_id in ascending order.

WITH T AS (
  SELECT
    seller_id,
    COUNT(DISTINCT item_id) AS num_items
  FROM Orders
  JOIN Users
    USING (seller_id)
  JOIN Items
    USING (item_id)
  WHERE
    item_brand <> favorite_brand
  GROUP BY
    1
)
SELECT
  seller_id,
  num_items
FROM T
WHERE
  num_items = (
    SELECT
      MAX(num_items)
    FROM T
  )
ORDER BY
  1 NULLS FIRST;
