import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().largestPalindrome(3, 5)
        self.assertEqual(actual, '595')

    def test_example_2(self):
        actual = Solution().largestPalindrome(1, 4)
        self.assertEqual(actual, '8')

    def test_example_3(self):
        actual = Solution().largestPalindrome(5, 6)
        self.assertEqual(actual, '89898')


if __name__ == "__main__":
    unittest.main()
