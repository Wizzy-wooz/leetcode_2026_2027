-- 1934. Confirmation Rate
-- https://leetcode.com/problems/confirmation-rate/
--
-- Signups(user_id, time_stamp)
-- Confirmations(user_id, time_stamp, action)
-- The confirmation rate of a user is the number of 'confirmed' messages divided by the total
-- number of requested confirmation messages. The confirmation rate of a user that did not request
-- any confirmation messages is 0. Round the confirmation rate to two decimal places.
-- Write a solution to find the confirmation rate of each user.
-- Return the result table in any order.

SELECT
  user_id,
  ROUND(COALESCE(SUM(action = 'confirmed') / NULLIF(COUNT(1), 0), 0), 2) AS confirmation_rate
FROM SignUps
LEFT JOIN Confirmations
  USING (user_id)
GROUP BY
  1;
