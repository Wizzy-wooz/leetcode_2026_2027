-- 2020. Number of Accounts That Did Not Stream
-- https://leetcode.com/problems/number-of-accounts-that-did-not-stream/
--
-- Subscriptions(account_id, start_date, end_date)
-- Streams(session_id, account_id, stream_date)
-- Write an SQL query to report the number of accounts that bought a subscription in 2021 but did
-- not have any stream session.

SELECT
  COUNT(sub.account_id) AS accounts_count
FROM Subscriptions AS sub
LEFT JOIN Streams
  USING (account_id)
WHERE
  YEAR(CAST(start_date AS DATE)) <= 2021
  AND YEAR(CAST(end_date AS DATE)) >= 2021
  AND (
    YEAR(CAST(stream_date AS DATE)) <> 2021 OR stream_date > end_date
  );
