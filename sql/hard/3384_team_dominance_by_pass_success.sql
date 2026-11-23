-- 3384. Team Dominance by Pass Success
-- https://leetcode.com/problems/team-dominance-by-pass-success/
--
-- Teams(player_id, team_name)
-- Passes(pass_from, time_stamp, pass_to)
-- Write a solution to calculate the dominance score for each team in both halves of the match.
-- The rules are as follows:
-- A match is divided into two halves: first half (00:00-45:00 minutes) and second half
-- (45:01-90:00 minutes)
-- The dominance score is calculated based on successful and intercepted passes: When pass_to is a
-- player from the same team: +1 point
-- When pass_to is a player from the opposing team (interception): -1 point
-- A higher dominance score indicates better passing performance
-- Return the result table ordered by team_name and half_number in ascending order.

WITH T AS (
  SELECT
    t1.team_name,
    CASE WHEN time_stamp <= '45:00' THEN 1 ELSE 2 END AS half_number,
    CASE WHEN t1.team_name = t2.team_name THEN 1 ELSE -1 END AS dominance
  FROM Passes AS p
  JOIN Teams AS t1
    ON p.pass_from = t1.player_id
  JOIN Teams AS t2
    ON p.pass_to = t2.player_id
)
SELECT
  team_name,
  half_number,
  SUM(dominance) AS dominance
FROM T
GROUP BY
  1,
  2
ORDER BY
  1 NULLS FIRST,
  2 NULLS FIRST;
