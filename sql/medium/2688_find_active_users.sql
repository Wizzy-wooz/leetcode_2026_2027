-- 2688. Find Active Users
-- https://leetcode.com/problems/find-active-users/
--
-- Users(user_id, item, created_at, amount)
-- Write a solution to identify active users. An active user is a user that has made a second
-- purchase within 7 days of any other of their purchases.
-- For example, if the ending date is May 31, 2023. So any date between May 31, 2023, and June 7,
-- 2023 (inclusive) would be considered "within 7 days" of May 31, 2023.
-- Return a list of user_id which denotes the list of active users in any order.
-- The result format is in the following example.

SELECT DISTINCT
  user_id
FROM Users
WHERE
  user_id IN (
    SELECT
      user_id
    FROM (
      SELECT
        user_id,
        created_at,
        LAG(created_at, 1) OVER (PARTITION BY user_id ORDER BY created_at NULLS FIRST) AS prev_created_at
      FROM Users
    ) AS t
    WHERE
      DATE_DIFF('DAY', prev_created_at, created_at) <= 7
  );
