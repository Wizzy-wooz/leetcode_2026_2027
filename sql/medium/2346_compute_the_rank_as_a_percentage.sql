-- 2346. Compute the Rank as a Percentage
-- https://leetcode.com/problems/compute-the-rank-as-a-percentage/
--
-- Students(student_id, department_id, mark)
-- Write a solution to report the rank of each student in their department as a percentage, where
-- the rank as a percentage is computed using the following formula:
-- (student_rank_in_the_department - 1) * 100 / (the_number_of_students_in_the_department - 1).
-- The percentage should be rounded to 2 decimal places. student_rank_in_the_department is
-- determined by descending mark, such that the student with the highest mark is rank 1. If two
-- students get the same mark, they also get the same rank.
-- Return the result table in any order.
-- The result format is in the following example.

SELECT
  student_id,
  department_id,
  COALESCE(
    ROUND(
      (
        RANK() OVER (PARTITION BY department_id ORDER BY mark DESC) - 1
      ) * 100 / NULLIF((
        COUNT(1) OVER (PARTITION BY department_id) - 1
      ), 0),
      2
    ),
    0
  ) AS percentage
FROM Students;
