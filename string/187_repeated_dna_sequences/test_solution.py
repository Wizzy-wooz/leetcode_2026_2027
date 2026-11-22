import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findRepeatedDnaSequences('AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT')
        self.assertCountEqual(actual, ['AAAAACCCCC', 'CCCCCAAAAA'])

    def test_example_2(self):
        actual = Solution().findRepeatedDnaSequences('AAAAAAAAAAAAA')
        self.assertCountEqual(actual, ['AAAAAAAAAA'])


if __name__ == "__main__":
    unittest.main()
