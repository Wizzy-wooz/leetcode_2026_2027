"""LeetCode 604. Design Compressed String Iterator

https://leetcode.com/problems/design-compressed-string-iterator/
"""

from __future__ import annotations


class StringIterator:
    def __init__(self, compressedString: str):
        raise NotImplementedError()

    def next(self) -> str:
        raise NotImplementedError()

    def hasNext(self) -> bool:
        raise NotImplementedError()
