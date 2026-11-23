-- 2026. Low-Quality Problems
-- https://leetcode.com/problems/low-quality-problems/
--
-- Problems(problem_id, likes, dislikes)
-- Find the IDs of the low-quality problems. A LeetCode problem is low-quality if the like
-- percentage of the problem (number of likes divided by the total number of votes) is strictly
-- less than 60%.
-- Return the result table ordered by problem_id in ascending order.

SELECT
  problem_id
FROM Problems
WHERE
  likes / NULLIF((
    likes + dislikes
  ), 0) < 0.6
ORDER BY
  problem_id NULLS FIRST;
