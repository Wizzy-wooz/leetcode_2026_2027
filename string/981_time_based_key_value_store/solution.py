"""LeetCode 981. Time Based Key-Value Store

https://leetcode.com/problems/time-based-key-value-store/
"""

from __future__ import annotations


class TimeMap:
    def __init__(self):
        raise NotImplementedError()

    def set(self, key: str, value: str, timestamp: int) -> None:
        raise NotImplementedError()

    def get(self, key: str, timestamp: int) -> str:
        raise NotImplementedError()
