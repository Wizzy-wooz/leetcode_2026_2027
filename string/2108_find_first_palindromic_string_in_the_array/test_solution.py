import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().firstPalindrome(['abc', 'car', 'ada', 'racecar', 'cool'])
        self.assertEqual(actual, 'ada')

    def test_example_2(self):
        actual = Solution().firstPalindrome(['notapalindrome', 'racecar'])
        self.assertEqual(actual, 'racecar')

    def test_example_3(self):
        actual = Solution().firstPalindrome(['def', 'ghi'])
        self.assertEqual(actual, '')


if __name__ == "__main__":
    unittest.main()
