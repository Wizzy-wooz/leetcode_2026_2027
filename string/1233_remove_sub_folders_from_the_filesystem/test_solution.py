import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().removeSubfolders(['/a', '/a/b', '/c/d', '/c/d/e', '/c/f'])
        self.assertCountEqual(actual, ['/a', '/c/d', '/c/f'])

    def test_example_2(self):
        actual = Solution().removeSubfolders(['/a', '/a/b/c', '/a/b/d'])
        self.assertCountEqual(actual, ['/a'])

    def test_example_3(self):
        actual = Solution().removeSubfolders(['/a/b/c', '/a/b/ca', '/a/b/d'])
        self.assertCountEqual(actual, ['/a/b/c', '/a/b/ca', '/a/b/d'])


if __name__ == "__main__":
    unittest.main()
