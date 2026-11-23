-- 3052. Maximize Items
-- https://leetcode.com/problems/maximize-items/
--
-- Inventory(item_id, item_type, item_category, square_footage)
-- Leetcode warehouse wants to maximize the number of items it can stock in a 500,000 square feet
-- warehouse. It wants to stock as many prime items as possible, and afterwards use the remaining
-- square footage to stock the most number of non-prime items.
-- Write a solution to find the number of prime and non-prime items that can be stored in the
-- 500,000 square feet warehouse. Output the item type with prime_eligible followed by not_prime
-- and the maximum number of items that can be stocked.
-- Note:
-- Item count must be a whole number (integer).
-- If the count for the not_prime category is 0, you should output 0 for that particular category.
-- Return the result table ordered by item count in descending order.

WITH sizes AS (
  SELECT
    item_type,
    COUNT(*) AS n,
    SUM(square_footage) AS area
  FROM Inventory
  GROUP BY
    item_type
), prime AS (
  SELECT
    COALESCE(MAX(FLOOR(500000 / area) * area), 0) AS used
  FROM sizes
  WHERE
    item_type = 'prime_eligible'
)
SELECT
  item_type,
  CAST(n * FLOOR(
    (
      CASE WHEN item_type = 'prime_eligible' THEN 500000 ELSE 500000 - used END
    ) / area
  ) AS BIGINT) AS item_count
FROM sizes
CROSS JOIN prime
ORDER BY
  item_count DESC,
  item_type DESC;
