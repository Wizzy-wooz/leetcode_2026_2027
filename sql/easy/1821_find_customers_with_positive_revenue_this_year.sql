-- 1821. Find Customers With Positive Revenue this Year
-- https://leetcode.com/problems/find-customers-with-positive-revenue-this-year/
--
-- Customers(customer_id, year, revenue)
-- Write a solution to report the customers with postive revenue in the year 2021.
-- Return the result table in any order.
-- The result format is in the following example.

SELECT
  customer_id
FROM Customers
WHERE
  year = '2021' AND revenue > 0;
