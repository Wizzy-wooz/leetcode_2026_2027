-- 2159. Order Two Columns Independently
-- https://leetcode.com/problems/order-two-columns-independently/
--
-- Data(first_col, second_col)
-- Write a solution to independently:
-- order first_col in ascending order.
-- order second_col in descending order.

WITH S AS (
  SELECT
    first_col,
    ROW_NUMBER() OVER (ORDER BY first_col NULLS FIRST) AS rk
  FROM Data
), T AS (
  SELECT
    second_col,
    ROW_NUMBER() OVER (ORDER BY second_col DESC) AS rk
  FROM Data
)
SELECT
  first_col,
  second_col
FROM S
JOIN T
  USING (rk);
