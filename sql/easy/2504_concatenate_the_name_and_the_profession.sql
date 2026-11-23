-- 2504. Concatenate the Name and the Profession
-- https://leetcode.com/problems/concatenate-the-name-and-the-profession/
--
-- Person(person_id, name, profession)
-- Write a solution to report each person's name followed by the first letter of their profession
-- enclosed in parentheses.
-- Return the result table ordered by person_id in descending order.

SELECT
  person_id,
  name || '(' || SUBSTRING(profession, 1, 1) || ')' AS name
FROM Person
ORDER BY
  person_id DESC;
