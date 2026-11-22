import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().digitSum('11111222223', 3)
        self.assertEqual(actual, '135')

    def test_example_2(self):
        actual = Solution().digitSum('00000000', 3)
        self.assertEqual(actual, '000')


if __name__ == "__main__":
    unittest.main()
