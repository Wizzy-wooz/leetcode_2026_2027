-- 534. Game Play Analysis III
-- https://leetcode.com/problems/game-play-analysis-iii/
--
-- Activity(player_id, device_id, event_date, games_played)
-- Write a solution to report for each player and date, how many games played so far by the
-- player. That is, the total number of games played by the player until that date. Check the
-- example for clarity.
-- Return the result table in any order.

SELECT
  player_id,
  event_date,
  SUM(games_played) OVER (PARTITION BY player_id ORDER BY event_date NULLS FIRST) AS games_played_so_far
FROM Activity;
