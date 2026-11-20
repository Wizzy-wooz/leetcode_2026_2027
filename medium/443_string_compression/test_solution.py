"""Tests for LeetCode 443: String Compression."""

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from solution import Solution


class TestStringCompression(unittest.TestCase):
    def setUp(self):
        self.solution = Solution()

    def assert_compressed(self, chars: list[str], expected: list[str]) -> None:
        length = self.solution.compress(chars)
        self.assertEqual(length, len(expected))
        self.assertEqual(chars[:length], expected)

    def test_example_one(self):
        self.assert_compressed(
            ["a", "a", "b", "b", "c", "c", "c"],
            ["a", "2", "b", "2", "c", "3"],
        )

    def test_single_character(self):
        self.assert_compressed(["a"], ["a"])

    def test_no_repeated_characters(self):
        self.assert_compressed(["a", "b", "c"], ["a", "b", "c"])

    def test_count_with_multiple_digits(self):
        self.assert_compressed(["a"] * 12, ["a", "1", "2"])


if __name__ == "__main__":
    unittest.main()
