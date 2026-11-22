import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().reverseVowels('IceCreAm')
        self.assertEqual(actual, 'AceCreIm')

    def test_example_2(self):
        actual = Solution().reverseVowels('leetcode')
        self.assertEqual(actual, 'leotcede')


if __name__ == "__main__":
    unittest.main()
