-- 2752. Customers with Maximum Number of Transactions on Consecutive Days
-- https://leetcode.com/problems/customers-with-maximum-number-of-transactions-on-consecutive-days/
--
-- Transactions(transaction_id, customer_id, transaction_date, amount)
-- Write a solution to find all customer_id who made the maximum number of transactions on
-- consecutive days.
-- Return all customer_id with the maximum number of consecutive transactions. Order the result
-- table by customer_id in ascending order.
-- The result format is in the following example.

WITH s AS (
  SELECT
    customer_id,
    transaction_date - INTERVAL (ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY transaction_date NULLS FIRST)) DAY AS transaction_date
  FROM Transactions
), t AS (
  SELECT
    customer_id,
    transaction_date,
    COUNT(1) AS cnt
  FROM s
  GROUP BY
    1,
    2
)
SELECT
  customer_id
FROM t
WHERE
  cnt = (
    SELECT
      MAX(cnt)
    FROM t
  )
ORDER BY
  customer_id NULLS FIRST;
