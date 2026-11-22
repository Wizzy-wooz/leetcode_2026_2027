import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().pushDominoes('RR.L')
        self.assertEqual(actual, 'RR.L')

    def test_example_2(self):
        actual = Solution().pushDominoes('.L.R...LR..L..')
        self.assertEqual(actual, 'LL.RR.LLRRLL..')


if __name__ == "__main__":
    unittest.main()
