"""LeetCode 2096. Step-By-Step Directions From a Binary Tree Node to Another

https://leetcode.com/problems/step-by-step-directions-from-a-binary-tree-node-to-another/
"""

from __future__ import annotations


class TreeNode:
    def __init__(self, val=None, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def getDirections(self, root: Optional[TreeNode], startValue: int, destValue: int) -> str:
        raise NotImplementedError()
