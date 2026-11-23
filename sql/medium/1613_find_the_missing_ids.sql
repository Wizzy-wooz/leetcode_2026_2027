-- 1613. Find the Missing IDs
-- https://leetcode.com/problems/find-the-missing-ids/
--
-- Customers(customer_id, customer_name)
-- Write a solution to find the missing customer IDs. The missing IDs are ones that are not in the
-- Customers table but are in the range between 1 and the maximum customer_id present in the
-- table.
-- Notice that the maximum customer_id will not exceed 100.
-- Return the result table ordered by ids in ascending order.

WITH RECURSIVE t AS (
  SELECT
    1 AS n
  UNION ALL
  SELECT
    n + 1
  FROM t
  WHERE
    n < 100
)
SELECT
  n AS ids
FROM t
WHERE
  n < (
    SELECT
      MAX(customer_id)
    FROM Customers
  )
  AND NOT n IN (
    SELECT
      customer_id
    FROM Customers
  );
