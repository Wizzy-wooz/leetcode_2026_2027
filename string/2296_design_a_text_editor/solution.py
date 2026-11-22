"""LeetCode 2296. Design a Text Editor

https://leetcode.com/problems/design-a-text-editor/
"""

from __future__ import annotations


class TextEditor:
    def __init__(self):
        raise NotImplementedError()

    def addText(self, text: str) -> None:
        raise NotImplementedError()

    def deleteText(self, k: int) -> int:
        raise NotImplementedError()

    def cursorLeft(self, k: int) -> str:
        raise NotImplementedError()

    def cursorRight(self, k: int) -> str:
        raise NotImplementedError()
