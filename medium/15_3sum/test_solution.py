"""Tests for LeetCode 15: 3Sum."""

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from solution import Solution


class TestThreeSum(unittest.TestCase):
    def setUp(self):
        self.solution = Solution()

    def test_example_one(self):
        result = self.solution.threeSum([-1, 0, 1, 2, -1, -4])
        self.assertEqual(sorted(map(tuple, result)), [(-1, -1, 2), (-1, 0, 1)])

    def test_no_matching_triplets(self):
        self.assertEqual(self.solution.threeSum([1, 2, 3]), [])

    def test_all_zeros(self):
        self.assertEqual(self.solution.threeSum([0, 0, 0]), [[0, 0, 0]])

    def test_fewer_than_three_numbers(self):
        self.assertEqual(self.solution.threeSum([0, 1]), [])


if __name__ == "__main__":
    unittest.main()
