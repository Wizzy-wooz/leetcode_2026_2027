-- 2173. Longest Winning Streak
-- https://leetcode.com/problems/longest-winning-streak/
--
-- Matches(player_id, match_day, result)
-- The winning streak of a player is the number of consecutive wins uninterrupted by draws or
-- losses.
-- Write a solution to count the longest winning streak for each player.
-- Return the result table in any order.
-- The result format is in the following example.

WITH S AS (
  SELECT
    *,
    ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY match_day NULLS FIRST) - ROW_NUMBER() OVER (PARTITION BY player_id, result ORDER BY match_day NULLS FIRST) AS rk
  FROM Matches
), T AS (
  SELECT
    player_id,
    SUM(result = 'Win') AS s
  FROM S
  GROUP BY
    player_id,
    rk
)
SELECT
  player_id,
  MAX(s) AS longest_streak
FROM T
GROUP BY
  player_id;
