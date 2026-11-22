import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findContestMatch(4)
        self.assertEqual(actual, '((1,4),(2,3))')

    def test_example_2(self):
        actual = Solution().findContestMatch(8)
        self.assertEqual(actual, '(((1,8),(4,5)),((2,7),(3,6)))')


if __name__ == "__main__":
    unittest.main()
