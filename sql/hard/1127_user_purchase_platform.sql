-- 1127. User Purchase Platform
-- https://leetcode.com/problems/user-purchase-platform/
--
-- Spending(user_id, spend_date, platform, amount)
-- Write a solution to find the total number of users and the total amount spent using the mobile
-- only, the desktop only, and both mobile and desktop together for each date.
-- Return the result table in any order.

WITH P AS (
  SELECT DISTINCT
    spend_date,
    'desktop' AS platform
  FROM Spending
  UNION
  SELECT DISTINCT
    spend_date,
    'mobile'
  FROM Spending
  UNION
  SELECT DISTINCT
    spend_date,
    'both'
  FROM Spending
), T AS (
  SELECT
    user_id,
    spend_date,
    SUM(amount) AS amount,
    CASE WHEN COUNT(platform) = 1 THEN MAX(platform) ELSE 'both' END AS platform
  FROM Spending
  GROUP BY
    1,
    2
)
SELECT
  p.*,
  COALESCE(SUM(amount), 0) AS total_amount,
  COUNT(t.user_id) AS total_users
FROM P AS p
LEFT JOIN T AS t
  USING (spend_date, platform)
GROUP BY
  1,
  2;
