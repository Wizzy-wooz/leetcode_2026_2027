import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().wordSquares(['area', 'lead', 'wall', 'lady', 'ball'])
        self.assertEqual(actual, [['ball', 'area', 'lead', 'lady'], ['wall', 'area', 'lead', 'lady']])

    def test_example_2(self):
        actual = Solution().wordSquares(['abat', 'baba', 'atan', 'atal'])
        self.assertEqual(actual, [['baba', 'abat', 'baba', 'atal'], ['baba', 'abat', 'baba', 'atan']])


if __name__ == "__main__":
    unittest.main()
