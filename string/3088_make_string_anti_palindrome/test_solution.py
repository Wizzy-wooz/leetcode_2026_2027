import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().makeAntiPalindrome('abca')
        self.assertEqual(actual, 'aabc')

    def test_example_2(self):
        actual = Solution().makeAntiPalindrome('abba')
        self.assertEqual(actual, 'aabb')

    def test_example_3(self):
        actual = Solution().makeAntiPalindrome('cccd')
        self.assertEqual(actual, '-1')


if __name__ == "__main__":
    unittest.main()
