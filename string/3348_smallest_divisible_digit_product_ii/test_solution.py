import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().smallestNumber('1234', 256)
        self.assertEqual(actual, '1488')

    def test_example_2(self):
        actual = Solution().smallestNumber('12355', 50)
        self.assertEqual(actual, '12355')

    def test_example_3(self):
        actual = Solution().smallestNumber('11111', 26)
        self.assertEqual(actual, '-1')


if __name__ == "__main__":
    unittest.main()
