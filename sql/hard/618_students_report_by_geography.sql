-- 618. Students Report By Geography
-- https://leetcode.com/problems/students-report-by-geography/
--
-- Student(name, continent)
-- A school has students from Asia, Europe, and America.
-- Write a solution to pivot the continent column in the Student table so that each name is sorted
-- alphabetically and displayed underneath its corresponding continent. The output headers should
-- be America, Asia, and Europe, respectively.
-- The test cases are generated so that the student number from America is not less than either
-- Asia or Europe.

WITH T AS (
  SELECT
    *,
    ROW_NUMBER() OVER (PARTITION BY continent ORDER BY name NULLS FIRST) AS rk
  FROM Student
)
SELECT
  MAX(CASE WHEN continent = 'America' THEN name ELSE NULL END) AS "America",
  MAX(CASE WHEN continent = 'Asia' THEN name ELSE NULL END) AS "Asia",
  MAX(CASE WHEN continent = 'Europe' THEN name ELSE NULL END) AS "Europe"
FROM T
GROUP BY
  rk;
