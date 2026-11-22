import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().canMakePaliQueries('abcda', [[3, 3, 0], [1, 2, 0], [0, 3, 1], [0, 3, 2], [0, 4, 1]])
        self.assertEqual(actual, [True, False, False, True, True])

    def test_example_2(self):
        actual = Solution().canMakePaliQueries('lyb', [[0, 1, 0], [2, 2, 1]])
        self.assertEqual(actual, [False, True])


if __name__ == "__main__":
    unittest.main()
