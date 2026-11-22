import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().ambiguousCoordinates('(123)')
        self.assertCountEqual(actual, ['(1, 2.3)', '(1, 23)', '(1.2, 3)', '(12, 3)'])

    def test_example_2(self):
        actual = Solution().ambiguousCoordinates('(0123)')
        self.assertCountEqual(actual, ['(0, 1.23)', '(0, 12.3)', '(0, 123)', '(0.1, 2.3)', '(0.1, 23)', '(0.12, 3)'])

    def test_example_3(self):
        actual = Solution().ambiguousCoordinates('(00011)')
        self.assertCountEqual(actual, ['(0, 0.011)', '(0.001, 1)'])


if __name__ == "__main__":
    unittest.main()
