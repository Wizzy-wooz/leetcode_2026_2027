-- 574. Winning Candidate
-- https://leetcode.com/problems/winning-candidate/
--
-- Candidate(id, name)
-- Vote(id, candidateId)
-- Write a solution to report the name of the winning candidate (i.e., the candidate who got the
-- largest number of votes).
-- The test cases are generated so that exactly one candidate wins the elections.

SELECT
  Name
FROM (
  SELECT
    CandidateId AS id
  FROM Vote
  GROUP BY
    CandidateId
  ORDER BY
    COUNT(id) DESC
  LIMIT 1
) AS t
INNER JOIN Candidate AS c
  ON t.id = c.id;
