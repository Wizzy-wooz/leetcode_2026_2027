"""Tests for LeetCode 167: Two Sum II - Input Array Is Sorted."""

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from solution import Solution


class TestTwoSum(unittest.TestCase):
    def setUp(self):
        self.solution = Solution()

    def test_example_one(self):
        self.assertEqual(self.solution.twoSum([2, 7, 11, 15], 9), [1, 2])

    def test_example_two(self):
        self.assertEqual(self.solution.twoSum([2, 3, 4], 6), [1, 3])

    def test_example_three(self):
        self.assertEqual(self.solution.twoSum([-1, 0], -1), [1, 2])

    def test_pair_at_both_ends(self):
        self.assertEqual(self.solution.twoSum([1, 2, 4, 8, 11], 12), [1, 5])

    def test_duplicate_values_at_distinct_positions(self):
        self.assertEqual(self.solution.twoSum([3, 3], 6), [1, 2])


if __name__ == "__main__":
    unittest.main()
