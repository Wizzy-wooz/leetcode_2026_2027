import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().stringShift('abc', [[0, 1], [1, 2]])
        self.assertEqual(actual, 'cab')

    def test_example_2(self):
        actual = Solution().stringShift('abcdefg', [[1, 1], [1, 1], [0, 2], [1, 3]])
        self.assertEqual(actual, 'efgabcd')


if __name__ == "__main__":
    unittest.main()
