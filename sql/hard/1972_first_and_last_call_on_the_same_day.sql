-- 1972. First and Last Call On the Same Day
-- https://leetcode.com/problems/first-and-last-call-on-the-same-day/
--
-- Calls(caller_id, recipient_id, call_time)
-- Write a solution to report the IDs of the users whose first and last calls on any day were with
-- the same person. Calls are counted regardless of being the caller or the recipient.
-- Return the result table in any order.
-- The result format is in the following example.

WITH s AS (
  SELECT
    *
  FROM Calls
  UNION ALL
  SELECT
    recipient_id,
    caller_id,
    call_time
  FROM Calls
), t AS (
  SELECT
    caller_id AS user_id,
    FIRST_VALUE(recipient_id) OVER (
      PARTITION BY STRFTIME(CAST(call_time AS TIMESTAMP), '%Y-%m-%d'), caller_id
      ORDER BY call_time ASC NULLS FIRST
    ) AS first,
    FIRST_VALUE(recipient_id) OVER (
      PARTITION BY STRFTIME(CAST(call_time AS TIMESTAMP), '%Y-%m-%d'), caller_id
      ORDER BY call_time DESC
    ) AS last
  FROM s
)
SELECT DISTINCT
  user_id
FROM t
WHERE
  first = last;
