import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findReplaceString('abcd', [0, 2], ['a', 'cd'], ['eee', 'ffff'])
        self.assertEqual(actual, 'eeebffff')

    def test_example_2(self):
        actual = Solution().findReplaceString('abcd', [0, 2], ['ab', 'ec'], ['eee', 'ffff'])
        self.assertEqual(actual, 'eeecd')


if __name__ == "__main__":
    unittest.main()
