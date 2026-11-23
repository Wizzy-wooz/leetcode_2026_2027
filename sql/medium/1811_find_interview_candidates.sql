-- 1811. Find Interview Candidates
-- https://leetcode.com/problems/find-interview-candidates/
--
-- Contests(contest_id, gold_medal, silver_medal, bronze_medal)
-- Users(user_id, mail, name)
-- Write a solution to report the name and the mail of all interview candidates. A user is an
-- interview candidate if at least one of these two conditions is true:
-- The user won any medal in three or more consecutive contests.
-- The user won the gold medal in three or more different contests (not necessarily consecutive).
-- Return the result table in any order.

WITH S AS (
  SELECT
    contest_id,
    gold_medal AS user_id,
    1 AS type
  FROM Contests
  UNION
  SELECT
    contest_id,
    silver_medal AS user_id,
    2 AS type
  FROM Contests
  UNION
  SELECT
    contest_id,
    bronze_medal AS user_id,
    3 AS type
  FROM Contests
), T AS (
  SELECT
    user_id,
    (
      contest_id - ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY contest_id NULLS FIRST)
    ) AS diff
  FROM S
), P AS (
  SELECT
    user_id
  FROM S
  WHERE
    type = 1
  GROUP BY
    user_id
  HAVING
    COUNT(1) >= 3
  UNION
  SELECT DISTINCT
    user_id
  FROM T
  GROUP BY
    user_id,
    diff
  HAVING
    COUNT(1) >= 3
)
SELECT
  name,
  mail
FROM P AS p
LEFT JOIN Users AS u
  ON p.user_id = u.user_id;
