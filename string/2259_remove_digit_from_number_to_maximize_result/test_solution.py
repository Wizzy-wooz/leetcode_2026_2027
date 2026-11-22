import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().removeDigit('123', '3')
        self.assertEqual(actual, '12')

    def test_example_2(self):
        actual = Solution().removeDigit('1231', '1')
        self.assertEqual(actual, '231')

    def test_example_3(self):
        actual = Solution().removeDigit('551', '5')
        self.assertEqual(actual, '51')


if __name__ == "__main__":
    unittest.main()
