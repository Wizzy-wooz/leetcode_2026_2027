-- 1853. Convert Date Format
-- https://leetcode.com/problems/convert-date-format/
--
-- Days(day)
-- Write a solution to convert each date in Days into a string formatted as "day_name, month_name
-- day, year".
-- Return the result table in any order.
-- The result format is in the following example.

SELECT
  STRFTIME(CAST(day AS TIMESTAMP), '%A, %B %-d, %Y') AS day
FROM Days;
