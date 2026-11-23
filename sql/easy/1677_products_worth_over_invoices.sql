-- 1677. Product's Worth Over Invoices
-- https://leetcode.com/problems/products-worth-over-invoices/
--
-- Product(product_id, name)
-- Invoice(invoice_id, product_id, rest, paid, canceled, refunded)
-- Write a solution that will, for all products, return each product name with the total amount
-- due, paid, canceled, and refunded across all invoices.
-- Return the result table ordered by product_name.
-- The result format is in the following example.

SELECT
  name,
  COALESCE(SUM(rest), 0) AS rest,
  COALESCE(SUM(paid), 0) AS paid,
  COALESCE(SUM(canceled), 0) AS canceled,
  COALESCE(SUM(refunded), 0) AS refunded
FROM Product
LEFT JOIN Invoice
  USING (product_id)
GROUP BY
  product_id,
  name
ORDER BY
  name NULLS FIRST;
