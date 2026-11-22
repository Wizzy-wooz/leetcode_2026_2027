import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().maximumNumber('132', [9, 8, 5, 0, 3, 6, 4, 2, 6, 8])
        self.assertEqual(actual, '832')

    def test_example_2(self):
        actual = Solution().maximumNumber('021', [9, 4, 3, 5, 7, 2, 1, 9, 0, 6])
        self.assertEqual(actual, '934')

    def test_example_3(self):
        actual = Solution().maximumNumber('5', [1, 4, 7, 5, 3, 2, 5, 6, 9, 4])
        self.assertEqual(actual, '5')


if __name__ == "__main__":
    unittest.main()
