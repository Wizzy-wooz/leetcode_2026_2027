import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().removeKdigits('1432219', 3)
        self.assertEqual(actual, '1219')

    def test_example_2(self):
        actual = Solution().removeKdigits('10200', 1)
        self.assertEqual(actual, '200')

    def test_example_3(self):
        actual = Solution().removeKdigits('10', 2)
        self.assertEqual(actual, '0')


if __name__ == "__main__":
    unittest.main()
