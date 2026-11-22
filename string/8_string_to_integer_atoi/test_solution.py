import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().myAtoi('42')
        self.assertEqual(actual, 42)

    def test_example_2(self):
        actual = Solution().myAtoi(' -042')
        self.assertEqual(actual, -42)

    def test_example_3(self):
        actual = Solution().myAtoi('1337c0d3')
        self.assertEqual(actual, 1337)

    def test_example_4(self):
        actual = Solution().myAtoi('0-1')
        self.assertEqual(actual, 0)

    def test_example_5(self):
        actual = Solution().myAtoi('words and 987')
        self.assertEqual(actual, 0)


if __name__ == "__main__":
    unittest.main()
