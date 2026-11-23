-- 262. Trips and Users
-- https://leetcode.com/problems/trips-and-users/
--
-- Trips(id, client_id, driver_id, city_id, status, request_at)
-- Users(users_id, banned, role)
-- The cancellation rate is computed by dividing the number of canceled (by client or driver)
-- requests with unbanned users by the total number of requests with unbanned users on that day.
-- Write a solution to find the cancellation rate of requests with unbanned users (both client and
-- driver must not be banned) each day between "2013-10-01" and "2013-10-03" with at least one
-- trip. Round Cancellation Rate to two decimal points.
-- Return the result table in any order.

SELECT
  request_at AS Day,
  ROUND(AVG(CAST(status <> 'completed' AS INT)), 2) AS "Cancellation Rate"
FROM Trips AS t
JOIN Users AS u1
  ON (
    t.client_id = u1.users_id AND u1.banned = 'No'
  )
JOIN Users AS u2
  ON (
    t.driver_id = u2.users_id AND u2.banned = 'No'
  )
WHERE
  request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY
  request_at;
