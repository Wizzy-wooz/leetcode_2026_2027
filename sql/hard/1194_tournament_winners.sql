-- 1194. Tournament Winners
-- https://leetcode.com/problems/tournament-winners/
--
-- Players(player_id, group_id)
-- Matches(match_id, first_player, second_player, first_score, second_score)
-- The winner in each group is the player who scored the maximum total points within the group. In
-- the case of a tie, the lowest player_id wins.
-- Write a solution to find the winner in each group.
-- Return the result table in any order.

WITH s AS (
  SELECT
    first_player AS player_id,
    first_score AS score,
    group_id
  FROM Matches AS m
  JOIN Players AS p
    ON m.first_player = p.player_id
  UNION ALL
  SELECT
    second_player AS player_id,
    second_score AS score,
    group_id
  FROM Matches AS m
  JOIN Players AS p
    ON m.second_player = p.player_id
), t AS (
  SELECT
    group_id,
    player_id,
    SUM(score) AS scores
  FROM s
  GROUP BY
    player_id,
    group_id
), p AS (
  SELECT
    group_id,
    player_id,
    RANK() OVER (PARTITION BY group_id ORDER BY scores DESC, player_id NULLS FIRST) AS rk
  FROM t
)
SELECT
  group_id,
  player_id
FROM p
WHERE
  rk = 1;
