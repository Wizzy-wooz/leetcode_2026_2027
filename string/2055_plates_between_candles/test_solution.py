import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().platesBetweenCandles('**|**|***|', [[2, 5], [5, 9]])
        self.assertEqual(actual, [2, 3])

    def test_example_2(self):
        actual = Solution().platesBetweenCandles('***|**|*****|**||**|*', [[1, 17], [4, 5], [14, 17], [5, 11], [15, 16]])
        self.assertEqual(actual, [9, 0, 0, 0, 0])


if __name__ == "__main__":
    unittest.main()
