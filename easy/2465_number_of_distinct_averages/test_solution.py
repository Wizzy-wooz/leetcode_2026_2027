"""Tests for LeetCode 2465: Number of Distinct Averages."""

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from solution import Solution


class TestDistinctAverages(unittest.TestCase):
    def setUp(self):
        self.solution = Solution()

    def test_example_one(self):
        self.assertEqual(self.solution.distinctAverages([4, 1, 4, 0, 3, 5]), 2)

    def test_example_two(self):
        self.assertEqual(self.solution.distinctAverages([1, 100]), 1)

    def test_all_pairs_have_same_average(self):
        self.assertEqual(self.solution.distinctAverages([1, 2, 3, 4, 5, 6]), 1)

    def test_multiple_distinct_averages(self):
        self.assertEqual(self.solution.distinctAverages([1, 2, 5, 10]), 2)

    def test_repeated_values(self):
        self.assertEqual(self.solution.distinctAverages([7, 7, 7, 7]), 1)

    def test_pair_averages_can_be_fractional(self):
        self.assertEqual(self.solution.distinctAverages([1, 2, 3, 8]), 2)


if __name__ == "__main__":
    unittest.main()
