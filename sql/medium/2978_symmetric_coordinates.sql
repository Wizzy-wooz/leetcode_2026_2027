-- 2978. Symmetric Coordinates
-- https://leetcode.com/problems/symmetric-coordinates/
--
-- Coordinates(X, Y)
-- Two coordindates (X1, Y1) and (X2, Y2) are said to be symmetric coordintes if X1 == Y2 and X2
-- == Y1.
-- Write a solution that outputs, among all these symmetric coordintes, only those unique
-- coordinates that satisfy the condition X1 <= Y1.
-- Return the result table ordered by X and Y (respectively) in ascending order.

WITH P AS (
  SELECT
    ROW_NUMBER() OVER () AS id,
    x,
    y
  FROM Coordinates
)
SELECT DISTINCT
  p1.x,
  p1.y
FROM P AS p1
JOIN P AS p2
  ON p1.x = p2.y AND p1.y = p2.x AND p1.x <= p1.y AND p1.id <> p2.id
ORDER BY
  1 NULLS FIRST,
  2 NULLS FIRST;
