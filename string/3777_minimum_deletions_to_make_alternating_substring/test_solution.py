import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().minDeletions('ABA', [[2, 1, 2], [1, 1], [2, 0, 2]])
        self.assertEqual(actual, [0, 2])

    def test_example_2(self):
        actual = Solution().minDeletions('ABB', [[2, 0, 2], [1, 2], [2, 0, 2]])
        self.assertEqual(actual, [1, 0])

    def test_example_3(self):
        actual = Solution().minDeletions('BABA', [[2, 0, 3], [1, 1], [2, 1, 3]])
        self.assertEqual(actual, [0, 1])


if __name__ == "__main__":
    unittest.main()
