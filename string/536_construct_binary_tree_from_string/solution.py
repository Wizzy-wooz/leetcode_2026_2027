"""LeetCode 536. Construct Binary Tree from String

https://leetcode.com/problems/construct-binary-tree-from-string/
"""

from __future__ import annotations


class TreeNode:
    def __init__(self, val=None, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def str2tree(self, s: str) -> TreeNode:
        raise NotImplementedError()
