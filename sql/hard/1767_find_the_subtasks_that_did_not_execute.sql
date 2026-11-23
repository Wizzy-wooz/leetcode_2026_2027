-- 1767. Find the Subtasks That Did Not Execute
-- https://leetcode.com/problems/find-the-subtasks-that-did-not-execute/
--
-- Tasks(task_id, subtasks_count)
-- Executed(task_id, subtask_id)
-- Write a solution to report the IDs of the missing subtasks for each task_id.
-- Return the result table in any order.

WITH RECURSIVE T(task_id, subtask_id) AS (
  SELECT
    task_id,
    subtasks_count
  FROM Tasks
  UNION ALL
  SELECT
    task_id,
    subtask_id - 1
  FROM t
  WHERE
    subtask_id > 1
)
SELECT
  T.*
FROM T
LEFT JOIN Executed
  USING (task_id, subtask_id)
WHERE
  Executed.subtask_id IS NULL;
