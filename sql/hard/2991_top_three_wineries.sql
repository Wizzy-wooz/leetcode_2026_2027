-- 2991. Top Three Wineries
-- https://leetcode.com/problems/top-three-wineries/
--
-- Wineries(id, country, points, winery)
-- Write a solution to find the top three wineries in each country based on their total points. If
-- multiple wineries have the same total points, order them by winery name in ascending order. If
-- there's no second winery, output 'No second winery,' and if there's no third winery, output 'No
-- third winery.'
-- Return the result table ordered by country in ascending order.

WITH T AS (
  SELECT
    country,
    winery || ' (' || points || ')' AS winery,
    RANK() OVER (PARTITION BY country ORDER BY points DESC, winery NULLS FIRST) AS rk
  FROM (
    SELECT
      country,
      SUM(points) AS points,
      winery
    FROM Wineries
    GROUP BY
      1,
      3
  ) AS t
)
SELECT
  t1.country,
  t1.winery AS top_winery,
  COALESCE(t2.winery, 'No second winery') AS second_winery,
  COALESCE(t3.winery, 'No third winery') AS third_winery
FROM T AS t1
LEFT JOIN T AS t2
  ON t1.country = t2.country AND t1.rk = t2.rk - 1
LEFT JOIN T AS t3
  ON t2.country = t3.country AND t2.rk = t3.rk - 1
WHERE
  t1.rk = 1
ORDER BY
  1 NULLS FIRST;
