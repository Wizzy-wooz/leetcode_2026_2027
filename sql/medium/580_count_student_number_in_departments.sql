-- 580. Count Student Number in Departments
-- https://leetcode.com/problems/count-student-number-in-departments/
--
-- Student(student_id, student_name, gender, dept_id)
-- Department(dept_id, dept_name)
-- Write a solution to report the respective department name and number of students majoring in
-- each department for all departments in the Department table (even ones with no current
-- students).
-- Return the result table ordered by student_number in descending order. In case of a tie, order
-- them by dept_name alphabetically.

SELECT
  dept_name,
  COUNT(student_id) AS student_number
FROM Department
LEFT JOIN Student
  USING (dept_id)
GROUP BY
  dept_id,
  dept_name
ORDER BY
  2 DESC,
  1 NULLS FIRST;
