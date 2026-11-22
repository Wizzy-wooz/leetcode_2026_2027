import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().maximumScore([2, 1, 5, 2, 3], '01010')
        self.assertEqual(actual, 7)

    def test_example_2(self):
        actual = Solution().maximumScore([4, 7, 2, 9], '0000')
        self.assertEqual(actual, 0)


if __name__ == "__main__":
    unittest.main()
