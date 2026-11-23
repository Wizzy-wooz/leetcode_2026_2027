-- 3322. Premier League Table Ranking III
-- https://leetcode.com/problems/premier-league-table-ranking-iii/
--
-- SeasonStats(season_id, team_id, team_name, matches_played, wins, draws, losses, goals_for, goals_against)
-- Write a solution to calculate the points, goal difference, and position for each team in each
-- season. The position ranking should be determined as follows:
-- Teams are first ranked by their total points (highest to lowest)
-- If points are tied, teams are then ranked by their goal difference (highest to lowest)
-- If goal difference is also tied, teams are then ranked alphabetically by team name
-- Points are calculated as follows:
-- 3 points for a win
-- 1 point for a draw
-- 0 points for a loss
-- Goal difference is calculated as: goals_for - goals_against
-- Return the result table ordered by season_id in ascending order, then by position in ascending
-- order, and finally by team_name in ascending order.

SELECT
  season_id,
  team_id,
  team_name,
  wins * 3 + draws AS points,
  goals_for - goals_against AS goal_difference,
  RANK() OVER (
    PARTITION BY season_id
    ORDER BY wins * 3 + draws DESC, goals_for - goals_against DESC, team_name NULLS FIRST
  ) AS position
FROM SeasonStats
ORDER BY
  1 NULLS FIRST,
  6 NULLS FIRST,
  3 NULLS FIRST;
