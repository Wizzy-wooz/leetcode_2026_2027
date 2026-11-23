-- 1454. Active Users
-- https://leetcode.com/problems/active-users/
--
-- Accounts(id, name)
-- Logins(id, login_date)
-- Active users are those who logged in to their accounts for five or more consecutive days.
-- Write a solution to find the id and the name of active users.
-- Return the result table ordered by id.

WITH T AS (
  SELECT DISTINCT
    *
  FROM Logins
  JOIN Accounts
    USING (id)
), P AS (
  SELECT
    *,
    login_date - INTERVAL (
      ROW_NUMBER() OVER (PARTITION BY id ORDER BY login_date NULLS FIRST)
    ) DAY AS g
  FROM T
)
SELECT DISTINCT
  id,
  name
FROM P
GROUP BY
  id,
  g,
  name
HAVING
  COUNT(*) >= 5
ORDER BY
  1 NULLS FIRST;
