-- 1211. Queries Quality and Percentage
-- https://leetcode.com/problems/queries-quality-and-percentage/
--
-- Queries(query_name, result, position, rating)
-- We define query quality as:
-- The average of the ratio between query rating and its position.
-- We also define poor query percentage as:
-- The percentage of all queries with rating less than 3.
-- Write a solution to find each query_name, the quality and poor_query_percentage.
-- Both quality and poor_query_percentage should be rounded to 2 decimal places.
-- When rounding to two decimal places, values exactly halfway between two possible results are
-- rounded away from zero. For example, 0.125 is rounded to 0.13.
-- Return the result table in any order.
-- The result format is in the following example.

SELECT
  query_name,
  ROUND(AVG(CAST(rating AS DECIMAL) / NULLIF(position, 0)), 2) AS quality,
  ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) / NULLIF(COUNT(*), 0) * 100, 2) AS poor_query_percentage
FROM Queries
WHERE
  NOT query_name IS NULL
GROUP BY
  query_name;
