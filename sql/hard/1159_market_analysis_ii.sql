-- 1159. Market Analysis II
-- https://leetcode.com/problems/market-analysis-ii/
--
-- Users(user_id, join_date, favorite_brand)
-- Orders(order_id, order_date, item_id, buyer_id, seller_id)
-- Items(item_id, item_brand)
-- Write a solution to find for each user whether the brand of the second item (by date) they sold
-- is their favorite brand. If a user sold less than two items, report the answer for that user as
-- no. It is guaranteed that no seller sells more than one item in a day.
-- Return the result table in any order.

SELECT
  u.user_id AS seller_id,
  CASE WHEN u.favorite_brand = i.item_brand THEN 'yes' ELSE 'no' END AS "2nd_item_fav_brand"
FROM users AS u
LEFT JOIN (
  SELECT
    order_date,
    item_id,
    seller_id,
    RANK() OVER (PARTITION BY seller_id ORDER BY order_date NULLS FIRST) AS rk
  FROM orders
) AS o
  ON u.user_id = o.seller_id AND o.rk = 2
LEFT JOIN items AS i
  ON o.item_id = i.item_id;
