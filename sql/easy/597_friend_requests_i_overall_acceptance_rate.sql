-- 597. Friend Requests I Overall Acceptance Rate
-- https://leetcode.com/problems/friend-requests-i-overall-acceptance-rate/
--
-- FriendRequest(sender_id, send_to_id, request_date)
-- RequestAccepted(requester_id, accepter_id, accept_date)
-- Find the overall acceptance rate of requests, which is the number of acceptance divided by the
-- number of requests. Return the answer rounded to 2 decimals places.
-- Note that:
-- The accepted requests are not necessarily from the table friend_request. In this case, Count
-- the total accepted requests (no matter whether they are in the original requests), and divide
-- it by the number of requests to get the acceptance rate.
-- It is possible that a sender sends multiple requests to the same receiver, and a request could
-- be accepted more than once. In this case, the ‘duplicated’ requests or acceptances are only
-- counted once.
-- If there are no requests at all, you should return 0.00 as the accept_rate.

SELECT
  ROUND(
    COALESCE(
      (
        SELECT
          COUNT(
            DISTINCT CASE
              WHEN requester_id IS NULL
              THEN NULL
              WHEN accepter_id IS NULL
              THEN NULL
              ELSE (requester_id, accepter_id)
            END
          )
        FROM RequestAccepted
      ) / NULLIF(
        (
          SELECT
            COUNT(
              DISTINCT CASE
                WHEN sender_id IS NULL
                THEN NULL
                WHEN send_to_id IS NULL
                THEN NULL
                ELSE (sender_id, send_to_id)
              END
            )
          FROM FriendRequest
        ),
        0
      ),
      0
    ),
    2
  ) AS accept_rate;
