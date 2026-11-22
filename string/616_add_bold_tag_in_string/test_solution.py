import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().addBoldTag('abcxyz123', ['abc', '123'])
        self.assertEqual(actual, '<b>abc</b>xyz<b>123</b>')

    def test_example_2(self):
        actual = Solution().addBoldTag('aaabbb', ['aa', 'b'])
        self.assertEqual(actual, '<b>aaabbb</b>')


if __name__ == "__main__":
    unittest.main()
