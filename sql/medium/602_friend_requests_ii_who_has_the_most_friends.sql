-- 602. Friend Requests II Who Has the Most Friends
-- https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/
--
-- RequestAccepted(requester_id, accepter_id, accept_date)
-- Write a solution to find the people who have the most friends and the most friends number.
-- The test cases are generated so that only one person has the most friends.

WITH T AS (
  SELECT
    requester_id,
    accepter_id
  FROM RequestAccepted
  UNION ALL
  SELECT
    accepter_id,
    requester_id
  FROM RequestAccepted
)
SELECT
  requester_id AS id,
  COUNT(1) AS num
FROM T
GROUP BY
  1
ORDER BY
  2 DESC
LIMIT 1;
