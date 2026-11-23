-- 1633. Percentage of Users Attended a Contest
-- https://leetcode.com/problems/percentage-of-users-attended-a-contest/
--
-- Users(user_id, user_name)
-- Register(contest_id, user_id)
-- Write a solution to find the percentage of the users registered in each contest rounded to two
-- decimals.
-- Return the result table ordered by percentage in descending order. In case of a tie, order it
-- by contest_id in ascending order.

SELECT
  contest_id,
  ROUND(COUNT(1) * 100 / NULLIF((
    SELECT
      COUNT(1)
    FROM Users
  ), 0), 2) AS percentage
FROM Register
GROUP BY
  1
ORDER BY
  2 DESC,
  1 NULLS FIRST;
