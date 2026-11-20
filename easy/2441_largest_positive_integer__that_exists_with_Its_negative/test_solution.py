"""Tests for LeetCode 2441: Largest Positive Integer That Exists With Its Negative."""

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from solution import Solution


class TestFindMaxK(unittest.TestCase):
    def setUp(self):
        self.solution = Solution()

    def test_example_one(self):
        self.assertEqual(self.solution.findMaxK([-1, 2, -3, 3]), 3)

    def test_example_two(self):
        self.assertEqual(self.solution.findMaxK([-1, 10, 6, 7, -7, 1]), 7)

    def test_example_with_no_matching_pair(self):
        self.assertEqual(self.solution.findMaxK([-10, 8, 6, 7, -2, -3]), -1)

    def test_returns_largest_matching_positive(self):
        self.assertEqual(self.solution.findMaxK([-5, 5, -2, 2, -9, 9, 1]), 9)

    def test_smallest_valid_pair(self):
        self.assertEqual(self.solution.findMaxK([-1, 1]), 1)

    def test_duplicates_do_not_change_result(self):
        self.assertEqual(self.solution.findMaxK([-4, -4, 4, 4, 2, -2]), 4)

    def test_all_negative_values_have_no_positive_match(self):
        self.assertEqual(self.solution.findMaxK([-1, -2, -3]), -1)


if __name__ == "__main__":
    unittest.main()
