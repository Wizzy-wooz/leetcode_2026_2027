import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().greatestLetter('lEeTcOdE')
        self.assertEqual(actual, 'E')

    def test_example_2(self):
        actual = Solution().greatestLetter('arRAzFif')
        self.assertEqual(actual, 'R')

    def test_example_3(self):
        actual = Solution().greatestLetter('AbCdEfGhIjK')
        self.assertEqual(actual, '')


if __name__ == "__main__":
    unittest.main()
