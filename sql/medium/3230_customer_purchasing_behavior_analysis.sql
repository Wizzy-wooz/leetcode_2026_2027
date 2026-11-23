-- 3230. Customer Purchasing Behavior Analysis
-- https://leetcode.com/problems/customer-purchasing-behavior-analysis/
--
-- Transactions(transaction_id, customer_id, product_id, transaction_date, amount)
-- Products(product_id, category, price)
-- Write a solution to analyze customer purchasing behavior. For each customer, calculate:
-- The total amount spent.
-- The number of transactions.
-- The number of unique product categories purchased.
-- The average amount spent.
-- The most frequently purchased product category (if there is a tie, choose the one with the most
-- recent transaction).
-- A loyalty score defined as: (Number of transactions * 10) + (Total amount spent / 100).
-- Round total_amount, avg_transaction_amount, and loyalty_score to 2 decimal places.
-- Return the result table ordered by loyalty_score in descending order, then by customer_id in
-- ascending order.

WITH T AS (
  SELECT
    *
  FROM Transactions
  JOIN Products
    USING (product_id)
), P AS (
  SELECT
    customer_id,
    category,
    COUNT(1) AS cnt,
    MAX(transaction_date) AS max_date
  FROM T
  GROUP BY
    1,
    2
), R AS (
  SELECT
    customer_id,
    category,
    RANK() OVER (PARTITION BY customer_id ORDER BY cnt DESC, max_date DESC) AS rk
  FROM P
)
SELECT
  t.customer_id,
  ROUND(SUM(amount), 2) AS total_amount,
  COUNT(1) AS transaction_count,
  COUNT(DISTINCT t.category) AS unique_categories,
  ROUND(AVG(amount), 2) AS avg_transaction_amount,
  MAX(r.category) AS top_category,
  ROUND(COUNT(1) * 10 + SUM(amount) / NULLIF(100, 0), 2) AS loyalty_score
FROM T AS t
JOIN R AS r
  ON t.customer_id = r.customer_id AND r.rk = 1
GROUP BY
  1
ORDER BY
  7 DESC,
  1 NULLS FIRST;
