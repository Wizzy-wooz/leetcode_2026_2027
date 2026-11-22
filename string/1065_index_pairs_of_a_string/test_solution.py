import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().indexPairs('thestoryofleetcodeandme', ['story', 'fleet', 'leetcode'])
        self.assertEqual(actual, [[3, 7], [9, 13], [10, 17]])

    def test_example_2(self):
        actual = Solution().indexPairs('ababa', ['aba', 'ab'])
        self.assertEqual(actual, [[0, 1], [0, 2], [2, 3], [2, 4]])


if __name__ == "__main__":
    unittest.main()
