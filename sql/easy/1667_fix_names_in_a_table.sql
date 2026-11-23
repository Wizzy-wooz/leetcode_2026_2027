-- 1667. Fix Names in a Table
-- https://leetcode.com/problems/fix-names-in-a-table/
--
-- Users(user_id, name)
-- Write a solution to fix the names so that only the first character is uppercase and the rest
-- are lowercase.
-- Return the result table ordered by user_id.

SELECT
  user_id,
  UPPER(LEFT(name, CASE WHEN 1 < 0 THEN 0 ELSE 1 END)) || LOWER(SUBSTRING(name, 2)) AS name
FROM users
ORDER BY
  user_id NULLS FIRST;
