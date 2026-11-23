-- 2989. Class Performance
-- https://leetcode.com/problems/class-performance/
--
-- Scores(student_id, student_name, assignment1, assignment2, assignment3)
-- Write a solution to calculate the difference in the total score (sum of all 3 assignments)
-- between the highest score obtained by students and the lowest score obtained by them.
-- Return the result table in any order.

SELECT
  MAX(assignment1 + assignment2 + assignment3) - MIN(assignment1 + assignment2 + assignment3) AS difference_in_score
FROM Scores;
