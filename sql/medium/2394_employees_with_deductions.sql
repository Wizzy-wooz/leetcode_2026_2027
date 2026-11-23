-- 2394. Employees With Deductions
-- https://leetcode.com/problems/employees-with-deductions/
--
-- Employees(employee_id, needed_hours)
-- Logs(employee_id, in_time, out_time)
-- In a company, each employee must work a certain number of hours every month. Employees work in
-- sessions. The number of hours an employee worked can be calculated from the sum of the number
-- of minutes the employee worked in all of their sessions. The number of minutes in each session
-- is rounded up.
-- For example, if the employee worked for 51 minutes and 2 seconds in a session, we consider it
-- 52 minutes.
-- Write a solution to report the IDs of the employees that will be deducted. In other words,
-- report the IDs of the employees that did not work the needed hours.
-- Return the result table in any order.
-- The result format is in the following example.

WITH T AS (
  SELECT
    employee_id,
    SUM(CEIL(DATE_SUB('SECOND', in_time, out_time) / NULLIF(60, 0))) / NULLIF(60, 0) AS tot
  FROM Logs
  GROUP BY
    employee_id
)
SELECT
  employee_id
FROM Employees
LEFT JOIN T
  USING (employee_id)
WHERE
  COALESCE(tot, 0) < needed_hours;
