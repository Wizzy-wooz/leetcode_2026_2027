"""Tests for LeetCode 2109: Adding Spaces to a String."""

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from solution import Solution


class TestAddingSpaces(unittest.TestCase):
    def setUp(self):
        self.solution = Solution()

    def test_example_one(self):
        self.assertEqual(
            self.solution.addSpaces("LeetcodeHelpsMeLearn", [8, 13, 15]),
            "Leetcode Helps Me Learn",
        )

    def test_example_two(self):
        self.assertEqual(
            self.solution.addSpaces("icodeinpython", [1, 5, 7, 9]),
            "i code in py thon",
        )

    def test_spaces_before_first_and_remaining_characters(self):
        self.assertEqual(
            self.solution.addSpaces("spacing", [0, 1, 2, 3, 4, 5, 6]),
            " s p a c i n g",
        )


if __name__ == "__main__":
    unittest.main()
