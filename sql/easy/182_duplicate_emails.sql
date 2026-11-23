-- 182. Duplicate Emails
-- https://leetcode.com/problems/duplicate-emails/
--
-- Person(id, email)
-- Write a solution to report all the duplicate emails. Note that it's guaranteed that the email
-- field is not NULL.
-- Return the result table in any order.
-- The result format is in the following example.

SELECT
  email
FROM Person
GROUP BY
  1
HAVING
  COUNT(1) > 1;
