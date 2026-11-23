-- 2298. Tasks Count in the Weekend
-- https://leetcode.com/problems/tasks-count-in-the-weekend/
--
-- Tasks(task_id, assignee_id, submit_date)
-- Write a solution to report:
-- the number of tasks that were submitted during the weekend (Saturday, Sunday) as weekend_cnt,
-- and
-- the number of tasks that were submitted during the working days as working_cnt.
-- Return the result table in any order.
-- The result format is shown in the following example.

SELECT
  SUM(isodow(submit_date) IN (6, 7)) AS weekend_cnt,
  SUM(NOT isodow(submit_date) IN (6, 7)) AS working_cnt
FROM Tasks;
