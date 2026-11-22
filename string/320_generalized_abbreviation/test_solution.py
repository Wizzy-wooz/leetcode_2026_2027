import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().generateAbbreviations('word')
        self.assertCountEqual(actual, ['4', '3d', '2r1', '2rd', '1o2', '1o1d', '1or1', '1ord', 'w3', 'w2d', 'w1r1', 'w1rd', 'wo2', 'wo1d', 'wor1', 'word'])

    def test_example_2(self):
        actual = Solution().generateAbbreviations('a')
        self.assertCountEqual(actual, ['1', 'a'])


if __name__ == "__main__":
    unittest.main()
