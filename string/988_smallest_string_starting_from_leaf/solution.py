"""LeetCode 988. Smallest String Starting From Leaf

https://leetcode.com/problems/smallest-string-starting-from-leaf/
"""

from __future__ import annotations


class TreeNode:
    def __init__(self, val=None, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def smallestFromLeaf(self, root: TreeNode) -> str:
        raise NotImplementedError()
