import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().subStrHash('leetcode', 7, 20, 2, 0)
        self.assertEqual(actual, 'ee')

    def test_example_2(self):
        actual = Solution().subStrHash('fbxzaad', 31, 100, 3, 32)
        self.assertEqual(actual, 'fbx')


if __name__ == "__main__":
    unittest.main()
