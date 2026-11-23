-- 1988. Find Cutoff Score for Each School
-- https://leetcode.com/problems/find-cutoff-score-for-each-school/
--
-- Schools(school_id, capacity)
-- Exam(score, student_count)
-- Every year, each school announces a minimum score requirement that a student needs to apply to
-- it. The school chooses the minimum score requirement based on the exam results of all the
-- students:
-- They want to ensure that even if every student meeting the requirement applies, the school can
-- accept everyone.
-- They also want to maximize the possible number of students that can apply.
-- They must use a score that is in the Exam table.
-- Write a solution to report the minimum score requirement for each school. If there are multiple
-- score values satisfying the above conditions, choose the smallest one. If the input data is not
-- enough to determine the score, report -1.
-- Return the result table in any order.

SELECT
  school_id,
  MIN(COALESCE(score, -1)) AS score
FROM Schools AS s
LEFT JOIN Exam AS e
  ON s.capacity >= e.student_count
GROUP BY
  school_id;
