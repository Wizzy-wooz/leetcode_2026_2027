import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().possibleStringCount('aabbccdd', 7)
        self.assertEqual(actual, 5)

    def test_example_2(self):
        actual = Solution().possibleStringCount('aabbccdd', 8)
        self.assertEqual(actual, 1)

    def test_example_3(self):
        actual = Solution().possibleStringCount('aaabbb', 3)
        self.assertEqual(actual, 8)


if __name__ == "__main__":
    unittest.main()
