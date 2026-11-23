-- 1939. Users That Actively Request Confirmation Messages
-- https://leetcode.com/problems/users-that-actively-request-confirmation-messages/
--
-- Signups(user_id, time_stamp)
-- Confirmations(user_id, time_stamp, action)
-- Write a solution to find the IDs of the users that requested a confirmation message twice
-- within a 24-hour window. Two messages exactly 24 hours apart are considered to be within the
-- window. The action does not affect the answer, only the request time.
-- Return the result table in any order.
-- The result format is in the following example.

SELECT DISTINCT
  user_id
FROM Confirmations AS c1
JOIN Confirmations AS c2
  USING (user_id)
WHERE
  c1.time_stamp < c2.time_stamp
  AND DATE_SUB('SECOND', c1.time_stamp, c2.time_stamp) <= 24 * 60 * 60;
