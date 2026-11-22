import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().cellsInRange('K1:L2')
        self.assertEqual(actual, ['K1', 'K2', 'L1', 'L2'])

    def test_example_2(self):
        actual = Solution().cellsInRange('A1:F1')
        self.assertEqual(actual, ['A1', 'B1', 'C1', 'D1', 'E1', 'F1'])


if __name__ == "__main__":
    unittest.main()
