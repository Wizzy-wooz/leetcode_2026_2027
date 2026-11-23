-- 550. Game Play Analysis IV
-- https://leetcode.com/problems/game-play-analysis-iv/
--
-- Activity(player_id, device_id, event_date, games_played)
-- Write a solution to report the fraction of players that logged in again on the day after the
-- day they first logged in, rounded to 2 decimal places. In other words, you need to determine
-- the number of players who logged in on the day immediately following their initial login, and
-- divide it by the number of total players.

WITH T AS (
  SELECT
    player_id,
    DATE_DIFF(
      'DAY',
      event_date,
      LEAD(event_date) OVER (PARTITION BY player_id ORDER BY event_date NULLS FIRST)
    ) = 1 AS st,
    RANK() OVER (PARTITION BY player_id ORDER BY event_date NULLS FIRST) AS rk
  FROM Activity
)
SELECT
  ROUND(
    COUNT(CASE WHEN st = 1 THEN player_id ELSE NULL END) / NULLIF(COUNT(DISTINCT player_id), 0),
    2
  ) AS fraction
FROM T
WHERE
  rk = 1;
