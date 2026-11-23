-- 3808. Find Emotionally Consistent Users
-- https://leetcode.com/problems/find-emotionally-consistent-users/
--
-- reactions(user_id, content_id, reaction)
-- Write a solution to identify emotionally consistent users based on the following requirements:
-- For each user, count the total number of reactions they have given.
-- Only include users who have reacted to at least 5 different content items.
-- A user is considered emotionally consistent if at least 60% of their reactions are of the same
-- type.
-- Return the result table ordered by reaction_ratio in descending order and then by user_id in
-- ascending order.
-- Note:
-- reaction_ratio should be rounded to 2 decimal places

WITH t AS (
  SELECT
    user_id,
    reaction,
    COUNT(1) AS cnt
  FROM reactions
  GROUP BY
    1,
    2
), s AS (
  SELECT
    user_id,
    MAX(cnt) AS mx_cnt,
    ROUND(MAX(cnt) / NULLIF(SUM(cnt), 0), 2) AS reaction_ratio
  FROM t
  GROUP BY
    1
  HAVING
    5 * MAX(cnt) >= 3 * SUM(cnt) AND SUM(cnt) >= 5
)
SELECT
  user_id,
  reaction AS dominant_reaction,
  reaction_ratio
FROM s
JOIN t
  USING (user_id)
WHERE
  cnt = mx_cnt
ORDER BY
  3 DESC,
  1 NULLS FIRST;
