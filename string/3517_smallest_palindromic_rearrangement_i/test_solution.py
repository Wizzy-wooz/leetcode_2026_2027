import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().smallestPalindrome('z')
        self.assertEqual(actual, 'z')

    def test_example_2(self):
        actual = Solution().smallestPalindrome('babab')
        self.assertEqual(actual, 'abbba')

    def test_example_3(self):
        actual = Solution().smallestPalindrome('daccad')
        self.assertEqual(actual, 'acddca')


if __name__ == "__main__":
    unittest.main()
