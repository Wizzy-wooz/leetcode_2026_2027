import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().uncommonFromSentences('this apple is sweet', 'this apple is sour')
        self.assertCountEqual(actual, ['sweet', 'sour'])

    def test_example_2(self):
        actual = Solution().uncommonFromSentences('apple apple', 'banana')
        self.assertCountEqual(actual, ['banana'])


if __name__ == "__main__":
    unittest.main()
