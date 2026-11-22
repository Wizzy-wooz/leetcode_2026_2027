import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().minCost(3, 'RBR', [[0, 1], [1, 2]])
        self.assertEqual(actual, 1)

    def test_example_2(self):
        actual = Solution().minCost(3, 'RBR', [[0, 1], [0, 2]])
        self.assertEqual(actual, 0)

    def test_example_3(self):
        actual = Solution().minCost(4, 'BRRR', [[0, 1], [0, 2], [0, 3]])
        self.assertEqual(actual, 2)

    def test_example_4(self):
        actual = Solution().minCost(3, 'BBB', [[0, 1], [1, 2]])
        self.assertEqual(actual, 0)


if __name__ == "__main__":
    unittest.main()
