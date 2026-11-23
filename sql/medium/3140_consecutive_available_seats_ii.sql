-- 3140. Consecutive Available Seats II
-- https://leetcode.com/problems/consecutive-available-seats-ii/
--
-- Cinema(seat_id, free)
-- Write a solution to find the length of longest consecutive sequence of available seats in the
-- cinema.
-- Note:
-- There will always be at most one longest consecutive sequence.
-- If there are multiple consecutive sequences with the same length, include all of them in the
-- output.
-- Return the result table ordered by first_seat_id in ascending order.

WITH T AS (
  SELECT
    *,
    seat_id - (
      RANK() OVER (ORDER BY seat_id NULLS FIRST)
    ) AS gid
  FROM Cinema
  WHERE
    free = 1
), P AS (
  SELECT
    MIN(seat_id) AS first_seat_id,
    MAX(seat_id) AS last_seat_id,
    COUNT(1) AS consecutive_seats_len,
    RANK() OVER (ORDER BY COUNT(1) DESC) AS rk
  FROM T
  GROUP BY
    gid
)
SELECT
  first_seat_id,
  last_seat_id,
  consecutive_seats_len
FROM P
WHERE
  rk = 1
ORDER BY
  1 NULLS FIRST;
