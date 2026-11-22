import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().getHint('1807', '7810')
        self.assertEqual(actual, '1A3B')

    def test_example_2(self):
        actual = Solution().getHint('1123', '0111')
        self.assertEqual(actual, '1A1B')


if __name__ == "__main__":
    unittest.main()
