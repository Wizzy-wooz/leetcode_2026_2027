import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().deleteDuplicateFolder([['a'], ['c'], ['d'], ['a', 'b'], ['c', 'b'], ['d', 'a']])
        self.assertEqual(actual, [['d'], ['d', 'a']])

    def test_example_2(self):
        actual = Solution().deleteDuplicateFolder([['a'], ['c'], ['a', 'b'], ['c', 'b'], ['a', 'b', 'x'], ['a', 'b', 'x', 'y'], ['w'], ['w', 'y']])
        self.assertEqual(actual, [['c'], ['c', 'b'], ['a'], ['a', 'b']])

    def test_example_3(self):
        actual = Solution().deleteDuplicateFolder([['a', 'b'], ['c', 'd'], ['c'], ['a']])
        self.assertEqual(actual, [['c'], ['c', 'd'], ['a'], ['a', 'b']])


if __name__ == "__main__":
    unittest.main()
