-- 3421. Find Students Who Improved
-- https://leetcode.com/problems/find-students-who-improved/
--
-- Scores(student_id, subject, score, exam_date)
-- Write a solution to find the students who have shown improvement. A student is considered to
-- have shown improvement if they meet both of these conditions:
-- Have taken exams in the same subject on at least two different dates
-- Their latest score in that subject is higher than their first score
-- Return the result table ordered by student_id, subject in ascending order.

WITH RankedScores AS (
  SELECT
    student_id,
    subject,
    score,
    exam_date,
    ROW_NUMBER() OVER (PARTITION BY student_id, subject ORDER BY exam_date ASC NULLS FIRST) AS rn_first,
    ROW_NUMBER() OVER (PARTITION BY student_id, subject ORDER BY exam_date DESC) AS rn_latest
  FROM Scores
), FirstAndLatestScores AS (
  SELECT
    f.student_id,
    f.subject,
    f.score AS first_score,
    l.score AS latest_score
  FROM RankedScores AS f
  JOIN RankedScores AS l
    ON f.student_id = l.student_id AND f.subject = l.subject
  WHERE
    f.rn_first = 1 AND l.rn_latest = 1
)
SELECT
  *
FROM FirstAndLatestScores
WHERE
  latest_score > first_score
ORDER BY
  1 NULLS FIRST,
  2 NULLS FIRST;
