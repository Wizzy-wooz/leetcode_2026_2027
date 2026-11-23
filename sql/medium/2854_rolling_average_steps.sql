-- 2854. Rolling Average Steps
-- https://leetcode.com/problems/rolling-average-steps/
--
-- Steps(user_id, steps_count, steps_date)
-- Write a solution to calculate 3-day rolling averages of steps for each user.
-- We calculate the n-day rolling average this way:
-- For each day, we calculate the average of n consecutive days of step counts ending on that day
-- if available, otherwise, n-day rolling average is not defined for it.
-- Output the user_id, steps_date, and rolling average. Round the rolling average to two decimal
-- places.
-- Return the result table ordered by user_id, steps_date in ascending order.

WITH T AS (
  SELECT
    user_id,
    steps_date,
    ROUND(
      AVG(steps_count) OVER (
        PARTITION BY user_id
        ORDER BY steps_date NULLS FIRST
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
      ),
      2
    ) AS rolling_average,
    DATE_DIFF(
      'DAY',
      LAG(steps_date, 2) OVER (PARTITION BY user_id ORDER BY steps_date NULLS FIRST),
      steps_date
    ) = 2 AS st
  FROM Steps
)
SELECT
  user_id,
  steps_date,
  rolling_average
FROM T
WHERE
  st = 1
ORDER BY
  1 NULLS FIRST,
  2 NULLS FIRST;
