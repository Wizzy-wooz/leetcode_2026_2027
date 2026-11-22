import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().garbageCollection(['G', 'P', 'GP', 'GG'], [2, 4, 3])
        self.assertEqual(actual, 21)

    def test_example_2(self):
        actual = Solution().garbageCollection(['MMM', 'PGM', 'GP'], [3, 10])
        self.assertEqual(actual, 37)


if __name__ == "__main__":
    unittest.main()
