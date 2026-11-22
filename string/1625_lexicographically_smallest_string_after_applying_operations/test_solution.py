import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findLexSmallestString('5525', 9, 2)
        self.assertEqual(actual, '2050')

    def test_example_2(self):
        actual = Solution().findLexSmallestString('74', 5, 1)
        self.assertEqual(actual, '24')

    def test_example_3(self):
        actual = Solution().findLexSmallestString('0011', 4, 2)
        self.assertEqual(actual, '0011')


if __name__ == "__main__":
    unittest.main()
