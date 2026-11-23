-- 1112. Highest Grade For Each Student
-- https://leetcode.com/problems/highest-grade-for-each-student/
--
-- Enrollments(student_id, course_id, grade)
-- Write a solution to find the highest grade with its corresponding course for each student. In
-- case of a tie, you should find the course with the smallest course_id.
-- Return the result table ordered by student_id in ascending order.
-- The result format is in the following example.

WITH T AS (
  SELECT
    *,
    RANK() OVER (PARTITION BY student_id ORDER BY grade DESC, course_id NULLS FIRST) AS rk
  FROM Enrollments
)
SELECT
  student_id,
  course_id,
  grade
FROM T
WHERE
  rk = 1
ORDER BY
  student_id NULLS FIRST;
