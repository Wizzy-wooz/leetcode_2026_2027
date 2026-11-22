import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().minimizeError(['0.700', '2.800', '4.900'], 8)
        self.assertEqual(actual, '1.000')

    def test_example_2(self):
        actual = Solution().minimizeError(['1.500', '2.500', '3.500'], 10)
        self.assertEqual(actual, '-1')

    def test_example_3(self):
        actual = Solution().minimizeError(['1.500', '2.500', '3.500'], 9)
        self.assertEqual(actual, '1.500')


if __name__ == "__main__":
    unittest.main()
