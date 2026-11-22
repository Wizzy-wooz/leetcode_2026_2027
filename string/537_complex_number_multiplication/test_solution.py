import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().complexNumberMultiply('1+1i', '1+1i')
        self.assertEqual(actual, '0+2i')

    def test_example_2(self):
        actual = Solution().complexNumberMultiply('1+-1i', '1+-1i')
        self.assertEqual(actual, '0+-2i')


if __name__ == "__main__":
    unittest.main()
