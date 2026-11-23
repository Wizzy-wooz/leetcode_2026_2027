-- 1841. League Statistics
-- https://leetcode.com/problems/league-statistics/
--
-- Teams(team_id, team_name)
-- Matches(home_team_id, away_team_id, home_team_goals, away_team_goals)
-- Write a solution to report the statistics of the league. The statistics should be built using
-- the played matches where the winning team gets three points and the losing team gets no points.
-- If a match ends with a draw, both teams get one point.
-- Each row of the result table should contain:
-- team_name - The name of the team in the Teams table.
-- matches_played - The number of matches played as either a home or away team.
-- points - The total points the team has so far.
-- goal_for - The total number of goals scored by the team across all matches.
-- goal_against - The total number of goals scored by opponent teams against this team across all
-- matches.
-- goal_diff - The result of goal_for - goal_against.
-- Return the result table ordered by points in descending order. If two or more teams have the
-- same points, order them by goal_diff in descending order. If there is still a tie, order them
-- by team_name in lexicographical order.

WITH Scores AS (
  SELECT
    home_team_id AS team_id,
    CASE
      WHEN home_team_goals > away_team_goals
      THEN 3
      WHEN home_team_goals < away_team_goals
      THEN 0
      ELSE 1
    END AS score,
    home_team_goals AS goals,
    away_team_goals AS away_goals
  FROM Matches
  UNION ALL
  SELECT
    away_team_id AS team_id,
    CASE
      WHEN home_team_goals > away_team_goals
      THEN 0
      WHEN home_team_goals < away_team_goals
      THEN 3
      ELSE 1
    END AS score,
    away_team_goals AS goals,
    home_team_goals AS away_goals
  FROM Matches
)
SELECT
  team_name,
  COUNT(1) AS matches_played,
  SUM(score) AS points,
  SUM(goals) AS goal_for,
  SUM(away_goals) AS goal_against,
  (
    SUM(goals) - SUM(away_goals)
  ) AS goal_diff
FROM Scores AS s
JOIN Teams AS t
  ON s.team_id = t.team_id
GROUP BY
  s.team_id,
  team_name
ORDER BY
  points DESC,
  goal_diff DESC,
  team_name NULLS FIRST;
