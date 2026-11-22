"""LeetCode 449. Serialize and Deserialize BST

https://leetcode.com/problems/serialize-and-deserialize-bst/
"""

class TreeNode:
    def __init__(self, val=None, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Codec:
    def serialize(self, root):
        raise NotImplementedError

    def deserialize(self, data):
        raise NotImplementedError
