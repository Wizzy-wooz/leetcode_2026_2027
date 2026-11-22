import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().smallestStringWithSwaps('dcab', [[0, 3], [1, 2]])
        self.assertEqual(actual, 'bacd')

    def test_example_2(self):
        actual = Solution().smallestStringWithSwaps('dcab', [[0, 3], [1, 2], [0, 2]])
        self.assertEqual(actual, 'abcd')

    def test_example_3(self):
        actual = Solution().smallestStringWithSwaps('cba', [[0, 1], [1, 2]])
        self.assertEqual(actual, 'abc')


if __name__ == "__main__":
    unittest.main()
