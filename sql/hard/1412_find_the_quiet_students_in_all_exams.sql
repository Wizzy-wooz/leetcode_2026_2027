-- 1412. Find the Quiet Students in All Exams
-- https://leetcode.com/problems/find-the-quiet-students-in-all-exams/
--
-- Student(student_id, student_name)
-- Exam(exam_id, student_id, score)
-- A quiet student is the one who took at least one exam and did not score the highest or the
-- lowest score.
-- Write a solution to report the students (student_id, student_name) being quiet in all exams. Do
-- not return the student who has never taken any exam.
-- Return the result table ordered by student_id.

WITH T AS (
  SELECT
    student_id,
    RANK() OVER (PARTITION BY exam_id ORDER BY score NULLS FIRST) AS rk1,
    RANK() OVER (PARTITION BY exam_id ORDER BY score DESC) AS rk2
  FROM Exam
)
SELECT
  student_id,
  student_name
FROM T
JOIN Student
  USING (student_id)
GROUP BY
  1,
  student_name
HAVING
  SUM(rk1 = 1) = 0 AND SUM(rk2 = 1) = 0
ORDER BY
  1 NULLS FIRST;
