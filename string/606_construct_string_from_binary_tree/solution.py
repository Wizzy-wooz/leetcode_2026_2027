"""LeetCode 606. Construct String from Binary Tree

https://leetcode.com/problems/construct-string-from-binary-tree/
"""

from __future__ import annotations


class TreeNode:
    def __init__(self, val=None, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def tree2str(self, root: Optional[TreeNode]) -> str:
        raise NotImplementedError()
