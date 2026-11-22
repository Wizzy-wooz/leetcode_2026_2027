import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().largestEven('1112')
        self.assertEqual(actual, '1112')

    def test_example_2(self):
        actual = Solution().largestEven('221')
        self.assertEqual(actual, '22')

    def test_example_3(self):
        actual = Solution().largestEven('1')
        self.assertEqual(actual, '')


if __name__ == "__main__":
    unittest.main()
