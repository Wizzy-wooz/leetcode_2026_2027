import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().sameEndSubstringCount('abcaab', [[0, 0], [1, 4], [2, 5], [0, 5]])
        self.assertEqual(actual, [1, 5, 5, 10])

    def test_example_2(self):
        actual = Solution().sameEndSubstringCount('abcd', [[0, 3]])
        self.assertEqual(actual, [4])


if __name__ == "__main__":
    unittest.main()
