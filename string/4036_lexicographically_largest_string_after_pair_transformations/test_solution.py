import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().largestString([2, 5, 7])
        self.assertEqual(actual, ['b', 'ca', 'cba'])

    def test_example_2(self):
        actual = Solution().largestString([3, 9, 1])
        self.assertEqual(actual, ['ba', 'da', 'a'])


if __name__ == "__main__":
    unittest.main()
