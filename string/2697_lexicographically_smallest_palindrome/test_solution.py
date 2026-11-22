import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().makeSmallestPalindrome('egcfe')
        self.assertEqual(actual, 'efcfe')

    def test_example_2(self):
        actual = Solution().makeSmallestPalindrome('abcd')
        self.assertEqual(actual, 'abba')

    def test_example_3(self):
        actual = Solution().makeSmallestPalindrome('seven')
        self.assertEqual(actual, 'neven')


if __name__ == "__main__":
    unittest.main()
