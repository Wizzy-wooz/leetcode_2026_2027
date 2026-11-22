import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().lexGreaterPermutation('abc', 'bba')
        self.assertEqual(actual, 'bca')

    def test_example_2(self):
        actual = Solution().lexGreaterPermutation('leet', 'code')
        self.assertEqual(actual, 'eelt')

    def test_example_3(self):
        actual = Solution().lexGreaterPermutation('baba', 'bbaa')
        self.assertEqual(actual, '')


if __name__ == "__main__":
    unittest.main()
