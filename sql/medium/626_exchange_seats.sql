-- 626. Exchange Seats
-- https://leetcode.com/problems/exchange-seats/
--
-- Seat(id, student)
-- Write a solution to swap the seat id of every two consecutive students. If the number of
-- students is odd, the id of the last student is not swapped.
-- Return the result table ordered by id in ascending order.

SELECT
  s1.id,
  COALESCE(s2.student, s1.student) AS student
FROM Seat AS s1
LEFT JOIN Seat AS s2
  ON XOR((
    s1.id + 1
  ), 1) - 1 = s2.id
ORDER BY
  1 NULLS FIRST;
