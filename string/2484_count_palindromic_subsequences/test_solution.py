import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().countPalindromes('103301')
        self.assertEqual(actual, 2)

    def test_example_2(self):
        actual = Solution().countPalindromes('0000000')
        self.assertEqual(actual, 21)

    def test_example_3(self):
        actual = Solution().countPalindromes('9999900000')
        self.assertEqual(actual, 2)


if __name__ == "__main__":
    unittest.main()
