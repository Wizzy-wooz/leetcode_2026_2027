-- 512. Game Play Analysis II
-- https://leetcode.com/problems/game-play-analysis-ii/
--
-- Activity(player_id, device_id, event_date, games_played)
-- Write a solution to report the device that is first logged in for each player.
-- Return the result table in any order.
-- The result format is in the following example.

SELECT
  player_id,
  device_id
FROM Activity
WHERE
  (player_id, event_date) IN (
    SELECT
      player_id,
      MIN(event_date) AS event_date
    FROM Activity
    GROUP BY
      1
  );
