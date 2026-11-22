import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().reformat('a0b1c2')
        self.assertEqual(actual, '0a1b2c')

    def test_example_2(self):
        actual = Solution().reformat('leetcode')
        self.assertEqual(actual, '')

    def test_example_3(self):
        actual = Solution().reformat('1229857369')
        self.assertEqual(actual, '')


if __name__ == "__main__":
    unittest.main()
