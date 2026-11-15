"""Tests for LeetCode 2824: Count Pairs Whose Sum Is Less Than Target."""

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from solution import Solution


class TestCountPairs(unittest.TestCase):
    def setUp(self):
        self.solution = Solution()

    def test_example_one(self):
        self.assertEqual(self.solution.countPairs([-1, 1, 2, 3, 1], 2), 3)

    def test_example_two(self):
        self.assertEqual(self.solution.countPairs([-6, 2, 5, -2, -7, -1, 3], -2), 10)

    def test_pair_equal_to_target_does_not_count(self):
        self.assertEqual(self.solution.countPairs([1, 1, 2], 3), 1)

    def test_duplicate_values_count_as_distinct_index_pairs(self):
        self.assertEqual(self.solution.countPairs([1, 1, 1, 1], 3), 6)

    def test_negative_values(self):
        self.assertEqual(self.solution.countPairs([-5, -2, 0, 4], -1), 3)

    def test_no_valid_pairs(self):
        self.assertEqual(self.solution.countPairs([4, 5, 6], 4), 0)

    def test_single_element(self):
        self.assertEqual(self.solution.countPairs([0], 1), 0)


if __name__ == "__main__":
    unittest.main()
