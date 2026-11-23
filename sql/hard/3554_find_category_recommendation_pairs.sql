-- 3554. Find Category Recommendation Pairs
-- https://leetcode.com/problems/find-category-recommendation-pairs/
--
-- ProductPurchases(user_id, product_id, quantity)
-- ProductInfo(product_id, category, price)
-- Amazon wants to understand shopping patterns across product categories. Write a solution to:
-- Find all category pairs (where category1 < category2)
-- For each category pair, determine the number of unique customers who purchased products from
-- both categories
-- A category pair is considered reportable if at least 3 different customers have purchased
-- products from both categories.
-- Return the result table of reportable category pairs ordered by customer_count in descending
-- order, and in case of a tie, by category1 in ascending order lexicographically, and then by
-- category2 in ascending order.

WITH user_category AS (
  SELECT DISTINCT
    user_id,
    category
  FROM ProductPurchases
  JOIN ProductInfo
    USING (product_id)
), pair_per_user AS (
  SELECT
    a.user_id,
    a.category AS category1,
    b.category AS category2
  FROM user_category AS a
  JOIN user_category AS b
    ON a.user_id = b.user_id AND a.category < b.category
)
SELECT
  category1,
  category2,
  COUNT(DISTINCT user_id) AS customer_count
FROM pair_per_user
GROUP BY
  1,
  2
HAVING
  customer_count >= 3
ORDER BY
  3 DESC,
  1 NULLS FIRST,
  2 NULLS FIRST;
