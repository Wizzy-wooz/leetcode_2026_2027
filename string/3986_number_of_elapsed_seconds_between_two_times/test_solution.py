import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().secondsBetweenTimes('01:00:00', '01:00:25')
        self.assertEqual(actual, 25)

    def test_example_2(self):
        actual = Solution().secondsBetweenTimes('12:34:56', '13:00:00')
        self.assertEqual(actual, 1504)


if __name__ == "__main__":
    unittest.main()
