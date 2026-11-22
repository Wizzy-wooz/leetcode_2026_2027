import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().numberToWords(123)
        self.assertEqual(actual, 'One Hundred Twenty Three')

    def test_example_2(self):
        actual = Solution().numberToWords(12345)
        self.assertEqual(actual, 'Twelve Thousand Three Hundred Forty Five')

    def test_example_3(self):
        actual = Solution().numberToWords(1234567)
        self.assertEqual(actual, 'One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven')


if __name__ == "__main__":
    unittest.main()
