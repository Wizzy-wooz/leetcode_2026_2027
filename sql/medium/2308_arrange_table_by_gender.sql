-- 2308. Arrange Table by Gender
-- https://leetcode.com/problems/arrange-table-by-gender/
--
-- Genders(user_id, gender)
-- Write a solution to rearrange the Genders table such that the rows alternate between 'female',
-- 'other', and 'male' in order. The table should be rearranged such that the IDs of each gender
-- are sorted in ascending order.
-- Return the result table in the mentioned order.
-- The result format is shown in the following example.

WITH t AS (
  SELECT
    *,
    RANK() OVER (PARTITION BY gender ORDER BY user_id NULLS FIRST) AS rk1,
    CASE WHEN gender = 'female' THEN 0 WHEN gender = 'other' THEN 1 ELSE 2 END AS rk2
  FROM Genders
)
SELECT
  user_id,
  gender
FROM t
ORDER BY
  rk1 NULLS FIRST,
  rk2 NULLS FIRST;
