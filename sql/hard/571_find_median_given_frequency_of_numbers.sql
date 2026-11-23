-- 571. Find Median Given Frequency of Numbers
-- https://leetcode.com/problems/find-median-given-frequency-of-numbers/
--
-- Numbers(num, frequency)
-- The median is the value separating the higher half from the lower half of a data sample.
-- Write a solution to report the median of all the numbers in the database after decompressing
-- the Numbers table. Round the median to one decimal point.
-- The result format is in the following example.

WITH t AS (
  SELECT
    *,
    SUM(frequency) OVER (ORDER BY num ASC NULLS FIRST) AS rk1,
    SUM(frequency) OVER (ORDER BY num DESC) AS rk2,
    SUM(frequency) OVER () AS s
  FROM Numbers
)
SELECT
  ROUND(AVG(num), 1) AS median
FROM t
WHERE
  rk1 >= s / NULLIF(2, 0) AND rk2 >= s / NULLIF(2, 0);
