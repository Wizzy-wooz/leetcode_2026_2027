import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().shortestSuperstring(['alex', 'loves', 'leetcode'])
        self.assertEqual(actual, 'alexlovesleetcode')

    def test_example_2(self):
        actual = Solution().shortestSuperstring(['catg', 'ctaagt', 'gcta', 'ttca', 'atgcatc'])
        self.assertEqual(actual, 'gctaagttcatgcatc')


if __name__ == "__main__":
    unittest.main()
