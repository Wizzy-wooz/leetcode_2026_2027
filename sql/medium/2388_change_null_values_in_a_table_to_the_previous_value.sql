-- 2388. Change Null Values in a Table to the Previous Value
-- https://leetcode.com/problems/change-null-values-in-a-table-to-the-previous-value/
--
-- CoffeeShop(id, drink)
-- Write a solution to replace the null values of the drink with the name of the drink of the
-- previous row that is not null. It is guaranteed that the drink on the first row of the table is
-- not null.
-- Return the result table in the same order as the input.

WITH S AS (
  SELECT
    *,
    ROW_NUMBER() OVER () AS rk
  FROM CoffeeShop
), T AS (
  SELECT
    *,
    SUM(CASE WHEN drink IS NULL THEN 0 ELSE 1 END) OVER (ORDER BY rk NULLS FIRST) AS gid
  FROM S
)
SELECT
  id,
  MAX(drink) OVER (PARTITION BY gid ORDER BY rk NULLS FIRST) AS drink
FROM T;
