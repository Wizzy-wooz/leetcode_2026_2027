import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().repeatedStringMatch('ab', 'abab', 2, 1)
        self.assertEqual(actual, True)

    def test_example_2(self):
        actual = Solution().repeatedStringMatch('abc', 'bc', 2, 3)
        self.assertEqual(actual, False)

    def test_example_3(self):
        actual = Solution().repeatedStringMatch('abcd', 'cdab', 2, 1)
        self.assertEqual(actual, True)


if __name__ == "__main__":
    unittest.main()
