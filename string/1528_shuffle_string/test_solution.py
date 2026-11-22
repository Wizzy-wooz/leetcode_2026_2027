import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().restoreString('codeleet', [4, 5, 6, 7, 0, 2, 1, 3])
        self.assertEqual(actual, 'leetcode')

    def test_example_2(self):
        actual = Solution().restoreString('abc', [0, 1, 2])
        self.assertEqual(actual, 'abc')


if __name__ == "__main__":
    unittest.main()
