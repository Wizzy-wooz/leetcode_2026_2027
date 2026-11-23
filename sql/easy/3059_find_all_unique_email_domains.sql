-- 3059. Find All Unique Email Domains
-- https://leetcode.com/problems/find-all-unique-email-domains/
--
-- Emails(id, email)
-- Write a solution to find all unique email domains and count the number of individuals
-- associated with each domain. Consider only those domains that end with .com.
-- Return the result table orderd by email domains in ascending order.

SELECT
  SPLIT_PART(email, '@', -1) AS email_domain,
  COUNT(1) AS count
FROM Emails
WHERE
  email LIKE '%.com'
GROUP BY
  1
ORDER BY
  1 NULLS FIRST;
