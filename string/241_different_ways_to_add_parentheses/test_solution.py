import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().diffWaysToCompute('2-1-1')
        self.assertCountEqual(actual, [0, 2])

    def test_example_2(self):
        actual = Solution().diffWaysToCompute('2*3-4*5')
        self.assertCountEqual(actual, [-34, -14, -10, -10, 10])


if __name__ == "__main__":
    unittest.main()
