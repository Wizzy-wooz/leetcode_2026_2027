"""LeetCode 2590. Design a Todo List

https://leetcode.com/problems/design-a-todo-list/
"""

from __future__ import annotations


class TodoList:
    def __init__(self):
        raise NotImplementedError()

    def addTask(self, userId: int, taskDescription: str, dueDate: int, tags: list[str]) -> int:
        raise NotImplementedError()

    def getAllTasks(self, userId: int) -> list[str]:
        raise NotImplementedError()

    def getTasksForTag(self, userId: int, tag: str) -> list[str]:
        raise NotImplementedError()

    def completeTask(self, userId: int, taskId: int) -> None:
        raise NotImplementedError()
