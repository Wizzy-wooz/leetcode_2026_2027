import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().convert('PAYPALISHIRING', 3)
        self.assertEqual(actual, 'PAHNAPLSIIGYIR')

    def test_example_2(self):
        actual = Solution().convert('PAYPALISHIRING', 4)
        self.assertEqual(actual, 'PINALSIGYAHRPI')

    def test_example_3(self):
        actual = Solution().convert('A', 1)
        self.assertEqual(actual, 'A')


if __name__ == "__main__":
    unittest.main()
