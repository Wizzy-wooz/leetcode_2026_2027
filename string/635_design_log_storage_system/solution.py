"""LeetCode 635. Design Log Storage System

https://leetcode.com/problems/design-log-storage-system/
"""

from __future__ import annotations


class LogSystem:
    def __init__(self):
        raise NotImplementedError()

    def put(self, id: int, timestamp: str) -> None:
        raise NotImplementedError()

    def retrieve(self, start: str, end: str, granularity: str) -> list[int]:
        raise NotImplementedError()
