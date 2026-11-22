"""LeetCode 588. Design In-Memory File System

https://leetcode.com/problems/design-in-memory-file-system/
"""

from __future__ import annotations


class FileSystem:
    def __init__(self):
        raise NotImplementedError()

    def ls(self, path: str) -> list[str]:
        raise NotImplementedError()

    def mkdir(self, path: str) -> None:
        raise NotImplementedError()

    def addContentToFile(self, filePath: str, content: str) -> None:
        raise NotImplementedError()

    def readContentFromFile(self, filePath: str) -> str:
        raise NotImplementedError()
