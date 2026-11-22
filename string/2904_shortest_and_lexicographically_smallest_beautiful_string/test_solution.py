import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().shortestBeautifulSubstring('100011001', 3)
        self.assertEqual(actual, '11001')

    def test_example_2(self):
        actual = Solution().shortestBeautifulSubstring('1011', 2)
        self.assertEqual(actual, '11')

    def test_example_3(self):
        actual = Solution().shortestBeautifulSubstring('000', 1)
        self.assertEqual(actual, '')


if __name__ == "__main__":
    unittest.main()
