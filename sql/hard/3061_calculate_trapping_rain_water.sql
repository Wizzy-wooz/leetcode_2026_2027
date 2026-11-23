-- 3061. Calculate Trapping Rain Water
-- https://leetcode.com/problems/calculate-trapping-rain-water/
--
-- Heights(id, height)
-- Write a solution to calculate the amount of rainwater can be trapped between the bars in the
-- landscape, considering that each bar has a width of 1 unit.
-- Return the result table in any order.

WITH T AS (
  SELECT
    *,
    MAX(height) OVER (ORDER BY id NULLS FIRST) AS l,
    MAX(height) OVER (ORDER BY id DESC) AS r
  FROM Heights
)
SELECT
  SUM(CASE WHEN l IS NULL OR r IS NULL THEN NULL ELSE LEAST(l, r) END - height) AS total_trapped_water
FROM T;
