import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().maxAmount('EUR', [['EUR', 'USD'], ['USD', 'JPY']], [2.0, 3.0], [['JPY', 'USD'], ['USD', 'CHF'], ['CHF', 'EUR']], [4.0, 5.0, 6.0])
        self.assertEqual(actual, 720.0)

    def test_example_2(self):
        actual = Solution().maxAmount('NGN', [['NGN', 'EUR']], [9.0], [['NGN', 'EUR']], [6.0])
        self.assertEqual(actual, 1.5)

    def test_example_3(self):
        actual = Solution().maxAmount('USD', [['USD', 'EUR']], [1.0], [['EUR', 'JPY']], [10.0])
        self.assertEqual(actual, 1.0)


if __name__ == "__main__":
    unittest.main()
