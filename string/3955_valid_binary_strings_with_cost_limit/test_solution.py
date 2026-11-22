import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().generateValidStrings(3, 1)
        self.assertCountEqual(actual, ['000', '010', '100'])

    def test_example_2(self):
        actual = Solution().generateValidStrings(1, 0)
        self.assertCountEqual(actual, ['0', '1'])


if __name__ == "__main__":
    unittest.main()
