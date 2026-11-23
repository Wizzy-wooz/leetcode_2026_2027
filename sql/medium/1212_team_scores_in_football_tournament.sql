-- 1212. Team Scores in Football Tournament
-- https://leetcode.com/problems/team-scores-in-football-tournament/
--
-- Teams(team_id, team_name)
-- Matches(match_id, host_team, guest_team, host_goals, guest_goals)
-- A team receives three points if they win a match (i.e., Scored more goals than the opponent
-- team).
-- A team receives one point if they draw a match (i.e., Scored the same number of goals as the
-- opponent team).
-- A team receives no points if they lose a match (i.e., Scored fewer goals than the opponent
-- team).
-- Write a solution that selects the team_id, team_name and num_points of each team in the
-- tournament after all described matches.
-- Return the result table ordered by num_points in decreasing order. In case of a tie, order the
-- records by team_id in increasing order.

SELECT
  team_id,
  team_name,
  SUM(
    CASE
      WHEN team_id = host_team AND host_goals > guest_goals
      THEN 3
      WHEN team_id = guest_team AND guest_goals > host_goals
      THEN 3
      WHEN host_goals = guest_goals
      THEN 1
      ELSE 0
    END
  ) AS num_points
FROM Teams
LEFT JOIN Matches
  ON team_id = host_team OR team_id = guest_team
GROUP BY
  1,
  team_name
ORDER BY
  3 DESC,
  1 NULLS FIRST;
