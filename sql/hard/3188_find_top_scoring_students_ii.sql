-- 3188. Find Top Scoring Students II
-- https://leetcode.com/problems/find-top-scoring-students-ii/
--
-- students(student_id, name, major)
-- courses(course_id, name, credits, major, mandatory)
-- enrollments(student_id, course_id, semester, grade, GPA)
-- Write a solution to find the students who meet the following criteria:
-- Have taken all mandatory courses and at least two elective courses offered in their major.
-- Achieved a grade of A in all mandatory courses and at least B in elective courses.
-- Maintained an average GPA of at least 2.5 across all their courses (including those outside
-- their major).
-- Return the result table ordered by student_id in ascending order.

WITH T AS (
  SELECT
    student_id
  FROM enrollments
  GROUP BY
    1
  HAVING
    AVG(GPA) >= 2.5
)
SELECT
  student_id
FROM T
JOIN students
  USING (student_id)
JOIN courses
  USING (major)
LEFT JOIN enrollments
  USING (student_id, course_id)
GROUP BY
  1
HAVING
  SUM(mandatory = 'yes' AND grade = 'A') = SUM(mandatory = 'yes')
  AND SUM(mandatory = 'no' AND NOT grade IS NULL) = SUM(mandatory = 'no' AND grade IN ('A', 'B'))
  AND SUM(mandatory = 'no' AND NOT grade IS NULL) >= 2
ORDER BY
  1 NULLS FIRST;
