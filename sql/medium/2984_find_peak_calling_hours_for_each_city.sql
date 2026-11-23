-- 2984. Find Peak Calling Hours for Each City
-- https://leetcode.com/problems/find-peak-calling-hours-for-each-city/
--
-- Calls(caller_id, recipient_id, call_time, city)
-- Write a solution to find the peak calling hour for each city. If multiple hours have the same
-- number of calls, all of those hours will be recognized as peak hours for that specific city.
-- Return the result table ordered by peak calling hour and city in descending order.

WITH T AS (
  SELECT
    *,
    RANK() OVER (PARTITION BY city ORDER BY cnt DESC) AS rk
  FROM (
    SELECT
      city,
      HOUR(call_time) AS h,
      COUNT(1) AS cnt
    FROM Calls
    GROUP BY
      1,
      2
  ) AS t
)
SELECT
  city,
  h AS peak_calling_hour,
  cnt AS number_of_calls
FROM T
WHERE
  rk = 1
ORDER BY
  2 DESC,
  1 DESC;
