-- 2072. The Winner University
-- https://leetcode.com/problems/the-winner-university/
--
-- NewYork(student_id, score)
-- California(student_id, score)
-- There is a competition between New York University and California University. The competition
-- is held between the same number of students from both universities. The university that has
-- more excellent students wins the competition. If the two universities have the same number of
-- excellent students, the competition ends in a draw.
-- An excellent student is a student that scored 90% or more in the exam.
-- Return:
-- "New York University" if New York University wins the competition.
-- "California University" if California University wins the competition.
-- "No Winner" if the competition ends in a draw.

SELECT
  CASE
    WHEN n1.cnt > n2.cnt
    THEN 'New York University'
    WHEN n1.cnt < n2.cnt
    THEN 'California University'
    ELSE 'No Winner'
  END AS winner
FROM (
  SELECT
    COUNT(1) AS cnt
  FROM NewYork
  WHERE
    score >= 90
) AS n1, (
  SELECT
    COUNT(1) AS cnt
  FROM California
  WHERE
    score >= 90
) AS n2;
