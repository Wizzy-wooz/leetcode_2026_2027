-- 3182. Find Top Scoring Students
-- https://leetcode.com/problems/find-top-scoring-students/
--
-- students(student_id, name, major)
-- courses(course_id, name, credits, major)
-- enrollments(student_id, course_id, semester, grade)
-- Write a solution to find the students who have taken all courses offered in their major and
-- have achieved a grade of A in all these courses.
-- Return the result table ordered by student_id in ascending order.

SELECT
  student_id
FROM students
JOIN courses
  USING (major)
LEFT JOIN enrollments
  USING (student_id, course_id)
GROUP BY
  1
HAVING
  SUM(grade = 'A') = COUNT(major)
ORDER BY
  1 NULLS FIRST;
