-- 3401. Find Circular Gift Exchange Chains
-- https://leetcode.com/problems/find-circular-gift-exchange-chains/
--
-- SecretSanta(giver_id, receiver_id, gift_value)
-- Write a solution to find the total gift value and length of circular chains of Secret Santa
-- gift exchanges:
-- A circular chain is defined as a series of exchanges where:
-- Each employee gives a gift to exactly one other employee.
-- Each employee receives a gift from exactly one other employee.
-- The exchanges form a continuous loop (e.g., employee A gives a gift to B, B gives to C, and C
-- gives back to A).
-- Return the result ordered by the chain length and total gift value of the chain in descending
-- order. If multiple different chains have the same chain_length and total_gift_value, include
-- that combination only once.

WITH RECURSIVE walk AS (
  SELECT
    giver_id AS start_id,
    receiver_id AS next_id,
    [giver_id] AS seen,
    gift_value AS total
  FROM SecretSanta
  UNION ALL
  SELECT
    start_id,
    s.receiver_id,
    LIST_APPEND(seen, s.giver_id),
    total + s.gift_value
  FROM walk
  JOIN SecretSanta AS s
    ON next_id = s.giver_id
  WHERE
    NOT ARRAY_CONTAINS(seen, next_id)
), cycles AS (
  SELECT DISTINCT
    LENGTH(seen) AS chain_length,
    total AS total_gift_value
  FROM walk
  WHERE
    next_id = start_id
)
SELECT
  ROW_NUMBER() OVER (ORDER BY chain_length DESC, total_gift_value DESC) AS chain_id,
  *
FROM cycles
ORDER BY
  chain_id;
