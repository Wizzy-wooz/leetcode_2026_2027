-- 3172. Second Day Verification
-- https://leetcode.com/problems/second-day-verification/
--
-- emails(email_id, user_id, signup_date)
-- texts(text_id, email_id, signup_action, action_date)
-- Write a Solution to find the user IDs of those who verified their sign-up on the second day.
-- Return the result table ordered by user_id in ascending order.

SELECT
  user_id
FROM Emails AS e
JOIN texts AS t
  ON e.email_id = t.email_id
  AND DATE_DIFF('DAY', signup_date, action_date) = 1
  AND signup_action = 'Verified'
ORDER BY
  1 NULLS FIRST;
