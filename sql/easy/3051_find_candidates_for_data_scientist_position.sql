-- 3051. Find Candidates for Data Scientist Position
-- https://leetcode.com/problems/find-candidates-for-data-scientist-position/
--
-- Candidates(candidate_id, skill)
-- Write a query to find the candidates best suited for a Data Scientist position. The candidate
-- must be proficient in Python, Tableau, and PostgreSQL.
-- Return the result table ordered by candidate_id in ascending order.

SELECT
  candidate_id
FROM Candidates
WHERE
  skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY
  1
HAVING
  COUNT(1) = 3
ORDER BY
  1 NULLS FIRST;
