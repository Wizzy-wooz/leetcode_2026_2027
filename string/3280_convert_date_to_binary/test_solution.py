import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().convertDateToBinary('2080-02-29')
        self.assertEqual(actual, '100000100000-10-11101')

    def test_example_2(self):
        actual = Solution().convertDateToBinary('1900-01-01')
        self.assertEqual(actual, '11101101100-1-1')


if __name__ == "__main__":
    unittest.main()
