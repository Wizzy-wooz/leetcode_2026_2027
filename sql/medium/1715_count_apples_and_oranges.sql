-- 1715. Count Apples and Oranges
-- https://leetcode.com/problems/count-apples-and-oranges/
--
-- Boxes(box_id, chest_id, apple_count, orange_count)
-- Chests(chest_id, apple_count, orange_count)
-- Write a solution to count the number of apples and oranges in all the boxes. If a box contains
-- a chest, you should also include the number of apples and oranges it has.

SELECT
  SUM(COALESCE(b.apple_count, 0) + COALESCE(c.apple_count, 0)) AS apple_count,
  SUM(COALESCE(b.orange_count, 0) + COALESCE(c.orange_count, 0)) AS orange_count
FROM Boxes AS b
LEFT JOIN Chests AS c
  USING (chest_id);
