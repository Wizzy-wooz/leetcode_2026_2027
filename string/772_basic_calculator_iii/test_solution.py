import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().calculate('1+1')
        self.assertEqual(actual, 2)

    def test_example_2(self):
        actual = Solution().calculate('6-4/2')
        self.assertEqual(actual, 4)

    def test_example_3(self):
        actual = Solution().calculate('2*(5+5*2)/3+(6/2+8)')
        self.assertEqual(actual, 21)


if __name__ == "__main__":
    unittest.main()
