import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().shortestPalindrome('aacecaaa')
        self.assertEqual(actual, 'aaacecaaa')

    def test_example_2(self):
        actual = Solution().shortestPalindrome('abcd')
        self.assertEqual(actual, 'dcbabcd')


if __name__ == "__main__":
    unittest.main()
