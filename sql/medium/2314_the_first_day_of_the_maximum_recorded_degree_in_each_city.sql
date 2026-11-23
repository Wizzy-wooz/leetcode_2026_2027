-- 2314. The First Day of the Maximum Recorded Degree in Each City
-- https://leetcode.com/problems/the-first-day-of-the-maximum-recorded-degree-in-each-city/
--
-- Weather(city_id, day, degree)
-- Write a solution to report the day that has the maximum recorded degree in each city. If the
-- maximum degree was recorded for the same city multiple times, return the earliest day among
-- them.
-- Return the result table ordered by city_id in ascending order.
-- The result format is shown in the following example.

WITH T AS (
  SELECT
    *,
    RANK() OVER (PARTITION BY city_id ORDER BY degree DESC, day NULLS FIRST) AS rk
  FROM Weather
)
SELECT
  city_id,
  day,
  degree
FROM T
WHERE
  rk = 1
ORDER BY
  1 NULLS FIRST;
