import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().removeTrailingZeros('51230100')
        self.assertEqual(actual, '512301')

    def test_example_2(self):
        actual = Solution().removeTrailingZeros('123')
        self.assertEqual(actual, '123')


if __name__ == "__main__":
    unittest.main()
