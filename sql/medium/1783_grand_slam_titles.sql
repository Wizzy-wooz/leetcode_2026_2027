-- 1783. Grand Slam Titles
-- https://leetcode.com/problems/grand-slam-titles/
--
-- Players(player_id, player_name)
-- Championships(year, Wimbledon, Fr_open, US_open, Au_open)
-- Write a solution to report the number of grand slam tournaments won by each player. Do not
-- include the players who did not win any tournament.
-- Return the result table in any order.

WITH T AS (
  SELECT
    Wimbledon AS player_id
  FROM Championships
  UNION ALL
  SELECT
    Fr_open AS player_id
  FROM Championships
  UNION ALL
  SELECT
    US_open AS player_id
  FROM Championships
  UNION ALL
  SELECT
    Au_open AS player_id
  FROM Championships
)
SELECT
  player_id,
  player_name,
  COUNT(1) AS grand_slams_count
FROM T
JOIN Players
  USING (player_id)
GROUP BY
  1,
  player_name;
