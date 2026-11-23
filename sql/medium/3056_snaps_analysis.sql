-- 3056. Snaps Analysis
-- https://leetcode.com/problems/snaps-analysis/
--
-- Activities(activity_id, user_id, activity_type, time_spent)
-- Age(user_id, age_bucket)
-- Write a solution to calculate the percentage of the total time spent on sending and opening
-- snaps for each age group. Precentage should be rounded to 2 decimal places.
-- Return the result table in any order.

SELECT
  age_bucket,
  ROUND(
    100 * SUM(CASE WHEN activity_type = 'send' THEN time_spent ELSE 0 END) / NULLIF(SUM(time_spent), 0),
    2
  ) AS send_perc,
  ROUND(
    100 * SUM(CASE WHEN activity_type = 'open' THEN time_spent ELSE 0 END) / NULLIF(SUM(time_spent), 0),
    2
  ) AS open_perc
FROM Activities
JOIN Age
  USING (user_id)
GROUP BY
  1;
