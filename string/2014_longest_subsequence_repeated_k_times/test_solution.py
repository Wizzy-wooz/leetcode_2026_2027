import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().longestSubsequenceRepeatedK('letsleetcode', 2)
        self.assertEqual(actual, 'let')

    def test_example_2(self):
        actual = Solution().longestSubsequenceRepeatedK('bb', 2)
        self.assertEqual(actual, 'b')

    def test_example_3(self):
        actual = Solution().longestSubsequenceRepeatedK('ab', 2)
        self.assertEqual(actual, '')


if __name__ == "__main__":
    unittest.main()
