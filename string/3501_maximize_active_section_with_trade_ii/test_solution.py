import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().maxActiveSectionsAfterTrade('01', [[0, 1]])
        self.assertEqual(actual, [1])

    def test_example_2(self):
        actual = Solution().maxActiveSectionsAfterTrade('0100', [[0, 3], [0, 2], [1, 3], [2, 3]])
        self.assertEqual(actual, [4, 3, 1, 1])

    def test_example_3(self):
        actual = Solution().maxActiveSectionsAfterTrade('1000100', [[1, 5], [0, 6], [0, 4]])
        self.assertEqual(actual, [6, 7, 2])

    def test_example_4(self):
        actual = Solution().maxActiveSectionsAfterTrade('01010', [[0, 3], [1, 4], [1, 3]])
        self.assertEqual(actual, [4, 4, 2])


if __name__ == "__main__":
    unittest.main()
