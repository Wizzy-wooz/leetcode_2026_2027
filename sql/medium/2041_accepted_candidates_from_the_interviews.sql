-- 2041. Accepted Candidates From the Interviews
-- https://leetcode.com/problems/accepted-candidates-from-the-interviews/
--
-- Candidates(candidate_id, name, years_of_exp, interview_id)
-- Rounds(interview_id, round_id, score)
-- Write a solution to report the IDs of the candidates who have at least two years of experience
-- and the sum of the score of their interview rounds is strictly greater than 15.
-- Return the result table in any order.

SELECT
  candidate_id
FROM Candidates
JOIN Rounds
  USING (interview_id)
WHERE
  years_of_exp >= 2
GROUP BY
  1
HAVING
  SUM(score) > 15;
