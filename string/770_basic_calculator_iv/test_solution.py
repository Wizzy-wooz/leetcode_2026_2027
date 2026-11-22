import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().basicCalculatorIV('e + 8 - a + 5', ['e'], [1])
        self.assertEqual(actual, ['-1*a', '14'])

    def test_example_2(self):
        actual = Solution().basicCalculatorIV('e - 8 + temperature - pressure', ['e', 'temperature'], [1, 12])
        self.assertEqual(actual, ['-1*pressure', '5'])

    def test_example_3(self):
        actual = Solution().basicCalculatorIV('(e + 8) * (e - 8)', [], [])
        self.assertEqual(actual, ['1*e*e', '-64'])


if __name__ == "__main__":
    unittest.main()
