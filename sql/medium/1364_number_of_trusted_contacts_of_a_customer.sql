-- 1364. Number of Trusted Contacts of a Customer
-- https://leetcode.com/problems/number-of-trusted-contacts-of-a-customer/
--
-- Customers(customer_id, customer_name, email)
-- Contacts(user_id, contact_name, contact_email)
-- Invoices(invoice_id, price, user_id)
-- Write a solution to find the following for each invoice_id:
-- customer_name: The name of the customer the invoice is related to.
-- price: The price of the invoice.
-- contacts_cnt: The number of contacts related to the customer.
-- trusted_contacts_cnt: The number of contacts related to the customer and at the same time they
-- are customers to the shop. (i.e their email exists in the Customers table.)
-- Return the result table ordered by invoice_id.

SELECT
  invoice_id,
  t2.customer_name,
  price,
  COUNT(t3.user_id) AS contacts_cnt,
  COUNT(t4.email) AS trusted_contacts_cnt
FROM Invoices AS t1
LEFT JOIN Customers AS t2
  ON t1.user_id = t2.customer_id
LEFT JOIN Contacts AS t3
  ON t1.user_id = t3.user_id
LEFT JOIN Customers AS t4
  ON t3.contact_email = t4.email
GROUP BY
  invoice_id,
  t2.customer_name,
  price
ORDER BY
  invoice_id NULLS FIRST;
