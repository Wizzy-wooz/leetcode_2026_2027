import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().countKConstraintSubstrings('10101', 1)
        self.assertEqual(actual, 12)

    def test_example_2(self):
        actual = Solution().countKConstraintSubstrings('1010101', 2)
        self.assertEqual(actual, 25)

    def test_example_3(self):
        actual = Solution().countKConstraintSubstrings('11111', 1)
        self.assertEqual(actual, 15)


if __name__ == "__main__":
    unittest.main()
