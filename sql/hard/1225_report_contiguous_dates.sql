-- 1225. Report Contiguous Dates
-- https://leetcode.com/problems/report-contiguous-dates/
--
-- Failed(fail_date)
-- Succeeded(success_date)
-- A system is running one task every day. Every task is independent of the previous tasks. The
-- tasks can fail or succeed.
-- Write a solution to report the period_state for each continuous interval of days in the period
-- from 2019-01-01 to 2019-12-31.
-- period_state is 'failed' if tasks in this interval failed or 'succeeded' if tasks in this
-- interval succeeded. Interval of days are retrieved as start_date and end_date.
-- Return the result table ordered by start_date.
-- The result format is in the following example.

WITH T AS (
  SELECT
    fail_date AS dt,
    'failed' AS st
  FROM Failed
  WHERE
    YEAR(CAST(fail_date AS DATE)) = 2019
  UNION ALL
  SELECT
    success_date AS dt,
    'succeeded' AS st
  FROM Succeeded
  WHERE
    YEAR(CAST(success_date AS DATE)) = 2019
)
SELECT
  st AS period_state,
  MIN(dt) AS start_date,
  MAX(dt) AS end_date
FROM (
  SELECT
    *,
    dt - CAST(RANK() OVER (PARTITION BY st ORDER BY dt NULLS FIRST) AS INTEGER) AS pt
  FROM T
) AS t
GROUP BY
  1,
  pt
ORDER BY
  2 NULLS FIRST;
