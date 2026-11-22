"""LeetCode 2166. Design Bitset

https://leetcode.com/problems/design-bitset/
"""

from __future__ import annotations


class Bitset:
    def __init__(self, size: int):
        raise NotImplementedError()

    def fix(self, idx: int) -> None:
        raise NotImplementedError()

    def unfix(self, idx: int) -> None:
        raise NotImplementedError()

    def flip(self) -> None:
        raise NotImplementedError()

    def all(self) -> bool:
        raise NotImplementedError()

    def one(self) -> bool:
        raise NotImplementedError()

    def count(self) -> int:
        raise NotImplementedError()

    def toString(self) -> str:
        raise NotImplementedError()
