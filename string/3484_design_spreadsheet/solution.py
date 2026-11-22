"""LeetCode 3484. Design Spreadsheet

https://leetcode.com/problems/design-spreadsheet/
"""

from __future__ import annotations


class Spreadsheet:
    def __init__(self, rows: int):
        raise NotImplementedError()

    def setCell(self, cell: str, value: int) -> None:
        raise NotImplementedError()

    def resetCell(self, cell: str) -> None:
        raise NotImplementedError()

    def getValue(self, formula: str) -> int:
        raise NotImplementedError()
