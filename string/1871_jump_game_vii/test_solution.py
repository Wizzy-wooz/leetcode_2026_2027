import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().canReach('011010', 2, 3)
        self.assertEqual(actual, True)

    def test_example_2(self):
        actual = Solution().canReach('01101110', 2, 3)
        self.assertEqual(actual, False)


if __name__ == "__main__":
    unittest.main()
