import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().processStr('a#b%*', 1)
        self.assertEqual(actual, 'a')

    def test_example_2(self):
        actual = Solution().processStr('cd%#*#', 3)
        self.assertEqual(actual, 'd')

    def test_example_3(self):
        actual = Solution().processStr('z*#', 0)
        self.assertEqual(actual, '.')


if __name__ == "__main__":
    unittest.main()
