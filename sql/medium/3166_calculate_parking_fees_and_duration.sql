-- 3166. Calculate Parking Fees and Duration
-- https://leetcode.com/problems/calculate-parking-fees-and-duration/
--
-- ParkingTransactions(lot_id, car_id, entry_time, exit_time, fee_paid)
-- Write a solution to find the total parking fee paid by each car across all parking lots, and
-- the average hourly fee (rounded to 2 decimal places) paid by each car. Also, find the parking
-- lot where each car spent the most total time.
-- Return the result table ordered by car_id in ascending order.
-- Note: Test cases are generated in such a way that an individual car cannot be in multiple
-- parking lots at the same time.

WITH T AS (
  SELECT
    car_id,
    lot_id,
    SUM(DATE_SUB('SECOND', entry_time, exit_time)) AS duration
  FROM ParkingTransactions
  GROUP BY
    1,
    2
), P AS (
  SELECT
    *,
    ROW_NUMBER() OVER (PARTITION BY car_id ORDER BY duration DESC) AS rn
  FROM T
), C AS (
  SELECT
    car_id,
    SUM(fee_paid) AS total_fee_paid,
    SUM(DATE_SUB('SECOND', entry_time, exit_time)) AS total_seconds
  FROM ParkingTransactions
  GROUP BY
    car_id
)
SELECT
  C.car_id,
  C.total_fee_paid,
  ROUND(C.total_fee_paid / NULLIF((
    C.total_seconds / NULLIF(3600, 0)
  ), 0), 2) AS avg_hourly_fee,
  P.lot_id AS most_time_lot
FROM C
LEFT JOIN P
  ON C.car_id = P.car_id AND P.rn = 1
ORDER BY
  C.car_id NULLS FIRST;
