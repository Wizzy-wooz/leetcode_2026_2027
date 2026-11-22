import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().addOperators('123', 6)
        self.assertCountEqual(actual, ['1*2*3', '1+2+3'])

    def test_example_2(self):
        actual = Solution().addOperators('232', 8)
        self.assertCountEqual(actual, ['2*3+2', '2+3*2'])

    def test_example_3(self):
        actual = Solution().addOperators('3456237490', 9191)
        self.assertCountEqual(actual, [])


if __name__ == "__main__":
    unittest.main()
