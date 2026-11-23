-- 1709. Biggest Window Between Visits
-- https://leetcode.com/problems/biggest-window-between-visits/
--
-- UserVisits(user_id, visit_date)
-- Assume today's date is '2021-1-1'.
-- Write a solution that will, for each user_id, find out the largest window of days between each
-- visit and the one right after it (or today if you are considering the last visit).
-- Return the result table ordered by user_id.

WITH T AS (
  SELECT
    user_id,
    DATE_DIFF(
      'DAY',
      visit_date,
      LEAD(visit_date, 1, '2021-1-1') OVER (PARTITION BY user_id ORDER BY visit_date NULLS FIRST)
    ) AS diff
  FROM UserVisits
)
SELECT
  user_id,
  MAX(diff) AS biggest_window
FROM T
GROUP BY
  1
ORDER BY
  1 NULLS FIRST;
