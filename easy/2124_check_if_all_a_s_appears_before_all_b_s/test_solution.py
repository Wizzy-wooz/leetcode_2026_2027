"""Tests for LeetCode 2124: Check if All A's Appears Before All B's."""

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from solution import Solution


class TestCheckString(unittest.TestCase):
    def setUp(self):
        self.solution = Solution()

    def test_example_one(self):
        self.assertTrue(self.solution.checkString("aaabbb"))

    def test_example_two(self):
        self.assertFalse(self.solution.checkString("abab"))

    def test_all_a(self):
        self.assertTrue(self.solution.checkString("aaaa"))

    def test_all_b(self):
        self.assertTrue(self.solution.checkString("bbbb"))

    def test_a_after_b(self):
        self.assertFalse(self.solution.checkString("ba"))

    def test_single_character(self):
        self.assertTrue(self.solution.checkString("a"))


if __name__ == "__main__":
    unittest.main()
