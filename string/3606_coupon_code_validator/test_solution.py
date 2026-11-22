import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().validateCoupons(['SAVE20', '', 'PHARMA5', 'SAVE@20'], ['restaurant', 'grocery', 'pharmacy', 'restaurant'], [True, True, True, True])
        self.assertEqual(actual, ['PHARMA5', 'SAVE20'])

    def test_example_2(self):
        actual = Solution().validateCoupons(['GROCERY15', 'ELECTRONICS_50', 'DISCOUNT10'], ['grocery', 'electronics', 'invalid'], [False, True, True])
        self.assertEqual(actual, ['ELECTRONICS_50'])


if __name__ == "__main__":
    unittest.main()
