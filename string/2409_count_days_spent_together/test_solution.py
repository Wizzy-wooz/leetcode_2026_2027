import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().countDaysTogether('08-15', '08-18', '08-16', '08-19')
        self.assertEqual(actual, 3)

    def test_example_2(self):
        actual = Solution().countDaysTogether('10-01', '10-31', '11-01', '12-31')
        self.assertEqual(actual, 0)


if __name__ == "__main__":
    unittest.main()
