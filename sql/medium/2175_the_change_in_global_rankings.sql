-- 2175. The Change in Global Rankings
-- https://leetcode.com/problems/the-change-in-global-rankings/
--
-- TeamPoints(team_id, name, points)
-- PointsChange(team_id, points_change)
-- The global ranking of a national team is its rank after sorting all the teams by their points
-- in descending order. If two teams have the same points, we break the tie by sorting them by
-- their name in lexicographical order.
-- The points of each national team should be updated based on its corresponding points_change
-- value.
-- Write a solution to calculate the change in the global rankings after updating each team's
-- points.
-- Return the result table in any order.

WITH P AS (
  SELECT
    team_id,
    SUM(points_change) AS delta
  FROM PointsChange
  GROUP BY
    team_id
)
SELECT
  team_id,
  name,
  CAST(RANK() OVER (ORDER BY points DESC, name NULLS FIRST) AS BIGINT) - CAST(RANK() OVER (ORDER BY (
    points + delta
  ) DESC, name NULLS FIRST) AS BIGINT) AS "rank_diff"
FROM TeamPoints
JOIN P
  USING (team_id);
