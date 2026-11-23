-- 2820. Election Results
-- https://leetcode.com/problems/election-results/
--
-- Votes(voter, candidate)
-- The election is conducted in a city where everyone can vote for one or more candidates or
-- choose not to vote. Each person has 1 vote so if they vote for multiple candidates, their vote
-- gets equally split across them. For example, if a person votes for 2 candidates, these
-- candidates receive an equivalent of 0.5 votes each.
-- Write a solution to find candidate who got the most votes and won the election. Output the name
-- of the candidate or If multiple candidates have an equal number of votes, display the names of
-- all of them.
-- Return the result table ordered by candidate in ascending order.

WITH T AS (
  SELECT
    candidate,
    SUM(vote) AS tot
  FROM (
    SELECT
      candidate,
      1 / NULLIF((
        COUNT(candidate) OVER (PARTITION BY voter)
      ), 0) AS vote
    FROM Votes
    WHERE
      NOT candidate IS NULL
  ) AS t
  GROUP BY
    1
), P AS (
  SELECT
    candidate,
    RANK() OVER (ORDER BY tot DESC) AS rk
  FROM T
)
SELECT
  candidate
FROM P
WHERE
  rk = 1
ORDER BY
  1 NULLS FIRST;
