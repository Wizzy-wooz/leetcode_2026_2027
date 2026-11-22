"""LeetCode 1396. Design Underground System

https://leetcode.com/problems/design-underground-system/
"""

from __future__ import annotations


class UndergroundSystem:
    def __init__(self):
        raise NotImplementedError()

    def checkIn(self, id: int, stationName: str, t: int) -> None:
        raise NotImplementedError()

    def checkOut(self, id: int, stationName: str, t: int) -> None:
        raise NotImplementedError()

    def getAverageTime(self, startStation: str, endStation: str) -> float:
        raise NotImplementedError()
