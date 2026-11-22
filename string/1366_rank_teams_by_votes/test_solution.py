import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().rankTeams(['ABC', 'ACB', 'ABC', 'ACB', 'ACB'])
        self.assertEqual(actual, 'ACB')

    def test_example_2(self):
        actual = Solution().rankTeams(['WXYZ', 'XYZW'])
        self.assertEqual(actual, 'XWYZ')

    def test_example_3(self):
        actual = Solution().rankTeams(['ZMNAGUEDSJYLBOPHRQICWFXTVK'])
        self.assertEqual(actual, 'ZMNAGUEDSJYLBOPHRQICWFXTVK')


if __name__ == "__main__":
    unittest.main()
