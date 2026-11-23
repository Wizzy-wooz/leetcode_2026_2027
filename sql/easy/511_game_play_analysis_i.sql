-- 511. Game Play Analysis I
-- https://leetcode.com/problems/game-play-analysis-i/
--
-- Activity(player_id, device_id, event_date, games_played)
-- Write a solution to find the first login date for each player.
-- Return the result table in any order.

SELECT
  player_id,
  MIN(event_date) AS first_login
FROM Activity
GROUP BY
  1;
