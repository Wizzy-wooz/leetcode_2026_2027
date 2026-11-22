import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().largestPalindromic('444947137')
        self.assertEqual(actual, '7449447')

    def test_example_2(self):
        actual = Solution().largestPalindromic('00009')
        self.assertEqual(actual, '9')


if __name__ == "__main__":
    unittest.main()
