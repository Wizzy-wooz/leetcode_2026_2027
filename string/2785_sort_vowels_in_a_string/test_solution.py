import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().sortVowels('lEetcOde')
        self.assertEqual(actual, 'lEOtcede')

    def test_example_2(self):
        actual = Solution().sortVowels('lYmpH')
        self.assertEqual(actual, 'lYmpH')


if __name__ == "__main__":
    unittest.main()
