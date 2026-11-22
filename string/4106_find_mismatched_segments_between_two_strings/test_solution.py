import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findMismatchedSegments('earth', 'empty')
        self.assertEqual(actual, [['ar', 'mp'], ['h', 'y']])

    def test_example_2(self):
        actual = Solution().findMismatchedSegments('action', 'nation')
        self.assertEqual(actual, [['ac', 'na']])

    def test_example_3(self):
        actual = Solution().findMismatchedSegments('hot', 'hot')
        self.assertEqual(actual, [])


if __name__ == "__main__":
    unittest.main()
