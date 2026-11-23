-- 2362. Generate the Invoice
-- https://leetcode.com/problems/generate-the-invoice/
--
-- Products(product_id, price)
-- Purchases(invoice_id, product_id, quantity)
-- Write a solution to show the details of the invoice with the highest price. If two or more
-- invoices have the same price, return the details of the one with the smallest invoice_id.
-- Return the result table in any order.
-- The result format is shown in the following example.

WITH P AS (
  SELECT
    *
  FROM Purchases
  JOIN Products
    USING (product_id)
), T AS (
  SELECT
    invoice_id,
    SUM(price * quantity) AS amount
  FROM P
  GROUP BY
    invoice_id
  ORDER BY
    2 DESC,
    1 NULLS FIRST
  LIMIT 1
)
SELECT
  product_id,
  quantity,
  (
    quantity * price
  ) AS price
FROM P
JOIN T
  USING (invoice_id);
