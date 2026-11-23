-- 3262. Find Overlapping Shifts
-- https://leetcode.com/problems/find-overlapping-shifts/
--
-- EmployeeShifts(employee_id, start_time, end_time)
-- Write a solution to count the number of overlapping shifts for each employee. Two shifts are
-- considered overlapping if one shift’s end_time is later than another shift’s start_time.
-- Return the result table ordered by employee_id in ascending order.

SELECT
  t1.employee_id,
  COUNT(*) AS overlapping_shifts
FROM EmployeeShifts AS t1
JOIN EmployeeShifts AS t2
  ON t1.employee_id = t2.employee_id
  AND t1.start_time < t2.start_time
  AND t1.end_time > t2.start_time
GROUP BY
  1
HAVING
  overlapping_shifts > 0
ORDER BY
  1 NULLS FIRST;
