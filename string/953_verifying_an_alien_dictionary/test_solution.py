import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().isAlienSorted(['hello', 'leetcode'], 'hlabcdefgijkmnopqrstuvwxyz')
        self.assertEqual(actual, True)

    def test_example_2(self):
        actual = Solution().isAlienSorted(['word', 'world', 'row'], 'worldabcefghijkmnpqstuvxyz')
        self.assertEqual(actual, False)

    def test_example_3(self):
        actual = Solution().isAlienSorted(['apple', 'app'], 'abcdefghijklmnopqrstuvwxyz')
        self.assertEqual(actual, False)


if __name__ == "__main__":
    unittest.main()
