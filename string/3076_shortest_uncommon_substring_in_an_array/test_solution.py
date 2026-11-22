import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().shortestSubstrings(['cab', 'ad', 'bad', 'c'])
        self.assertEqual(actual, ['ab', '', 'ba', ''])

    def test_example_2(self):
        actual = Solution().shortestSubstrings(['abc', 'bcd', 'abcd'])
        self.assertEqual(actual, ['', '', 'abcd'])


if __name__ == "__main__":
    unittest.main()
