-- 3390. Longest Team Pass Streak
-- https://leetcode.com/problems/longest-team-pass-streak/
--
-- Teams(player_id, team_name)
-- Passes(pass_from, time_stamp, pass_to)
-- Write a solution to find the longest successful pass streak for each team during the match. The
-- rules are as follows:
-- A successful pass streak is defined as consecutive passes where: Both the pass_from and pass_to
-- players belong to the same team
-- A streak breaks when either: The pass is intercepted (received by a player from the opposing
-- team)
-- Return the result table ordered by team_name in ascending order.

WITH PassesWithTeams AS (
  SELECT
    p.pass_from,
    p.pass_to,
    t1.team_name AS team_from,
    t2.team_name AS team_to,
    CASE WHEN t1.team_name = t2.team_name THEN 1 ELSE 0 END AS same_team_flag,
    p.time_stamp
  FROM Passes AS p
  JOIN Teams AS t1
    ON p.pass_from = t1.player_id
  JOIN Teams AS t2
    ON p.pass_to = t2.player_id
), StreakGroups AS (
  SELECT
    team_from AS team_name,
    time_stamp,
    same_team_flag,
    SUM(CASE WHEN same_team_flag = 0 THEN 1 ELSE 0 END) OVER (PARTITION BY team_from ORDER BY time_stamp NULLS FIRST) AS group_id
  FROM PassesWithTeams
), StreakLengths AS (
  SELECT
    team_name,
    group_id,
    COUNT(*) AS streak_length
  FROM StreakGroups
  WHERE
    same_team_flag = 1
  GROUP BY
    1,
    2
), LongestStreaks AS (
  SELECT
    team_name,
    MAX(streak_length) AS longest_streak
  FROM StreakLengths
  GROUP BY
    1
)
SELECT
  team_name,
  longest_streak
FROM LongestStreaks
ORDER BY
  1 NULLS FIRST;
