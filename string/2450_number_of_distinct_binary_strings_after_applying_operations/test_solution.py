import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().countDistinctStrings('1001', 3)
        self.assertEqual(actual, 4)

    def test_example_2(self):
        actual = Solution().countDistinctStrings('10110', 5)
        self.assertEqual(actual, 2)


if __name__ == "__main__":
    unittest.main()
