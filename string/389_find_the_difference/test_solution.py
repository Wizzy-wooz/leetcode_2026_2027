import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findTheDifference('abcd', 'abcde')
        self.assertEqual(actual, 'e')

    def test_example_2(self):
        actual = Solution().findTheDifference('', 'y')
        self.assertEqual(actual, 'y')


if __name__ == "__main__":
    unittest.main()
