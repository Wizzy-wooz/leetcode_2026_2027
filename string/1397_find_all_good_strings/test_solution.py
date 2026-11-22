import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findGoodStrings(2, 'aa', 'da', 'b')
        self.assertEqual(actual, 51)

    def test_example_2(self):
        actual = Solution().findGoodStrings(8, 'leetcode', 'leetgoes', 'leet')
        self.assertEqual(actual, 0)

    def test_example_3(self):
        actual = Solution().findGoodStrings(2, 'gx', 'gz', 'x')
        self.assertEqual(actual, 2)


if __name__ == "__main__":
    unittest.main()
