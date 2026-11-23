-- 1097. Game Play Analysis V
-- https://leetcode.com/problems/game-play-analysis-v/
--
-- Activity(player_id, device_id, event_date, games_played)
-- The install date of a player is the first login day of that player.
-- We define day one retention of some date x to be the number of players whose install date is x
-- and they logged back in on the day right after x, divided by the number of players whose
-- install date is x, rounded to 2 decimal places.
-- Write a solution to report for each install date, the number of players that installed the game
-- on that day, and the day one retention.
-- Return the result table in any order.

WITH T AS (
  SELECT
    player_id,
    event_date,
    MIN(event_date) OVER (PARTITION BY player_id) AS install_dt
  FROM Activity
)
SELECT
  install_dt,
  COUNT(DISTINCT player_id) AS installs,
  ROUND(
    SUM(DATE_DIFF('DAY', install_dt, event_date) = 1) / NULLIF(COUNT(DISTINCT player_id), 0),
    2
  ) AS day1_retention
FROM T
GROUP BY
  1;
