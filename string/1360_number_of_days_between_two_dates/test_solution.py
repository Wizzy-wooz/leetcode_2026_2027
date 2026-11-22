import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().daysBetweenDates('2019-06-29', '2019-06-30')
        self.assertEqual(actual, 1)

    def test_example_2(self):
        actual = Solution().daysBetweenDates('2020-01-15', '2019-12-31')
        self.assertEqual(actual, 15)


if __name__ == "__main__":
    unittest.main()
