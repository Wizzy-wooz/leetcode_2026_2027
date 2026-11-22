import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().countCells([['a', 'a', 'c', 'c'], ['b', 'b', 'b', 'c'], ['a', 'a', 'b', 'a'], ['c', 'a', 'a', 'c'], ['a', 'a', 'b', 'a']], 'abaca')
        self.assertEqual(actual, 1)

    def test_example_2(self):
        actual = Solution().countCells([['c', 'a', 'a', 'a'], ['a', 'a', 'b', 'a'], ['b', 'b', 'a', 'a'], ['a', 'a', 'b', 'a']], 'aba')
        self.assertEqual(actual, 4)

    def test_example_3(self):
        actual = Solution().countCells([['a']], 'a')
        self.assertEqual(actual, 1)


if __name__ == "__main__":
    unittest.main()
