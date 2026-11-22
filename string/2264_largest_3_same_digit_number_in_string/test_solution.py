import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().largestGoodInteger('6777133339')
        self.assertEqual(actual, '777')

    def test_example_2(self):
        actual = Solution().largestGoodInteger('2300019')
        self.assertEqual(actual, '000')

    def test_example_3(self):
        actual = Solution().largestGoodInteger('42352338')
        self.assertEqual(actual, '')


if __name__ == "__main__":
    unittest.main()
