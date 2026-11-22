import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().minCost('aabaac', [1, 2, 3, 4, 1, 10])
        self.assertEqual(actual, 11)

    def test_example_2(self):
        actual = Solution().minCost('abc', [10, 5, 8])
        self.assertEqual(actual, 13)

    def test_example_3(self):
        actual = Solution().minCost('zzzzz', [67, 67, 67, 67, 67])
        self.assertEqual(actual, 0)


if __name__ == "__main__":
    unittest.main()
