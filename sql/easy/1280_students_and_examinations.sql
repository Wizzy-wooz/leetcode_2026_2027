-- 1280. Students and Examinations
-- https://leetcode.com/problems/students-and-examinations/
--
-- Students(student_id, student_name)
-- Subjects(subject_name)
-- Examinations(student_id, subject_name)
-- Write a solution to find the number of times each student attended each exam.
-- Return the result table ordered by student_id and subject_name.

SELECT
  student_id,
  student_name,
  subject_name,
  COUNT(e.student_id) AS attended_exams
FROM Students
CROSS JOIN Subjects
LEFT JOIN Examinations AS e
  USING (student_id, subject_name)
GROUP BY
  1,
  3,
  student_name
ORDER BY
  1 NULLS FIRST,
  3 NULLS FIRST;
