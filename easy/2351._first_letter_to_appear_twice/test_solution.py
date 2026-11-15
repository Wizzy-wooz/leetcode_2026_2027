"""Tests for LeetCode 2351: First Letter to Appear Twice."""

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from solution import Solution


class TestRepeatedCharacter(unittest.TestCase):
    def setUp(self):
        self.solution = Solution()

    def test_example_repeated_character(self):
        self.assertEqual(self.solution.repeatedCharacter("abccbaacz"), "c")

    def test_first_repeat_is_not_the_most_frequent_character(self):
        self.assertEqual(self.solution.repeatedCharacter("abcdd"), "d")

    def test_repeat_appears_early(self):
        self.assertEqual(self.solution.repeatedCharacter("zz"), "z")

    def test_identifies_character_that_repeats_first(self):
        self.assertEqual(self.solution.repeatedCharacter("abacb"), "a")

    def test_later_repeats_do_not_change_answer(self):
        self.assertEqual(self.solution.repeatedCharacter("abccba"), "c")

    def test_repeat_is_found_at_the_last_character(self):
        self.assertEqual(self.solution.repeatedCharacter("abcdefghijklmnopqrstuvwxyza"), "a")


if __name__ == "__main__":
    unittest.main()
