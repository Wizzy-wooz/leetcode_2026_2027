import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().smallestTrimmedNumbers(['102', '473', '251', '814'], [[1, 1], [2, 3], [4, 2], [1, 2]])
        self.assertEqual(actual, [2, 2, 1, 0])

    def test_example_2(self):
        actual = Solution().smallestTrimmedNumbers(['24', '37', '96', '04'], [[2, 1], [2, 2]])
        self.assertEqual(actual, [3, 0])


if __name__ == "__main__":
    unittest.main()
