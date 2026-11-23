-- 1321. Restaurant Growth
-- https://leetcode.com/problems/restaurant-growth/
--
-- Customer(customer_id, name, visited_on, amount)
-- You are the restaurant owner and you want to analyze a possible expansion (there will be at
-- least one customer every day).
-- Compute the moving average of how much the customer paid in a seven days window (i.e., current
-- day + 6 days before). average_amount should be rounded to two decimal places.
-- Return the result table ordered by visited_on in ascending order.

WITH t AS (
  SELECT
    visited_on,
    SUM(amount) OVER (ORDER BY visited_on NULLS FIRST ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
    RANK() OVER (ORDER BY visited_on NULLS FIRST) AS rk
  FROM (
    SELECT
      visited_on,
      SUM(amount) AS amount
    FROM Customer
    GROUP BY
      visited_on
  ) AS tt
)
SELECT
  visited_on,
  amount,
  ROUND(amount / NULLIF(7, 0), 2) AS average_amount
FROM t
WHERE
  rk > 6
ORDER BY
  visited_on NULLS FIRST;
