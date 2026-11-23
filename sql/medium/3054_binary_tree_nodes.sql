-- 3054. Binary Tree Nodes
-- https://leetcode.com/problems/binary-tree-nodes/
--
-- Tree(N, P)
-- Write a solution to find the node type of the Binary Tree. Output one of the following for each
-- node:
-- Root: if the node is the root node.
-- Leaf: if the node is the leaf node.
-- Inner: if the node is neither root nor leaf node.
-- Return the result table ordered by node value in ascending order.

SELECT DISTINCT
  t1.N AS N,
  CASE
    WHEN t1.P IS NULL
    THEN 'Root'
    ELSE CASE WHEN t2.P IS NULL THEN 'Leaf' ELSE 'Inner' END
  END AS Type
FROM Tree AS t1
LEFT JOIN Tree AS t2
  ON t1.N = t2.p
ORDER BY
  1 NULLS FIRST;
