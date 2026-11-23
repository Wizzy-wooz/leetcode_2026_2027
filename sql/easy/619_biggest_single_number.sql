-- 619. Biggest Single Number
-- https://leetcode.com/problems/biggest-single-number/
--
-- MyNumbers(num)
-- A single number is a number that appeared only once in the MyNumbers table.
-- Find the largest single number. If there is no single number, report null.

SELECT
  MAX(num) AS num
FROM (
  SELECT
    num
  FROM MyNumbers
  GROUP BY
    1
  HAVING
    COUNT(1) = 1
) AS t;
