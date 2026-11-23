-- 3268. Find Overlapping Shifts II
-- https://leetcode.com/problems/find-overlapping-shifts-ii/
--
-- EmployeeShifts(employee_id, start_time, end_time)
-- Write a solution to analyze overlapping shifts for each employee. Two shifts are considered
-- overlapping if they occur on the same date and one shift's end_time is later than another
-- shift's start_time.
-- For each employee, calculate the following:
-- The maximum number of shifts that overlap at any given time.
-- The total duration of all overlaps in minutes.
-- Return the result table ordered by employee_id in ascending order.

WITH T AS (
  SELECT DISTINCT
    employee_id,
    start_time AS st
  FROM EmployeeShifts
  UNION
  SELECT DISTINCT
    employee_id,
    end_time AS st
  FROM EmployeeShifts
), P AS (
  SELECT
    *,
    LEAD(st) OVER (PARTITION BY employee_id ORDER BY st NULLS FIRST) AS ed
  FROM T
), S AS (
  SELECT
    P.*,
    COUNT(1) AS concurrent_count
  FROM P
  INNER JOIN EmployeeShifts
    USING (employee_id)
  WHERE
    P.st >= EmployeeShifts.start_time AND P.ed <= EmployeeShifts.end_time
  GROUP BY
    1,
    2,
    3
), U AS (
  SELECT
    t1.employee_id,
    SUM(
      DATE_SUB(
        'MINUTE',
        t2.start_time,
        CASE
          WHEN t1.end_time IS NULL OR t2.end_time IS NULL
          THEN NULL
          ELSE LEAST(t1.end_time, t2.end_time)
        END
      )
    ) AS total_overlap_duration
  FROM EmployeeShifts AS t1
  JOIN EmployeeShifts AS t2
    ON t1.employee_id = t2.employee_id
    AND t1.start_time < t2.start_time
    AND t1.end_time > t2.start_time
  GROUP BY
    1
)
SELECT
  employee_id,
  MAX(concurrent_count) AS max_overlapping_shifts,
  COALESCE(AVG(total_overlap_duration), 0) AS total_overlap_duration
FROM S
LEFT JOIN U
  USING (employee_id)
GROUP BY
  1
ORDER BY
  1 NULLS FIRST;
