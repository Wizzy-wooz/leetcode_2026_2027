"""LeetCode 385. Mini Parser

https://leetcode.com/problems/mini-parser/
"""

from __future__ import annotations


class NestedInteger:
    def __init__(self, value=None):
        self.value = [] if value is None else value

    def isInteger(self):
        return isinstance(self.value, int)

    def add(self, element):
        self.value.append(element)

    def setInteger(self, value):
        self.value = value

    def getInteger(self):
        return self.value if self.isInteger() else None

    def getList(self):
        return None if self.isInteger() else self.value


class Solution:
    def deserialize(self, s: str) -> NestedInteger:
        raise NotImplementedError()
