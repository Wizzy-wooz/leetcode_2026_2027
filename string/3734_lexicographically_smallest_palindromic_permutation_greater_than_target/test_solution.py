import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().lexPalindromicPermutation('baba', 'abba')
        self.assertEqual(actual, 'baab')

    def test_example_2(self):
        actual = Solution().lexPalindromicPermutation('baba', 'bbaa')
        self.assertEqual(actual, '')

    def test_example_3(self):
        actual = Solution().lexPalindromicPermutation('abc', 'abb')
        self.assertEqual(actual, '')

    def test_example_4(self):
        actual = Solution().lexPalindromicPermutation('aac', 'abb')
        self.assertEqual(actual, 'aca')


if __name__ == "__main__":
    unittest.main()
