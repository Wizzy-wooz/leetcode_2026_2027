import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().destCity([['London', 'New York'], ['New York', 'Lima'], ['Lima', 'Sao Paulo']])
        self.assertEqual(actual, 'Sao Paulo')

    def test_example_2(self):
        actual = Solution().destCity([['B', 'C'], ['D', 'B'], ['C', 'A']])
        self.assertEqual(actual, 'A')

    def test_example_3(self):
        actual = Solution().destCity([['A', 'Z']])
        self.assertEqual(actual, 'Z')


if __name__ == "__main__":
    unittest.main()
