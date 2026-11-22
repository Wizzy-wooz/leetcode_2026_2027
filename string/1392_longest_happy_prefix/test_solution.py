import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().longestPrefix('level')
        self.assertEqual(actual, 'l')

    def test_example_2(self):
        actual = Solution().longestPrefix('ababab')
        self.assertEqual(actual, 'abab')


if __name__ == "__main__":
    unittest.main()
