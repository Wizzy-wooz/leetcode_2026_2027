"""LeetCode 2408. Design SQL

https://leetcode.com/problems/design-sql/
"""

from __future__ import annotations


class SQL:
    def __init__(self, names: list[str], columns: list[int]):
        raise NotImplementedError()

    def ins(self, name: str, row: list[str]) -> bool:
        raise NotImplementedError()

    def rmv(self, name: str, rowId: int) -> None:
        raise NotImplementedError()

    def sel(self, name: str, rowId: int, columnId: int) -> str:
        raise NotImplementedError()

    def exp(self, name: str) -> list[str]:
        raise NotImplementedError()
