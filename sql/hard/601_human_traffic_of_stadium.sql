-- 601. Human Traffic of Stadium
-- https://leetcode.com/problems/human-traffic-of-stadium/
--
-- Stadium(id, visit_date, people)
-- Write a solution to display the records with three or more rows with consecutive id's, and the
-- number of people is greater than or equal to 100 for each.
-- Return the result table ordered by visit_date in ascending order.

WITH S AS (
  SELECT
    *,
    id - (
      ROW_NUMBER() OVER (ORDER BY id NULLS FIRST)
    ) AS rk
  FROM Stadium
  WHERE
    people >= 100
), T AS (
  SELECT
    *,
    COUNT(1) OVER (PARTITION BY rk) AS cnt
  FROM S
)
SELECT
  id,
  visit_date,
  people
FROM T
WHERE
  cnt >= 3
ORDER BY
  1 NULLS FIRST;
