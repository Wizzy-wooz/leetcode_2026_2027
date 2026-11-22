"""Tests for LeetCode 56: Merge Intervals."""

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from solution import Solution


class TestMergeIntervals(unittest.TestCase):
    def setUp(self):
        self.solution = Solution()

    def test_example_one(self):
        self.assertEqual(
            self.solution.merge([[1, 3], [2, 6], [8, 10], [15, 18]]),
            [[1, 6], [8, 10], [15, 18]],
        )

    def test_example_two(self):
        self.assertEqual(
            self.solution.merge([[1, 4], [4, 5]]),
            [[1, 5]],
        )

    def test_nested_intervals(self):
        self.assertEqual(
            self.solution.merge([[1, 10], [2, 3], [4, 8]]),
            [[1, 10]],
        )

    def test_disjoint_intervals(self):
        self.assertEqual(
            self.solution.merge([[1, 2], [4, 5], [7, 8]]),
            [[1, 2], [4, 5], [7, 8]],
        )

    def test_single_interval(self):
        self.assertEqual(self.solution.merge([[3, 7]]), [[3, 7]])


if __name__ == "__main__":
    unittest.main()
