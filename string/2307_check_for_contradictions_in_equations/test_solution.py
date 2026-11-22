import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().checkContradictions([['a', 'b'], ['b', 'c'], ['a', 'c']], [3, 0.5, 1.5])
        self.assertEqual(actual, False)

    def test_example_2(self):
        actual = Solution().checkContradictions([['le', 'et'], ['le', 'code'], ['code', 'et']], [2, 5, 0.5])
        self.assertEqual(actual, True)


if __name__ == "__main__":
    unittest.main()
