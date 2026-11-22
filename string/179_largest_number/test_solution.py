import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().largestNumber([10, 2])
        self.assertEqual(actual, '210')

    def test_example_2(self):
        actual = Solution().largestNumber([3, 30, 34, 5, 9])
        self.assertEqual(actual, '9534330')


if __name__ == "__main__":
    unittest.main()
