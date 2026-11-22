import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().smallestSubsequence('leet', 3, 'e', 1)
        self.assertEqual(actual, 'eet')

    def test_example_2(self):
        actual = Solution().smallestSubsequence('leetcode', 4, 'e', 2)
        self.assertEqual(actual, 'ecde')

    def test_example_3(self):
        actual = Solution().smallestSubsequence('bb', 2, 'b', 2)
        self.assertEqual(actual, 'bb')


if __name__ == "__main__":
    unittest.main()
