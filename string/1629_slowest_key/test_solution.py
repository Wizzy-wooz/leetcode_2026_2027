import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().slowestKey([9, 29, 49, 50], 'cbcd')
        self.assertEqual(actual, 'c')

    def test_example_2(self):
        actual = Solution().slowestKey([12, 23, 36, 46, 62], 'spuda')
        self.assertEqual(actual, 'a')


if __name__ == "__main__":
    unittest.main()
