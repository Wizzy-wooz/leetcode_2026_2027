-- 1355. Activity Participants
-- https://leetcode.com/problems/activity-participants/
--
-- Friends(id, name, activity)
-- Activities(id, name)
-- Find the names of all the activities with neither the maximum nor the minimum number of
-- participants.
-- Each activity in the Activities table is performed by any person in the table Friends.
-- Return the result table in any order.
-- The result format is in the following example.

WITH t AS (
  SELECT
    activity,
    COUNT(1) AS cnt
  FROM Friends
  GROUP BY
    activity
)
SELECT
  activity
FROM t
WHERE
  cnt > (
    SELECT
      MIN(cnt)
    FROM t
  )
  AND cnt < (
    SELECT
      MAX(cnt)
    FROM t
  );
