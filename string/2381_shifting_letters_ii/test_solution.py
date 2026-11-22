import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().shiftingLetters('abc', [[0, 1, 0], [1, 2, 1], [0, 2, 1]])
        self.assertEqual(actual, 'ace')

    def test_example_2(self):
        actual = Solution().shiftingLetters('dztz', [[0, 0, 0], [1, 1, 1]])
        self.assertEqual(actual, 'catz')


if __name__ == "__main__":
    unittest.main()
