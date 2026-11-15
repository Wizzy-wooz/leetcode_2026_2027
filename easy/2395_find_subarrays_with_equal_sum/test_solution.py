"""Tests for LeetCode 2395: Find Subarrays With Equal Sum."""

import unittest
import sys
from pathlib import Path

# Ensure the sibling solution.py is importable when tests are launched from
# the repository root or by an IDE's unittest runner.
sys.path.insert(0, str(Path(__file__).resolve().parent))
from solution import Solution


class TestFindSubarrays(unittest.TestCase):
    def setUp(self):
        self.solution = Solution()

    def test_repeated_sum_from_problem_example(self):
        self.assertTrue(self.solution.findSubarrays([4, 2, 4]))

    def test_all_adjacent_sums_are_distinct(self):
        self.assertFalse(self.solution.findSubarrays([1, 2, 3, 4, 5]))

    def test_repeated_sum_with_overlapping_subarrays(self):
        self.assertTrue(self.solution.findSubarrays([1, 2, 2, 1]))

    def test_zero_sums_repeat(self):
        self.assertTrue(self.solution.findSubarrays([0, 0, 0]))

    def test_same_values_are_not_required(self):
        # 1 + 4 and 2 + 3 are both 5.
        self.assertTrue(self.solution.findSubarrays([1, 4, 2, 3]))

    def test_only_one_subarray(self):
        self.assertFalse(self.solution.findSubarrays([7, 7]))

    def test_large_values_and_repeat_at_the_end(self):
        self.assertTrue(self.solution.findSubarrays([1000, 1000, 1, 1999]))


if __name__ == "__main__":
    unittest.main()
