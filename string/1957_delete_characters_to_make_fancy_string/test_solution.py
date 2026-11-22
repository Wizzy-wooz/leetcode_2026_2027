import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().makeFancyString('leeetcode')
        self.assertEqual(actual, 'leetcode')

    def test_example_2(self):
        actual = Solution().makeFancyString('aaabaaaa')
        self.assertEqual(actual, 'aabaa')

    def test_example_3(self):
        actual = Solution().makeFancyString('aab')
        self.assertEqual(actual, 'aab')


if __name__ == "__main__":
    unittest.main()
