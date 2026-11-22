import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().kthLuckyNumber(4)
        self.assertEqual(actual, '47')

    def test_example_2(self):
        actual = Solution().kthLuckyNumber(10)
        self.assertEqual(actual, '477')

    def test_example_3(self):
        actual = Solution().kthLuckyNumber(1000)
        self.assertEqual(actual, '777747447')


if __name__ == "__main__":
    unittest.main()
