-- 1336. Number of Transactions per Visit
-- https://leetcode.com/problems/number-of-transactions-per-visit/
--
-- Visits(user_id, visit_date)
-- Transactions(user_id, transaction_date, amount)
-- A bank wants to draw a chart of the number of transactions bank visitors did in one visit to
-- the bank and the corresponding number of visitors who have done this number of transaction in
-- one visit.
-- Write a solution to find how many users visited the bank and didn't do any transactions, how
-- many visited the bank and did one transaction, and so on.
-- The result table will contain two columns:
-- transactions_count which is the number of transactions done in one visit.
-- visits_count which is the corresponding number of users who did transactions_count in one visit
-- to the bank.
-- transactions_count should take all values from 0 to max(transactions_count) done by one or more
-- users.
-- Return the result table ordered by transactions_count.

WITH RECURSIVE S AS (
  SELECT
    0 AS n
  UNION
  SELECT
    n + 1
  FROM S
  WHERE
    n < (
      SELECT
        MAX(cnt)
      FROM (
        SELECT
          COUNT(1) AS cnt
        FROM Transactions
        GROUP BY
          user_id,
          transaction_date
      ) AS t
    )
), T AS (
  SELECT
    v.user_id,
    visit_date,
    COALESCE(cnt, 0) AS cnt
  FROM Visits AS v
  LEFT JOIN (
    SELECT
      user_id,
      transaction_date,
      COUNT(1) AS cnt
    FROM Transactions
    GROUP BY
      1,
      2
  ) AS t
    ON v.user_id = t.user_id AND v.visit_date = t.transaction_date
)
SELECT
  n AS transactions_count,
  COUNT(user_id) AS visits_count
FROM S AS s
LEFT JOIN T AS t
  ON s.n = t.cnt
GROUP BY
  n
ORDER BY
  n NULLS FIRST;
