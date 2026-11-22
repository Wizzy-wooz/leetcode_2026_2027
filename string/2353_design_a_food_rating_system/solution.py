"""LeetCode 2353. Design a Food Rating System

https://leetcode.com/problems/design-a-food-rating-system/
"""

from __future__ import annotations


class FoodRatings:
    def __init__(self, foods: list[str], cuisines: list[str], ratings: list[int]):
        raise NotImplementedError()

    def changeRating(self, food: str, newRating: int) -> None:
        raise NotImplementedError()

    def highestRated(self, cuisine: str) -> str:
        raise NotImplementedError()
