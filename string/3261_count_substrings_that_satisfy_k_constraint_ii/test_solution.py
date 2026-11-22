import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().countKConstraintSubstrings('0001111', 2, [[0, 6]])
        self.assertEqual(actual, [26])

    def test_example_2(self):
        actual = Solution().countKConstraintSubstrings('010101', 1, [[0, 5], [1, 4], [2, 3]])
        self.assertEqual(actual, [15, 9, 3])


if __name__ == "__main__":
    unittest.main()
