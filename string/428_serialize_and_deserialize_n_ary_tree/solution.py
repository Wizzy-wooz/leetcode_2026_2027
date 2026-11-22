"""LeetCode 428. Serialize and Deserialize N-ary Tree

https://leetcode.com/problems/serialize-and-deserialize-n-ary-tree/
"""

class Node:
    def __init__(self, val=None, children=None):
        self.val = val
        self.children = children


class Codec:
    def serialize(self, root):
        raise NotImplementedError

    def deserialize(self, data):
        raise NotImplementedError
