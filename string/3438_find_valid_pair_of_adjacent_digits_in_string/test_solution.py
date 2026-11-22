import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findValidPair('2523533')
        self.assertEqual(actual, '23')

    def test_example_2(self):
        actual = Solution().findValidPair('221')
        self.assertEqual(actual, '21')

    def test_example_3(self):
        actual = Solution().findValidPair('22')
        self.assertEqual(actual, '')


if __name__ == "__main__":
    unittest.main()
