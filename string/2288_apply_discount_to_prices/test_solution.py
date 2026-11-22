import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().discountPrices('there are $1 $2 and 5$ candies in the shop', 50)
        self.assertEqual(actual, 'there are $0.50 $1.00 and 5$ candies in the shop')

    def test_example_2(self):
        actual = Solution().discountPrices('1 2 $3 4 $5 $6 7 8$ $9 $10$', 100)
        self.assertEqual(actual, '1 2 $0.00 4 $0.00 $0.00 7 8$ $0.00 $10$')


if __name__ == "__main__":
    unittest.main()
