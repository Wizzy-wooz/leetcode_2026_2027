import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().peopleIndexes([['leetcode', 'google', 'facebook'], ['google', 'microsoft'], ['google', 'facebook'], ['google'], ['amazon']])
        self.assertEqual(actual, [0, 1, 4])

    def test_example_2(self):
        actual = Solution().peopleIndexes([['leetcode', 'google', 'facebook'], ['leetcode', 'amazon'], ['facebook', 'google']])
        self.assertEqual(actual, [0, 1])

    def test_example_3(self):
        actual = Solution().peopleIndexes([['leetcode'], ['google'], ['facebook'], ['amazon']])
        self.assertEqual(actual, [0, 1, 2, 3])


if __name__ == "__main__":
    unittest.main()
