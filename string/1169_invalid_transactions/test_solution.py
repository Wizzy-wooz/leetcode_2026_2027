import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().invalidTransactions(['alice,20,800,mtv', 'alice,50,100,beijing'])
        self.assertEqual(actual, ['alice,20,800,mtv', 'alice,50,100,beijing'])

    def test_example_2(self):
        actual = Solution().invalidTransactions(['alice,20,800,mtv', 'alice,50,1200,mtv'])
        self.assertEqual(actual, ['alice,50,1200,mtv'])

    def test_example_3(self):
        actual = Solution().invalidTransactions(['alice,20,800,mtv', 'bob,50,1200,mtv'])
        self.assertEqual(actual, ['bob,50,1200,mtv'])


if __name__ == "__main__":
    unittest.main()
