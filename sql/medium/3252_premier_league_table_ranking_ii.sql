-- 3252. Premier League Table Ranking II
-- https://leetcode.com/problems/premier-league-table-ranking-ii/
--
-- TeamStats(team_id, team_name, matches_played, wins, draws, losses)
-- Write a solution to calculate the points, position, and tier for each team in the league.
-- Points are calculated as follows:
-- 3 points for a win
-- 1 point for a draw
-- 0 points for a loss
-- Note: Teams with the same points must be assigned the same position.
-- Tier ranking:
-- Divide the league into 3 tiers based on points:
-- Tier 1: Top 33% of teams
-- Tier 2: Middle 33% of teams
-- Tier 3: Bottom 34% of teams
-- In case of ties at tier boundaries, place tied teams in the higher tier.
-- Return the result table ordered by points in descending, and then by team_name in ascending
-- order.

WITH T AS (
  SELECT
    team_name,
    wins * 3 + draws AS points,
    RANK() OVER (ORDER BY wins * 3 + draws DESC) AS position,
    COUNT(1) OVER () AS total_teams
  FROM TeamStats
)
SELECT
  team_name,
  points,
  position,
  CASE
    WHEN position <= CEIL(total_teams / NULLIF(3.0, 0))
    THEN 'Tier 1'
    WHEN position <= CEIL(2 * total_teams / NULLIF(3.0, 0))
    THEN 'Tier 2'
    ELSE 'Tier 3'
  END AS tier
FROM T
ORDER BY
  2 DESC,
  1 NULLS FIRST;
