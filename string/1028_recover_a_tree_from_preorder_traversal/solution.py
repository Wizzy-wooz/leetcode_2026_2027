"""LeetCode 1028. Recover a Tree From Preorder Traversal

https://leetcode.com/problems/recover-a-tree-from-preorder-traversal/
"""

from __future__ import annotations


class TreeNode:
    def __init__(self, val=None, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def recoverFromPreorder(self, traversal: str) -> TreeNode | None:
        raise NotImplementedError()
