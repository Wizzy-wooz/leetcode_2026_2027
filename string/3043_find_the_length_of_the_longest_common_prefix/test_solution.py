import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().longestCommonPrefix([1, 10, 100], [1000])
        self.assertEqual(actual, 3)

    def test_example_2(self):
        actual = Solution().longestCommonPrefix([1, 2, 3], [4, 4, 4])
        self.assertEqual(actual, 0)


if __name__ == "__main__":
    unittest.main()
