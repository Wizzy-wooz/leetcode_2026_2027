import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().maxValue('99', 9)
        self.assertEqual(actual, '999')

    def test_example_2(self):
        actual = Solution().maxValue('-13', 2)
        self.assertEqual(actual, '-123')


if __name__ == "__main__":
    unittest.main()
