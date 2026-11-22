import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().mostPopularCreator(['alice', 'bob', 'alice', 'chris'], ['one', 'two', 'three', 'four'], [5, 10, 5, 4])
        self.assertCountEqual(actual, [['alice', 'one'], ['bob', 'two']])

    def test_example_2(self):
        actual = Solution().mostPopularCreator(['alice', 'alice', 'alice'], ['a', 'b', 'c'], [1, 2, 2])
        self.assertCountEqual(actual, [['alice', 'b']])


if __name__ == "__main__":
    unittest.main()
