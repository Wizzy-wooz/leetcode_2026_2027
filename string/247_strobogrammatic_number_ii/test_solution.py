import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findStrobogrammatic(2)
        self.assertCountEqual(actual, ['11', '69', '88', '96'])

    def test_example_2(self):
        actual = Solution().findStrobogrammatic(1)
        self.assertCountEqual(actual, ['0', '1', '8'])


if __name__ == "__main__":
    unittest.main()
