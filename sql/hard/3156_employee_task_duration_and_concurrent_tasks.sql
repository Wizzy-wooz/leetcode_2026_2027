-- 3156. Employee Task Duration and Concurrent Tasks
-- https://leetcode.com/problems/employee-task-duration-and-concurrent-tasks/
--
-- Tasks(task_id, employee_id, start_time, end_time)
-- Write a solution to find the total duration of tasks for each employee and the maximum number
-- of concurrent tasks an employee handled at any point in time. The total duration should be
-- rounded down to the nearest number of full hours.
-- Return the result table ordered by employee_id ascending order.

WITH T AS (
  SELECT DISTINCT
    employee_id,
    start_time AS st
  FROM Tasks
  UNION
  SELECT DISTINCT
    employee_id,
    end_time AS st
  FROM Tasks
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
  INNER JOIN Tasks
    USING (employee_id)
  WHERE
    P.st >= Tasks.start_time AND P.ed <= Tasks.end_time
  GROUP BY
    1,
    2,
    3
)
SELECT
  employee_id,
  FLOOR(SUM(EPOCH(ed - st) / NULLIF(3600, 0))) AS total_task_hours,
  MAX(concurrent_count) AS max_concurrent_tasks
FROM S
GROUP BY
  1
ORDER BY
  1 NULLS FIRST;
