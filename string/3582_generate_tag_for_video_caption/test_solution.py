import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().generateTag('Leetcode daily streak achieved')
        self.assertEqual(actual, '#leetcodeDailyStreakAchieved')

    def test_example_2(self):
        actual = Solution().generateTag('can I Go There')
        self.assertEqual(actual, '#canIGoThere')

    def test_example_3(self):
        actual = Solution().generateTag('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh')
        self.assertEqual(actual, '#hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh')


if __name__ == "__main__":
    unittest.main()
