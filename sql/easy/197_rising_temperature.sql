-- 197. Rising Temperature
-- https://leetcode.com/problems/rising-temperature/
--
-- Weather(id, recordDate, temperature)
-- Write a solution to find all dates' id with higher temperatures compared to its previous
-- calendar dates (yesterday).
-- Return the result table in any order.

SELECT
  w1.id
FROM Weather AS w1
JOIN Weather AS w2
  ON DATE_DIFF('DAY', w2.recordDate, w1.recordDate) = 1
  AND w1.temperature > w2.temperature;
