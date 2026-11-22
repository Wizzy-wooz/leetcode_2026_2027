"""LeetCode 257. Binary Tree Paths

https://leetcode.com/problems/binary-tree-paths/
"""

from __future__ import annotations


class TreeNode:
    def __init__(self, val=None, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def binaryTreePaths(self, root: Optional[TreeNode]) -> list[str]:
        raise NotImplementedError()
