import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().letterCombinations('23')
        self.assertCountEqual(actual, ['ad', 'ae', 'af', 'bd', 'be', 'bf', 'cd', 'ce', 'cf'])

    def test_example_2(self):
        actual = Solution().letterCombinations('2')
        self.assertCountEqual(actual, ['a', 'b', 'c'])


if __name__ == "__main__":
    unittest.main()
