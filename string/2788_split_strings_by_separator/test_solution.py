import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().splitWordsBySeparator(['one.two.three', 'four.five', 'six'], '.')
        self.assertEqual(actual, ['one', 'two', 'three', 'four', 'five', 'six'])

    def test_example_2(self):
        actual = Solution().splitWordsBySeparator(['$easy$', '$problem$'], '$')
        self.assertEqual(actual, ['easy', 'problem'])

    def test_example_3(self):
        actual = Solution().splitWordsBySeparator(['|||'], '|')
        self.assertEqual(actual, [])


if __name__ == "__main__":
    unittest.main()
