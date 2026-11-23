-- 1809. Ad-Free Sessions
-- https://leetcode.com/problems/ad-free-sessions/
--
-- Playback(session_id, customer_id, start_time, end_time)
-- Ads(ad_id, customer_id, timestamp)
-- Write a solution to report all the sessions that did not get shown any ads.
-- Return the result table in any order.

SELECT
  session_id
FROM Playback
WHERE
  NOT session_id IN (
    SELECT
      session_id
    FROM Playback AS p
    JOIN Ads AS a
      ON p.customer_id = a.customer_id AND a.timestamp BETWEEN p.start_time AND p.end_time
  );
