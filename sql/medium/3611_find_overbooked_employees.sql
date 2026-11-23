-- 3611. Find Overbooked Employees
-- https://leetcode.com/problems/find-overbooked-employees/
--
-- employees(employee_id, employee_name, department)
-- meetings(meeting_id, employee_id, meeting_date, meeting_type, duration_hours)
-- Write a solution to find employees who are meeting-heavy - employees who spend more than 50% of
-- their working time in meetings during any given week.
-- Assume a standard work week is 40 hours
-- Calculate total meeting hours per employee per week (Monday to Sunday)
-- An employee is meeting-heavy if their weekly meeting hours > 20 hours (50% of 40 hours)
-- Count how many weeks each employee was meeting-heavy
-- Only include employees who were meeting-heavy for at least 2 weeks
-- Return the result table ordered by the number of meeting-heavy weeks in descending order, then
-- by employee name in ascending order.

WITH week_meeting_hours AS (
  SELECT
    employee_id,
    YEAR(CAST(meeting_date AS DATE)) AS year,
    WEEK(CAST(meeting_date AS DATE)) AS week,
    SUM(duration_hours) AS hours
  FROM meetings
  GROUP BY
    1,
    2,
    3
), intensive_weeks AS (
  SELECT
    employee_id,
    employee_name,
    department,
    COUNT(1) AS meeting_heavy_weeks
  FROM week_meeting_hours
  JOIN employees
    USING (employee_id)
  WHERE
    hours >= 20
  GROUP BY
    1,
    employee_name,
    department
)
SELECT
  employee_id,
  employee_name,
  department,
  meeting_heavy_weeks
FROM intensive_weeks
WHERE
  meeting_heavy_weeks >= 2
ORDER BY
  4 DESC,
  2 NULLS FIRST;
