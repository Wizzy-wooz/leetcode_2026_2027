import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().reformatDate('20th Oct 2052')
        self.assertEqual(actual, '2052-10-20')

    def test_example_2(self):
        actual = Solution().reformatDate('6th Jun 1933')
        self.assertEqual(actual, '1933-06-06')

    def test_example_3(self):
        actual = Solution().reformatDate('26th May 1960')
        self.assertEqual(actual, '1960-05-26')


if __name__ == "__main__":
    unittest.main()
