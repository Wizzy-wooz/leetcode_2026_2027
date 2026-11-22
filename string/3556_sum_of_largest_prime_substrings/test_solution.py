import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().sumOfLargestPrimes('12234')
        self.assertEqual(actual, 1469)

    def test_example_2(self):
        actual = Solution().sumOfLargestPrimes('111')
        self.assertEqual(actual, 11)


if __name__ == "__main__":
    unittest.main()
