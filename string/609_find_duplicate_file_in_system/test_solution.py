import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findDuplicate(['root/a 1.txt(abcd) 2.txt(efgh)', 'root/c 3.txt(abcd)', 'root/c/d 4.txt(efgh)', 'root 4.txt(efgh)'])
        self.assertCountEqual(actual, [['root/a/2.txt', 'root/c/d/4.txt', 'root/4.txt'], ['root/a/1.txt', 'root/c/3.txt']])

    def test_example_2(self):
        actual = Solution().findDuplicate(['root/a 1.txt(abcd) 2.txt(efgh)', 'root/c 3.txt(abcd)', 'root/c/d 4.txt(efgh)'])
        self.assertCountEqual(actual, [['root/a/2.txt', 'root/c/d/4.txt'], ['root/a/1.txt', 'root/c/3.txt']])


if __name__ == "__main__":
    unittest.main()
