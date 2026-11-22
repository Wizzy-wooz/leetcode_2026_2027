import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().areNumbersAscending('1 box has 3 blue 4 red 6 green and 12 yellow marbles')
        self.assertEqual(actual, True)

    def test_example_2(self):
        actual = Solution().areNumbersAscending('hello world 5 x 5')
        self.assertEqual(actual, False)

    def test_example_3(self):
        actual = Solution().areNumbersAscending('sunset is at 7 51 pm overnight lows will be in the low 50 and 60 s')
        self.assertEqual(actual, False)


if __name__ == "__main__":
    unittest.main()
