import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().romanToInt('III')
        self.assertEqual(actual, 3)

    def test_example_2(self):
        actual = Solution().romanToInt('LVIII')
        self.assertEqual(actual, 58)

    def test_example_3(self):
        actual = Solution().romanToInt('MCMXCIV')
        self.assertEqual(actual, 1994)


if __name__ == "__main__":
    unittest.main()
