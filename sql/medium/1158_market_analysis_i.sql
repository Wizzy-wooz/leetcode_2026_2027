-- 1158. Market Analysis I
-- https://leetcode.com/problems/market-analysis-i/
--
-- Users(user_id, join_date, favorite_brand)
-- Orders(order_id, order_date, item_id, buyer_id, seller_id)
-- Items(item_id, item_brand)
-- Write a solution to find for each user, the join date and the number of orders they made as a
-- buyer in 2019.
-- Return the result table in any order.
-- The result format is in the following example.

SELECT
  u.user_id AS buyer_id,
  u.join_date,
  COUNT(order_id) AS orders_in_2019
FROM Users AS u
LEFT JOIN Orders AS o
  ON u.user_id = o.buyer_id AND YEAR(CAST(order_date AS DATE)) = 2019
GROUP BY
  user_id,
  u.join_date;
