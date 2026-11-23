-- 3278. Find Candidates for Data Scientist Position II
-- https://leetcode.com/problems/find-candidates-for-data-scientist-position-ii/
--
-- Candidates(candidate_id, skill, proficiency)
-- Projects(project_id, skill, importance)
-- Leetcode is staffing for multiple data science projects. Write a solution to find the best
-- candidate for each project based on the following criteria:
-- Candidates must have all the skills required for a project.
-- Calculate a score for each candidate-project pair as follows: Start with 100 points
-- Add 10 points for each skill where proficiency > importance
-- Subtract 5 points for each skill where proficiency < importance
-- If the candidate's skill proficiency equal to the project's skill importance, the score remains
-- unchanged
-- Include only the top candidate (highest score) for each project. If there’s a tie, choose the
-- candidate with the lower candidate_id. If there is no suitable candidate for a project, do not
-- return that project.
-- Return a result table ordered by project_id in ascending order.

WITH S AS (
  SELECT
    candidate_id,
    project_id,
    COUNT(*) AS matched_skills,
    SUM(
      CASE
        WHEN proficiency > importance
        THEN 10
        WHEN proficiency < importance
        THEN -5
        ELSE 0
      END
    ) + 100 AS score
  FROM Candidates
  JOIN Projects
    USING (skill)
  GROUP BY
    1,
    2
), T AS (
  SELECT
    project_id,
    COUNT(1) AS required_skills
  FROM Projects
  GROUP BY
    1
), P AS (
  SELECT
    project_id,
    candidate_id,
    score,
    RANK() OVER (PARTITION BY project_id ORDER BY score DESC, candidate_id NULLS FIRST) AS rk
  FROM S
  JOIN T
    USING (project_id)
  WHERE
    matched_skills = required_skills
)
SELECT
  project_id,
  candidate_id,
  score
FROM P
WHERE
  rk = 1
ORDER BY
  1 NULLS FIRST;
