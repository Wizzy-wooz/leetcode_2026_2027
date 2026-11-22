import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findSubtreeSizes([-1, 0, 0, 1, 1, 1], 'abaabc')
        self.assertEqual(actual, [6, 3, 1, 1, 1, 1])

    def test_example_2(self):
        actual = Solution().findSubtreeSizes([-1, 0, 4, 0, 1], 'abbba')
        self.assertEqual(actual, [5, 2, 1, 1, 1])


if __name__ == "__main__":
    unittest.main()
