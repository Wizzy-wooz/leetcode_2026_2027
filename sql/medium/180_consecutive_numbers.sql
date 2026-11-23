-- 180. Consecutive Numbers
-- https://leetcode.com/problems/consecutive-numbers/
--
-- Logs(id, num)
-- Find all numbers that appear at least three times consecutively.
-- Return the result table in any order.
-- The result format is in the following example.

SELECT DISTINCT
  l2.num AS ConsecutiveNums
FROM Logs AS l1
JOIN Logs AS l2
  ON l1.id = l2.id - 1 AND l1.num = l2.num
JOIN Logs AS l3
  ON l2.id = l3.id - 1 AND l2.num = l3.num;
