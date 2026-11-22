import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().rearrangeString('aabc', 'a', 'c')
        self.assertEqual(actual, 'cbaa')

    def test_example_2(self):
        actual = Solution().rearrangeString('dcab', 'd', 'b')
        self.assertEqual(actual, 'cabd')

    def test_example_3(self):
        actual = Solution().rearrangeString('axe', 'o', 'x')
        self.assertEqual(actual, 'axe')


if __name__ == "__main__":
    unittest.main()
