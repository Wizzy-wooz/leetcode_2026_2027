-- 603. Consecutive Available Seats
-- https://leetcode.com/problems/consecutive-available-seats/
--
-- Cinema(seat_id, free)
-- Find all the consecutive available seats in the cinema.
-- Return the result table ordered by seat_id in ascending order.
-- The test cases are generated so that more than two seats are consecutively available.

SELECT DISTINCT
  a.seat_id
FROM Cinema AS a
JOIN Cinema AS b
  ON ABS(a.seat_id - b.seat_id) = 1 AND a.free AND b.free
ORDER BY
  1 NULLS FIRST;
