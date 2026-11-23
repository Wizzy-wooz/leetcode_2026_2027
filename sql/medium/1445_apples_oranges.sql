-- 1445. Apples & Oranges
-- https://leetcode.com/problems/apples-oranges/
--
-- Sales(sale_date, fruit, sold_num)
-- Write a solution to report the difference between the number of apples and oranges sold each
-- day.
-- Return the result table ordered by sale_date.

SELECT
  sale_date,
  SUM(CASE WHEN fruit = 'apples' THEN sold_num ELSE -sold_num END) AS diff
FROM Sales
GROUP BY
  1
ORDER BY
  1 NULLS FIRST;
