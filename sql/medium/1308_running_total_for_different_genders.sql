-- 1308. Running Total for Different Genders
-- https://leetcode.com/problems/running-total-for-different-genders/
--
-- Scores(player_name, gender, day, score_points)
-- Write a solution to find the total score for each gender on each day.
-- Return the result table ordered by gender and day in ascending order.
-- The result format is in the following example.

SELECT
  gender,
  day,
  SUM(score_points) OVER (PARTITION BY gender ORDER BY gender NULLS FIRST, day NULLS FIRST) AS total
FROM Scores;
