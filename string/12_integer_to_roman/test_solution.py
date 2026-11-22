import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().intToRoman(3749)
        self.assertEqual(actual, 'MMMDCCXLIX')

    def test_example_2(self):
        actual = Solution().intToRoman(58)
        self.assertEqual(actual, 'LVIII')

    def test_example_3(self):
        actual = Solution().intToRoman(1994)
        self.assertEqual(actual, 'MCMXCIV')


if __name__ == "__main__":
    unittest.main()
