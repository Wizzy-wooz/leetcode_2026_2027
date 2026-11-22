import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().removeOccurrences('daabcbaabcbc', 'abc')
        self.assertEqual(actual, 'dab')

    def test_example_2(self):
        actual = Solution().removeOccurrences('axxxxyyyyb', 'xy')
        self.assertEqual(actual, 'ab')


if __name__ == "__main__":
    unittest.main()
