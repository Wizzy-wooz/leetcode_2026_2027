-- 2339. All the Matches of the League
-- https://leetcode.com/problems/all-the-matches-of-the-league/
--
-- Teams(team_name)
-- Write a solution to report all the possible matches of the league. Note that every two teams
-- play two matches with each other, with one team being the home_team once and the other time
-- being the away_team.
-- Return the result table in any order.
-- The result format is in the following example.

SELECT
  t1.team_name AS home_team,
  t2.team_name AS away_team
FROM Teams AS t1
CROSS JOIN Teams AS t2
WHERE
  t1.team_name <> t2.team_name;
